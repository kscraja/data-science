x <- c(rnorm(10), runif(10), rnorm(10, 1))
f <- gl(3, 10)

tapply(x, f, mean, simplify=F)

split(x, f)

library(datasets)
s <- split(airquality, airquality$Month)

lapply(s, function(x) colMeans(x[, c("Ozone", "Solar.R", "Wind")]))

sapply(s, function(x) colMeans(x, c["Ozone", "Solar.R", "Wind"]))
sapply(s, function(x) colMeans(x, c["Ozone", "Solar.R", "Window"], na.rm=TRUE))

x <- rnorm(10)
f1 <- gl(2, 5)
f2 <- gl(5, 2)

interaction(f1, f2)
