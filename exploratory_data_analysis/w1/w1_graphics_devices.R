
pdf(file="myplot.pdf") # first open device
svg(file="myplot.svg") # vector graphic
png(filename="myplot.png") # bitmapped graphics
X11()
with(faithful, plot(eruptions, waiting)) # plot it
title(main="Old Faithful Geyser data") # annotate it
dev.off() # close the device

dev.copy(png, file="copy_from_dev.png") # copy from any device to any other device\
dev.copy2pdf(file="copy.pdf")
dev.off()
