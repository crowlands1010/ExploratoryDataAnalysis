library(datasets)
## Download File
txtFile <- "./household_power_consumption.txt"
url       <- "http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
zipFile  <- "./household_power_consumption.zip"

if (!file.exists("./household_power_consumption.txt")) {
  download.file(url, destfile = zipFile)
  unzip(zipFile)
  file.remove(zipFile)
}

## Read File
consumption <- read.table("household_power_consumption.txt", sep=";", 
                          header=TRUE,na.strings="?")
consumptionDates <- consumption[(consumption$Date=="1/2/2007"|consumption$Date=="2/2/2007"), ]

consumptionDates$Date <- as.Date(consumptionDates$Date,format="%d/%m/%Y")
dateTime <- paste(consumptionDates$Date,consumptionDates$Time)
consumptionDates$DateTime <- as.POSIXct(dateTime)

## Plot Data
plot(consumptionDates$Global_active_power~consumptionDates$DateTime,type="l",
     xlab="",ylab="Global Active Power (kilowatts)")

## Export to .png
dev.copy(png,file="plot2.png",height=480,width=480)
dev.off()
