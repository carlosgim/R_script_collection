
rankhospital <- function(state = "TX", outcome = "heart failure", num = 4) {

        data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
        if (is.element(state, data[,7])) {

           if (outcome == "heart attack")         { column = 11
           } else if (outcome == "heart failure") { column = 17
           } else if (outcome == "pneumonia")     { column = 23        
           } else { 
              print("please choose one of the follow desease")
              print("- heart attack")
              print("- heart failure")
              print("- pneumonia")
           }
              if (num == "best") { num <- 1}
              states <- data[data[,7] == state, ]
              states[,column] = as.numeric(as.character(states[, column]))
              # Order the values
              lowest <- states[order(states[,column], states[,2]),c(2,column)]
              # Clear NA values from rows
              lowest <- na.omit(lowest)
              # Construct the rank
              rank <- c(1:nrow(lowest))
              # Add the rank vector
              lowest <- data.frame(lowest, rank)
              # Change the colnames
              colnames(lowest) <- c("Hospital", "Rate", "Rank")
              # Set worst rank
              if (num == "worst") { num <-nrow(lowest)}
              # Final print
              print(lowest[num,])
#              print(lowest)

        } else { print("invalid state")}
}
