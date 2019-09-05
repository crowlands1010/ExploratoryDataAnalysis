library(datasets)
## Download File
txtFile <- "./household_power_consumption.txt"
url       <- "http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
zipFile  <- "./household_power_consumption.zip"

# Check if file has been downloaded, if not then download.
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
par(mfrow=c(2,2),mar=c(4,4,2,1),oma=c(0,0,2,0))
with(consumptionDates, {
  plot(Global_active_power~DateTime, type="l",xlab="",ylab="Global Active Power (kilowatts)")
  plot(Voltage~DateTime, type="l",xlab="",ylab="Voltage (volt)")
  plot(Sub_metering_1~DateTime, type="l",xlab="",ylab="Global Active Power (kilowatts)")
  lines(Sub_metering_2~DateTime,col='Red')
  lines(Sub_metering_3~DateTime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power~DateTime, type="l",xlab="",ylab="Global Rective Power (kilowatts)") 
})

## Export to .png
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()