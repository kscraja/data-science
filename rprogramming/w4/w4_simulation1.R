
#rnorm -> generate normal random variables
#dnorm -> density distibution
#pnorm -> cumulative distribution
#qnorm -> quantile function

#similarly other distributions
#gamma, poi, etc..

set.seed(1)
rnorm(10)
rnorm(10)
summary(x)
rpois(10, 1)
rpois(10, 2)

set.seed(20)
x <- rnorm(100)
e <- rnorm(100, 0, 2)

y <- 0.5 + 2 * x + e
summary(y)
plot(x, y)

# binary random variable

set.seed(10)
x <- rbinom(100, 1, 0.5)
e <- rnorm(100, 0, 2)

y <- 0.5 + 2 * x + e
plot(x, y)

# generalized linear model

set.seed(1)
x <- rnorm(100)
log.mu <- 0.5 + 0.3 * x
y <- rpois(100, exp(log.mu))

plot(x, y)

# random sampling

set.seed(1)
sample(1:10, 4)
sample(1:10, 4)

sample(letters, 5)
sample(1:10)

sample(1:10, replace=T)
