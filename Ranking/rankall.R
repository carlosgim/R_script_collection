
rankall <- function(outcome = "heart attack", num = 20) {

        data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")

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
           # convert to numeric the "column"
           data[,column] = as.numeric(as.character(data[, column]))
           # create a factors
           factores <- as.factor(data[,7])
           factor <- as.character(factores)
           # vector of factors
           factor <- unique(factor)
           factor <- sort(factor, decreasing = FALSE)
           # Process each state
           eachstate <- list(); i <- 1
           finalframe <- data.frame(0)
           for (state in factor) {
              # Take one state
              datastate <- data[data[,7] == state, ]
              lowest <- datastate[order(datastate[,column], datastate[,2]),
                                  c(2,column,7)]

              lowest <- na.omit(lowest)
              # Construct the rank
              rank <- c(1:nrow(lowest))
              # Set worst rank
              if (num == "worst") { num <- nrow(lowest)}
              # Add the rank vector
              lowest <- data.frame(lowest, rank)
              eachstate[[i]] <- write.table(lowest[num,], col.name = FALSE, quote = FALSE)
              i <- i+1
              #finalframe <- rbind(finalframe[1,], lowest[num,])
           }
           eachstate <- na.omit(eachstate)
           eachstate <- as.data.frame(eachstate)
#           colnames(eachstate) <- c("Hospital", "Rate", "State", "Rank") 
           print(dim(eachstate))

}
