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

## Across the United States, how have emissions from coal combustion-related 
## sources changed from 1999-2008?
coalSCC <- totalSCC[which(totalSCC$SCC %in% SCC[grep("coal",SCC$Short.Name,ignore.case = TRUE),"SCC"]),]
g <- ggplot(coalSCC,aes(year,Emissions))
g+geom_line(stat = "summary",fun.y="sum",col="#31a354")+
    labs(title="Coal Emissions - US",x="Year",y="Coal Combustion Emissions")

##Export to .png
dev.copy(png,file="plot4.png",height=480,width=480)
dev.off()
