library(stringr)

source("complete.R")

corr <- function(folder, threshold = 0) {

#   Set initial vectors

    vsulfate <- vector(); vnitrate <- vector()

    dir <- getwd()

    pathfile <- paste(dir,"/",folder, sep ="")

    files <- list.files(pathfile, all.files = FALSE)

    for (i in 1:length(files)) {

        var <- (complete(folder, i))

#   Selecciono que archivo tiene mediciones por encima del threshold

        if (var$nobs > threshold) {

#   Tomo los datos de los archivos de interes

            data_files <- read.csv(paste(pathfile,"/",files[i], sep=""), 
                                   header = TRUE, sep = ",", 
                                   na.strings = c("NA","NaN", " "))

#   Elimino los valores NA (Clean file)

            data_clean <- na.omit(data_files)
          
#   Extraigo los parametros de interes en cada detector

            print(cor(data_clean$sulfate, data_clean$nitrate))
            vsulfate <- c(vsulfate, data_clean$sulfate)
            vnitrate <- c(vnitrate, data_clean$nitrate)
        }
    }


print(summary(cor(vsulfate, vnitrate, use = "everything",
         method = c("pearson", "kendall", "spearman"))))

#print(length(vnitrate))
}

corr("specdata", 150)

