library(datasets)
with(faithful,plot(eruptions,waiting))
title(main="Old Faithful Geyser Data")

pdf(file="myplot.pdf")
with(faithful,plot(eruptions,waiting))
title(main="Old Faithful Geyser Data")
dev.off() ##Close PDF file device
##PDF creates file to computer. Will not show up on screen

