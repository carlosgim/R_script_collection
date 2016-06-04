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

#   Tomo los datos de los archivos de interes

            data_files <- read.csv(paste(pathfile,"/",files[i], sep=""), 
                                   header = TRUE, sep = ",", 
                                   na.strings = c("NA","NaN", " "))

            data_clean <- na.omit(data_files)

            print(data_clean)
        }
    }

}

corr("specdata", 800)

