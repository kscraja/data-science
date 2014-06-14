library(nlme)
library(lattice)
xyplot(weight ~ Time | Diet, BodyWeight)

library(datasets)
p <- xyplot(Ozone ~ Wind | factor(Month), data=airquality)


#q 7

data(airquality)
airquality <- transform(airquality, Month=factor(Month))
qplot(Wind, Ozone, data=airquality, facets = . ~ Month)

g <- ggplot(movies, aes(votes, rating))
print(g)
