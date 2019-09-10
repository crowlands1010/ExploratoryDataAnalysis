library(ggplot2)

##Example dataset, comes w/ ggplot2 package
str(mpg)

##compared to the "helloworld" of ggplot2
qplot(displ,hwy,data = mpg) 

##add color variable to drv
qplot(displ,hwy,data = mpg,color = drv) 

##adding a geom
qplot(displ,hwy,data = mpg,geom = c("point","smooth")) 
##histogram
qplot(hwy,data = mpg,fill = drv)

##facets 
qplot(displ,hwy,data = mpg,facets = .~drv)
qplot(hwy,data = mpg,facets = drv~.,binwidth=2)

##Notes about axis limits
testdat <- data.frame(x=1:100,y=rnorm(100))
testdat[50,2] <- 100 ##outlier
plot(testdat$x,testdat$y,type = "l",ylim = c(-3,3))

g <- ggplot(testdat,aes(x = x,y = y))

g + geom_line()

g + geom_line() + ylim(-3,3)

g + geom_line() + coord_cartesian(ylim = c(-3,3))