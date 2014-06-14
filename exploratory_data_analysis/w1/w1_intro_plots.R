par(mar=rep(2,4))
boxplot(airquality$Temp, col="blue")
hist(airquality$Temp, col="yellow")
rug(airquality$Temp)
hist(airquality$Temp, col="yellow", breaks=100)
rug(airquality$Temp)
boxplot(airquality$Temp, col="blue")
abline(h=85)
hist(airquality$Temp, col="yellow", breaks=100)
abline(v=85, lwd=2)
abline(v=median(airquality$Temp), col="magenta")
barplot(table(airquality$Month), col="wheat", main="mainlabel")

# 2d plots - histogram
par(mfrow=c(2,1), mar=c(4,4,2,1))
hist(subset(airquality, month==5)$Temp, col="green")
hist(subset(airquality, Month==6)$Temp, col="green")

# scatter plots
with(airquality, plot(Temp, Ozone, col=Month))

