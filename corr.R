library(stringr)

source("complete.R")

corr <- function(folder, threshold = 0) {

#   Set initial vectors

    vsulfate <- vector(); vnitrate <- vector()
    correl <- numeric()

    dir <- getwd()

    pathfile <- paste(dir,"/",folder, sep ="")

    files <- list.files(pathfile, all.files = FALSE)

    framedf <- complete(folder)
    print(class(framedf))
#   Selecciono que archivo tiene mediciones por encima del threshold
 
    ids <- framedf[framedf["nobs"] > threshold, ]$id

    for (i in ids) {

#   Tomo los datos de los archivos de interes

            data_files <- read.csv(paste(pathfile,"/",files[i], sep=""), 
                                   header = TRUE, sep = ",", 
                                   na.strings = c("NA","NaN", " "))

#   Elimino los valores NA (Clean file)

            data_clean <- na.omit(data_files)
          
#   Extraigo los parametros de interes en cada detector
            correl <- c(correl, cor(data_clean$sulfate, data_clean$nitrate))


        }

            return(correl)
    }

cr <- corr("specdata", 400)

head(cr)

print(summary(cr))

