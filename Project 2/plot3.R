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
totalSCC$year <- as.factor(totalSCC$year)

## Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) 
## vtotalSCCariable, which of these four sources have seen decreases in emissions from 1999-2008 
## for Baltimore City? Which have seen increases in emissions from 1999-2008? Use the 
## ggplot2 plotting system to make a plot answer this question.
Baltimore <- filter(totalSCC,fips=="24510")
baltimoreEmissions <- ggplot(Baltimore, aes(year, Emissions))+
  labs(title="Fine Particulate Emissions - Baltimore City")+
   xlab("Years") + ylab("Total PM2.5 emitted (tons)")+scale_size_identity(0.1)
plot3 <- baltimoreEmissions+geom_bar(stat="identity", fill="purple") +facet_grid(.~type) 
print(plot3)

##Export to .png
dev.copy(png,file="plot3.png",height=480,width=480)
dev.off()
