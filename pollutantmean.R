library(stringr)

pollutantmean <- function(folder, pollutant, id = 1:332) {

   dir <- getwd(); id <- str_pad(id, 3, pad= "0")

total = 0; observation = 0

   for (i in 1:length(id)) {

       pathfile <- paste(dir,"/",folder,"/",id[i],".csv", sep ="")

       data_files <- read.csv(pathfile, header = TRUE, sep = ",", na.strings = c("NA","NaN", " "))

# -- Long version --

       data_clean <- na.omit(data_files)

       observation = observation + nrow(data_clean)

       if (pollutant == "sulfate") { 
           total = total + sum(data_clean$sulfate) }
       else {  
           total = total + sum(data_clean$nitrate)}
  }

print(total/observation)

}


