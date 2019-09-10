library(lattice)
library(datasets)

##simple scatterplot
xyplot(Ozone~Wind,data=airquality)

##Convert 'Month' to a factor variable
airquality <- transform(airquality,Month=factor(Month))
xyplot(Ozone~Wind|Month,data=airquality,layout=c(5,1))

##Lattice behavior
p <- xyplot(Ozone~Wind,data=airquality) ##declare 'p' as function. Nothing happens.
print(p) ##displays the plot

xyplot(Ozone~Wind,data=airquality) ##no function declared. Auto-prints the plot.

##Lattice Panel Functions
set.seed(10)
x <- rnorm(100)
f <- rep(0:1,each=50)
y <- x+f-f*x+rnorm(100,sd=0.5)
f <- factor(f,labels=c("Group 1","Group 2"))
xyplot(y~x|f,layout=c(2,1)) ##Plots w/ 2 panels

##Custom panel function
xyplot(y~x|f,panel=function(x,y,...){
  panel.xyplot(x,y,...) ##first call the default panel function for 'xyplot'
  panel.abline(h=median(y),lty=2) ##add horizontal line at the median
})

##Regression Line
xyplot(y~x|f,panel=function(x,y,...){
  panel.xyplot(x,y,...) ##first call the default panel function
  panel.lmline(x,y,col=2) ##overlay a simple linear regression line
})