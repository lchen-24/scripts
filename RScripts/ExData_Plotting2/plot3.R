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
baltimore <- NEI[which(NEI$fips=="24510"),]
totalyearlyemissions <- aggregate(Emissions~year+type, data=baltimore, FUN="sum")

library(ggplot2)

### Plot graph ###
png("plot3.png")
options("scipen" = 20)
ggplot(data=totalyearlyemissions, aes(x=year,y=Emissions,color=type))+geom_line()+ggtitle("Total Emissions for each Source Type from 1999 to 2008, Baltimore")
dev.off()
