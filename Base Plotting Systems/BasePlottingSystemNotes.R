## Base Plotting System in R
## Lecturer: Roger D. Peng
## Johns Hopkins University
## Notes for Courtney Rowlands
## For: Coursera Exploratory Data Analysis

library(datasets)
hist(airquality$Ozone) ##draws new plot

library(datasets)
with(airquality,plot(Wind,Ozone))

library(datasets)
airquality <- transform(airquality,Month=factor(Month))
boxplot(Ozone~Month,airquality,xlab="Month",ylab="Ozone(ppb)")

library(datasets)
with(airquality,plot(Wind,Ozone))
title(main="Ozone and Wind in NYC") ##This adds title

##alternate w/month of May and color blue
with(airquality,plot(Wind,Ozone,main="Ozone and Wind in NYC"))
with(subset(airquality,Month==5),points(Wind,Ozone,col="blue"))
ic
##w/more annotation
with(airquality,plot(Wind,Ozone,main="Ozone and Wind in NYC",type="n")) ##sets up w/o plotting
with(subset(airquality,Month==5),points(Wind,Ozone,col="blue"))
with(subset(airquality,Month!=5),points(Wind,Ozone,col="red"))
legend("topright",pch=1,col=c("blue","red"),legend=c("May","Other Months"))

##w/regression line
with(airquality,plot(Wind,Ozone,main="Ozone and Wind in NYC"),
     pch=20)
model <- lm(Ozone~Wind,airquality)
abline(model,lwd=2)

##multiple base plots
par(mfrow=c(1,2))
with(airquality,{
  plot(Wind,Ozone,main="Ozone and Wind")
  plot(Solar.R,Ozone,main="Ozone and Solar Radiation")
})

##three base plots
par(mfrow=c(1,3),mar=c(4,4,2,1),oma=c(0,0,2,0))
with(airquality,{
  plot(Wind,Ozone,main="Ozone and Wind")
  plot(Solar.R,Ozone,main="Ozone and Solar Radiation")
  plot(Temp,Ozone,main="Ozone and Temerature")
  mtext("Ozone and Wether in NYC",outer=TRUE)
})