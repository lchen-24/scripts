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
  z<-data.frame(id=NA, nobs=NA)[numeric(0), ]
  for (i in id) {
    count<-sum(complete.cases(y[[i]]))
    temp<-data.frame(i,count)
    colnames(temp)<-c("id","nobs")
    z<-rbind(z,temp)
  }
  z
}