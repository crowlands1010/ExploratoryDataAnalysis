library(datasets)
with(faithful,plot(eruptions,waiting))
title(main="Old Faithful Geyser Data")

pdf(file="myplot.pdf")
with(faithful,plot(eruptions,waiting))
title(main="Old Faithful Geyser Data")
dev.off() ##Close PDF file device
##PDF creates file to computer. Will not show up on screen

library(datasets)
with(faithful,plot(eruptions,waiting)) ##create plot onscreen device
title(main="Old Faithful Geyser Data") ##Main Title
dev.copy(png,file="geyserplot.png") ##copy plot to .png file
dev.off() ##CLOSE THE DEVICE! :)

