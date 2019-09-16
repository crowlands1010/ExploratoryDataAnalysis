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

## How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City?
motorvehicleEmissions<- totalSCC[which(totalSCC$SCC %in% SCC[grep("motor",SCC$SCC.Level.Three,ignore.case = TRUE),"SCC"] 
                             & totalSCC$fips=="24510"),]
g<-ggplot(motorvehicleEmissions,aes(year,Emissions))
g+geom_line(stat = "summary",fun.y="sum",col="#31a354")+ 
  labs(title="Motor Vehicle Emissions - Baltimore City",x="Year",y="Emissions")

##Export to .png
dev.copy(png,file="plot5.png",height=480,width=480)
dev.off()