library(stringr)

source("complete.R")

corr <- function(folder, threshold = 0) {

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
          
            print(c("DETECTOR", i))

#   Extraigo los parametros de interes en cada detector

            print(length(data_clean$sulfate))
            print(length(data_clean$nitrate))
        }
    }

}

corr("specdata", 800)

