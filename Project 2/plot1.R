library(ggplot2)
library(plyr)

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

##Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
##Using the base plotting system, make a plot showing the total PM2.5 emission from 
##all sources for each of the years 1999, 2002, 2005, and 2008.
totalEmissions <- tapply(totalSCC$Emissions,totalSCC$year,sum)
plot(names(totalEmissions),totalEmissions,type="l",
     xlab="Year",ylab="Total PM2.5 emitted (tons)",
     col="#31a354",main=expression("Fine Particulate Emissions - US"))

##Export to .png
dev.copy(png,file="plot1.png",height=480,width=480)
dev.off()
