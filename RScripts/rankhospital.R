rankhospital <- function(state, outcome, num="best") {
  ## Read outcome data
  data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  ## Check that state and outcome are valid
  if (!(state %in% data$State)) {
    stop("invalid state")
  }
  
  outcome_list<-c("heart attack","heart failure", "pneumonia")
  
  if (!(outcome %in% outcome_list)) {
    stop("invalid outcome")
  }
  ## Only get what we need
  data<-data[which(data$State %in% state),]
  
  if (outcome %in% "heart attack") {
    smaller_data<-data.frame(data$Hospital.Name,data[,11])
  } else if (outcome %in% "heart failure") {
    smaller_data<-data.frame(data$Hospital.Name,data[,17])
  } else if (outcome %in% "pneumonia") {
    smaller_data<-data.frame(data$Hospital.Name,data[,23])
  }
  as.numeric.factor <- function(x) {as.numeric(levels(x))[x]}
  smaller_data[,2]<-as.numeric.factor(smaller_data[,2])
  ## Return hospital name in that state with the given rank
  rank <- smaller_data[order(smaller_data[,2],smaller_data[,1]),]
  rank <- rank[complete.cases(rank),]
  if (num=="best") {
    return(head(rank[1],1))
  } else if (num=="worst") {
    return(tail(rank[1],1))
  } else {
    return(rank[num,1])
  }
  ## rate
}