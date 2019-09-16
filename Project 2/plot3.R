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

## Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) 
## variable, which of these four sources have seen decreases in emissions from 1999-2008 
## for Baltimore City? Which have seen increases in emissions from 1999-2008? Use the 
## ggplot2 plotting system to make a plot answer this question.
subEmissions <- subset(totalSCC,fips="24510")
g <- ggplot(subEmissions,aes(year,Emissions,color=type))
g+geom_line(stat="summary",fun.y="sum")+labs(main="Fine Particulate Emissions - Baltimore City",
                                             xlab="Year",ylab="Total PM2.5 emitted (tons)")

##Export to .png
dev.copy(png,file="plot3.png",height=480,width=480)
dev.off()
