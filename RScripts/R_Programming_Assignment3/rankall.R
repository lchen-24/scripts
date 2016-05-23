rankall <- function(outcome, num="best") {
  ## Read outcome data
  data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  ## Check that state and outcome are valid
  
  outcome_list<-c("heart attack","heart failure", "pneumonia")
  
  if (!(outcome %in% outcome_list)) {
    stop("invalid outcome")
  }
  
  if (outcome %in% "heart attack") {
    smaller_data<-data.frame(data$State,data$Hospital.Name,data[,11])
  } else if (outcome %in% "heart failure") {
    smaller_data<-data.frame(data$State,data$Hospital.Name,data[,17])
  } else if (outcome %in% "pneumonia") {
    smaller_data<-data.frame(data$State,data$Hospital.Name,data[,23])
  }
  as.numeric.factor <- function(x) {as.numeric(levels(x))[x]}
  smaller_data[,3]<-as.numeric.factor(smaller_data[,3])
  ## Return hospital name in that state with the given rank
  smaller_data<-split(smaller_data,f=smaller_data$data.State)
  rank <- lapply( smaller_data , function(x) x[order( x[,3], x[,2] ),] )
  rank <- lapply( rank, function(x) x[complete.cases(x),])
  if (num=="best") {
    return(lapply(rank, function(x) head(x[1:2],1)))
  } else if (num=="worst") {
    return(lapply(rank, function(x) tail(x[1:2],1)))
  } else {
    return(lapply(rank, function(x) x[num,1:2]))
  }
  ## rate
}