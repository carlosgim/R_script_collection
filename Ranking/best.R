
#outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")

#head(outcome)
#print("summary")
#summary(outcome)
#str(outcome)
#dim(outcome)
#object.size(outcome)
#names(outcome)

# First assignmnet

#outcome[,11] <- as.numeric(outcome[,11])
#hist(outcome[,11])

# Second assignment
# =================
best <- function(state = "TX", outcome = "heart attack") {

        data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
       
        if (is.element(state, data[,7])) {

           if (outcome == "heart attack") {
              states <- data[data[,7] == state, ]
              lowest <- states[which.min(states[,11]),2]
              print(lowest)
           } else if (outcome == "heart failure") {            
              states <- data[data[,7] == state, ]
              lowest <- states[which.min(states[,17]),2]
              print(lowest)
           } else if (outcome == "pneumonia") {            
              states <- data[data[,7] == state, ]
              lowest <- states[which.min(states[,23]),2]
              print(lowest)
           } else { 
              print("please choose one of the follow desease")
              print("- heart attack")
              print("- heart failure")
              print("- pneumonia")
           }
         
        } else { print("invalid state")}
}
#best("LA", "heart attack")
