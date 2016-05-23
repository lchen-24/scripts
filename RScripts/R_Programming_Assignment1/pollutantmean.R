#This function returns mean of pollutant from files of specified directory
pollutantmean<- function(directory,pollutant,id=1:332) {
  #check if data already exists
  if (exists("y")) {
    y<-y
  } else {
    #read file names into a list
    file_list<-list.files(directory)
    #lapply to read them as csv
    x<-lapply(paste(directory,"/",file_list,sep=""),read.csv)
    #put all into a single data frame
    y<-do.call(rbind.data.frame,x)
    #send to global environment
    assign("y", y, envir=.GlobalEnv)
  }
  z<-y[which(y$ID %in% id),]
  bar <- function(pollutant) eval(parse(text=paste('z$',pollutant,sep='')))
  #send mean
  mean(bar(pollutant),na.rm=T)
}