pollutantmean<- function(directory,pollutant,id=1:332) {
  if (exists("y")) {
    y<-y
  } else {
    file_list<-list.files(directory)
    x<-lapply(paste(directory,"/",file_list,sep=""),read.csv)
    y<-do.call(rbind.data.frame,x)
    assign("y", y, envir=.GlobalEnv)
  }
  z<-y[which(y$ID %in% id),]
  bar <- function(pollutant) eval(parse(text=paste('z$',pollutant,sep='')))
  mean(bar(pollutant),na.rm=T)
}