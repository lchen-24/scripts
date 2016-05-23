best <- function(state, outcome) {
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
  ## Return hospital name in that state with lowest 30-day death
  min_list<-smaller_data$data.Hospital.Name[smaller_data[,2]==min(smaller_data[,2],na.rm=TRUE)]
  min_list<-min_list[!is.na(min_list)]
  min_list<-head(sort(min_list),1)
  min_list
  ## rate
}