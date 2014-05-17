f <- function(a, b=1, c =2, d = NULL) { # name params, default args
  a^2
}

f <- function(a, b) { # lazy evaluation
  a^2
}

f <- function(a, b=100) {
  print(a)
  print(b)
}

# f(45)

myplot <- function(x, y, type="1", ...) {
  plot(x, y, type=type, ...)
}


add2 <- function(x, y) {
  x + y
}

above10 <- function(x) {
  use <- x > 10
  x[use]
}

above <- function(x, n=10) {
  use <- x > n
  x[use]
}

columnmean <- function(x, removeNA=TRUE) {
  nc <- ncol(x)
  means <- numeric(nc)
  for(i in 1:nc) {
    means[i] = mean(x[,i], na.rm = removeNA)
  }
  means
}

make.power <- function(n) {
  pow <- function(x) {
    x ^ n
  }
  pow
}

cube <- make.power(3)
square <- make.power(2)