par(bg="white", mfrow=c(1,1), pch=20, mar=c(4, 4, 2,2))
x <- rnorm(100)
hist(x, breaks=20)

y <- rnorm(100)
plot(x, y, pch=20)
z <- rnorm(100)
plot(x, z)

example(points) # walks you through the few example plots

x <- rnorm(100)
y <- rnorm(100)
plot(x, y, pch=20)
title("scatter plot")
text(-2, 2, "Label")
legend("topright", legend="Data", pch=20)
fit <- lm(y ~ x)
abline(fit)
abline(fit, lwd=3)
z <- rpois(100, 2)

# putting two plots
par(mfrow=c(2, 1), mar=c(4, 4, 2, 2))
plot(x, y, pch=20)
plot(x, z, pch=19)

# another example

par(mfrow=c(1,1))
x <- rnorm(100)
y <- x + rnorm(100)
g <- gl(2, 50, labels=c("Male", "Female"))g

str(g)
plot(x, y, type="n")
points(x[g == "Male"], y[g== "Male"], col="green")
points(x[g == "Female"], y[g== "Female"], col="blue")
