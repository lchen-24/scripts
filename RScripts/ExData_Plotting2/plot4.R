### Download file if does not exist ###
filename <- "exdata%2Fdata%2FNEI_data.zip"

if (!file.exists(filename)){
  fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
  download.file(fileURL, filename, method="curl")
}

### Unzip files if they do not exist ###
if (!file.exists("summarySCC_PM25.rds")) { 
  unzip(filename) 
}

### Read files ###
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

### Sum up emissions by year ###
merge <- merge(NEI,SCC, by.x="SCC", by.y="SCC")
coal <- merge[which(grepl("coal",merge$Short.Name,ignore.case=T)),]
totalyearlyemissions <- aggregate(Emissions~year, data=coal, FUN="sum")

library(ggplot2)

### Plot graph ###
png("plot4.png")
options("scipen" = 20)
barplot(height=totalyearlyemissions$Emissions,names.arg=totalyearlyemissions$year,main="Total Emissions from coal sources from 1999 to 2008",ylab="Amount of PM2.5 emitted, in tons",xlab="Year")
dev.off()
