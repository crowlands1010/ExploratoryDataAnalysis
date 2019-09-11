library(grDevices)
colors()

##colorRamp Function
pal <- colorRamp(c("red","blue"))
pal(0)
pal(1)
pal(0.5)
pal(seq(0,1,len=10))

##colorRampPalette Function
pal <- colorRampPalette(c("red","yellow"))
pal(2)
pal(10)
pal(20)
pal(100)

##RColorBrewer Package and colorRampPalette
install.packages("RColorBrewer")
library(RColorBrewer)
cols <- brewer.pal(3,"BuGn")
cols
pal <- colorRampPalette(cols)
image(volcano,col=pal(20))

##The smoothSCatter function
x <- rnorm(10000)
y <- rnorm(10000)
smoothScatter(x,y)
