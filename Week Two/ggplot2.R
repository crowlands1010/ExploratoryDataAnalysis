library(ggplot2)

##Example dataset, comes w/ ggplot2 package
str(mpg)

##compared to the "helloworld" of ggplot2
qplot(displ,hwy,data=mpg) 

##add color variable to drv
qplot(displ,hwy,data=mpg,color=drv) 

##adding a geom
qplot(displ,hwy,data=mpg,geom=c("point","smooth")) 
##histogram
qplot(hwy,data=mpg,fill=drv)

##facets 
qplot(displ,hwy,data=mpg,facets=.~drv)
qplot(hwy,data=mpg,facets=drv~.,binwidth=2)

