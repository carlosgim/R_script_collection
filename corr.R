library(stringr)

source("complete.R")

corr <- function(folder, threshold = 0) {

    dir <- getwd()

    pathfile <- paste(dir,"/",folder, sep ="")

    files <- list.files(pathfile, all.files = FALSE)

    for (i in 1:length(files)) {

        var <- (complete(folder, i))

#   Selecciono que archivo tiene mediciones

        if (var$nobs > threshold) {

            print(var$nobs)

#   Tomo los datos de los archivos de interes

            data_files <- read.csv(pathfile, header = TRUE, sep = ",", 
                                   na.strings = c("NA","NaN", " "))
        }
    }
#    Evaluo si el número de casos es suficiente para considerar
#    el monitor

}

corr("specdata", 800)

