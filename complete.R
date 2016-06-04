library(stringr)

complete <- function(folder, id = 1:332) {

   dir <- getwd(); id <- str_pad(id, 3, pad= "0")

idlist <- list(0); count <- list(0)

   for (i in 1:length(id)) {

       pathfile <- paste(dir,"/",folder,"/",id[i],".csv", sep ="")

       data_files <- read.csv(pathfile, header = TRUE, sep = ",", na.strings = c("NA","NaN", " "))

# -- Long version --

       data_clean <- na.omit(data_files)

#       if (nrow(data_clean) > 0) {
       idlist[i] <- as.numeric(id[i]); count[i] <- nrow(data_clean)
  }
storedata <- do.call(rbind, Map(data.frame, id = idlist, nobs = count))

#print(storedata)

}


