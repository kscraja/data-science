set.seed(1)
rpois(5, 2)

set.seed(10)
x <- rbinom(10, 10, 0.5)
e <- rnorm(10, 0, 20)
y <- 0.5 + 2 * x + e

y <- sample(1:100)
x1 <- sample(1:100)
x2 <- sample(1:100)

library(datasets)
Rprof()
fit <- lm(y ~ x1 + x2)
r <- Rprof(NULL)
summaryRprof(r)
