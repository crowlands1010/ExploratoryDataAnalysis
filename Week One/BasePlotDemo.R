x <- rnorm(100)
hist(x) 

y <- rnorm(100)
plot(x,y)

z <- rnorm(100)
plot(x,z)
plot(x,y)

par(mar=c(2,2,2,2))
plot(x,y)

par(mar=c(4,4,2,2))
plot(x,y)

plot(x,y,pch=20) ## circle
plot(x,y,pch=19) ## circle-ish
plot(x,y,pch=2)  ## triangle
plot(x,y,pch=3)  ## plus sign
plot(x,y,pch=4)  ## x

example("points") ## goes through plot point symbol examples, cool stuff.

x <- rnorm(100)
hist(x) 
y <- rnorm(100)
plot(x,y)
plot(x,y,pch=20)
title("Scatterplot")
text(-2,-2,"This is a label")
legend("topleft",legend="Data",pch=20)
fit <- lm(y ~ x)
abline(fit)
abline(fit,lwd=3,col="blue")

plot(x,y,xlab="weight",ylab=("height"),main="scatterplot",pch=20)
legend("topright",legend="Data",pch=20)
fit <- lm(y ~ x)
abline(fit,lwd=3,col="yellow")

z <- rpois(100,2)
par(mfrow=c(1,2))
plot(x,y,pch=20)
plot(x,z,pch=19)
par("mar")
par(mar=c(4,4,2,2))

x <- rnorm(100)
y <- x+rnorm(100)
g <- gl(2,50)
g <- gl(2,50,labels=c("Male","Female"))
str(g)

plot(x,y)
plot(x,y,type="n")
points(x[g=="Male"],y[g=="Male"],col="Green")
points(x[g=="Female"],y[g=="Female"],col="Purple")
