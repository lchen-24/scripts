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
baltimore$city<- "Baltimore"
los_angeles <- NEI[which(NEI$fips=="06037"),]
los_angeles$city<- "Los Angeles"
big<- rbind(baltimore,los_angeles)
merge <- merge(big,SCC, by.x="SCC", by.y="SCC")
motor <- merge[which(grepl("vehicles",merge$EI.Sector,ignore.case=T)),]
totalyearlyemissions <- aggregate(Emissions~year+city, data=motor, FUN="sum")

library(ggplot2)

### Plot graph ###
png("plot6.png")
options("scipen" = 20)
ggplot(data=totalyearlyemissions, aes(x=year,y=Emissions))+geom_bar(stat="identity")+ggtitle("Total Emissions motor vehicle from 1999 to 2008, Baltimore vs LA")+facet_grid(.~city)
dev.off()
