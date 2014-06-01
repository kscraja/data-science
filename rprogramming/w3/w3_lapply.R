x <- list(a = 1:5, b = rnorm(10))
lapply(x, mean)

x <- list(a = 1:4, b = rnorm(10), c = rnorm(20), d = rnorm(100, 5))
lapply(x, mean)

x <- 1:4
lapply(x, runif, min=0, max=10)

x <- list(a = matrix(1:4, 2,2), b = matrix(1:6, 3, 2))
lapply(x, function(e) e[,1])

x <- list(a = 1:4, b = rnorm(10), c = rnorm(20), d = rnorm(100, 5))
lapply(x, mean)

x <- matrix(rnorm(200), 20, 10)
apply(x, mean, 1) # 1 represents the dimension to preserve and other column to preserve
apply(x, sum, 2) # 2 ..will reult in a vector of size 20 with sums of the all the columns

a <- array(rnorm(2*2*10), c(2, 2, 10))
apply(a, c(1,2), mean)