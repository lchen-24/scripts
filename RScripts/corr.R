corr<- function(directory,threshold=0) {
  #check if data already exists
  if (exists("y")) {
    y<-y
  } else {
    #read file names into a list
    file_list<-list.files(directory)
    #lapply to read them as csv
    x<-lapply(paste(directory,"/",file_list,sep=""),read.csv)
    y<-x
    assign("y", y, envir=.GlobalEnv)
  }
  source("/home/lukechen/R/RScripts/complete.R")
  id_list<-complete("specdata")
  filter<-id_list[which(id_list$nobs>threshold)]
}