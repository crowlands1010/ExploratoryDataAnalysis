library(datasets)
## Download File
txtFile <- "./household_power_consumption.txt"
url       <- "http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
zipFile  <- "./household_power_consumption.zip"

# Check if the data is downloaded and download when applicable
if (!file.exists("./household_power_consumption.txt")) {
  download.file(url, destfile = zipFile)
  unzip(zipFile)
  file.remove(zipFile)
}

## Read File
consumption <- read.table("household_power_consumption.txt", sep=";", 
                        header=TRUE,na.strings="?")
specConsumption <- consumption[(consumption$Date=="1/2/2007"|consumption$Date=="2/2/2007"), ]

## Plot data - histogram
hist(specConsumption$Global_active_power,main="Global Active Power",
     xlab="Global Active Power (kilowatts)",ylab="Frequency",col="red",
     )

## Date comparison between full dataset and specified date
## hist(consumption$Global_active_power,main="Global Active Power",
##     xlab="Global Active Power (kilowatts)",ylab="Frequency",col="red",
## )

## Export to .png
dev.copy(png,file="plot1.png")
dev.off()