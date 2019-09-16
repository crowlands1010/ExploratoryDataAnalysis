library(ggplot2)
library(dplyr)

## Download and extract zip file
if (!file.exists("data")) {
  dir.create("data")
}

fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip" ##testdata
download.file(fileUrl,destfile="./data/FNEI_data.zip")

unzip(zipfile="./data/FNEI_data.zip",exdir="./data")

##Read files
SCC <- readRDS(file="data/Source_Classification_Code.rds")
summarySCC <- readRDS(file="data/summarySCC_PM25.rds")

##Merge files
totalSCC <- merge(SCC,summarySCC)

## Compare emissions from motor vehicle sources in Baltimore City with emissions from 
## motor vehicle sources in Los Angeles County, California (fips=="06037"). Which city has seen 
## greater changes over time in motor vehicle emissions?
motorvehicleEmissions <- totalSCC[which(totalSCC$SCC %in% 
                                          SCC[grep("motor",SCC$SCC.Level.Three,ignore.case = TRUE),"SCC"]),]
compareEmissions <- c("24510","06037")
subMotorEmissions <-subset(motorvehicleEmissions,fips %in% compareEmissions)
g <- ggplot(subMotorEmissions,aes(year,Emissions,color=fips))
g+geom_line(stat = "summary",fun.y="sum")+ 
  labs(title="Motor Emissions - Baltimore City & Los Angeles County",x="Year",y="Emissions")+
  scale_colour_discrete(name ="City",label=c("Los Angeles","Baltimore"))

##Export to .png
dev.copy(png,file="plot6.png",height=480,width=480)
dev.off()
