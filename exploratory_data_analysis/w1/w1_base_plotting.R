library(datasets)
par(bg="wheat", las=2, mfcol=c(1,1), pch=1)
hist(airquality$Ozone, lty="dotted", lwd=3, col="yellow")
with(airquality, plot(Wind, Ozone, pch=7))

airquality <- transform(airquality, Month=factor(Month))
boxplot(Ozone ~ Month, airquality, xlab="Month", ylab="Ozone (ppb)")


#plot
#lines
#points
points(70, 20)
# text
text(100, 0, "text label")
#title
title("Hello tehre..title", sub="sub title", xlab="xlabel")

#type =n doesnot print any marks..just initializes the plot
with(airquality, plot(Wind, Ozone, type="n", main="Ozone and Wind in New York City"))
with(subset(airquality, Month==5), points(Wind, Ozone, col="blue", pch=1))
with(subset(airquality, Month!=5), points(Wind, Ozone, col="red", pch=1))
legend("topright", pch=1, col=c("blue", "red"), legend=c("May", "Other Montsh"))

#another plot
with(airquality, plot(Wind, Ozone, main="Ozone and Wind in New York City", pch=20))
model <- lm(Ozone ~ Wind, airquality) # linear model
abline(model, lwd=2) # annotation function to draw a line given a model

#multiple plot
par(mfrow=c(1, 2))
with(airquality, {
    plot(Wind, Ozone, main="Ozone and Wind")
    plot(Solar.R, Ozone, main="Ozone and Solar Radiation")
})

# 3 plots

par(mfrow=c(1, 3), mar=c(4, 4, 2, 1), oma=c(0, 0, 2, 0), las=1)
with(airquality,{
    plot(Wind, Ozone, main="Ozone and Wind")
    plot(Solar.R, Ozone, main="Ozone and Solar Radiation")
    plot(Temp, Ozone, main="Ozone and Temperature")
    mtext("Ozone and Weather in New York City", outer=TRUE)
})