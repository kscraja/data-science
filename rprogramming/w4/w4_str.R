library(datasets)
s <- split(airquality, airquality$Month) # splits the data frame based on Month factor variable
str(s)
s$`9` # accesssing a specific part of the data frame


#lapply, sapply, <- applying functions on list
#apply <- over the marigins of an array - summaries of matrices of higher
#tapply <- table - apply, subsets of the vector
# split <- splits objects into sub pieces
#mapply <- multivariate version

#lapply -> function(x, function, ...). x is coerced into list(data record)

x <- list(a=1:5, b = rnorm(10))
o <- lapply(x, mean) # applies mean to every element of the list x. 
# always returns list (after coercing x into a list)

x <- 1:4
o <- lapply(x, runif) # any extra parameters after function name are be passed on to the function

x <- list(a=matrix(1:4, 2,2), b=matrix(1:6, 3,2))
o <- lapply(x, function(elt) elt[,1])

# sapply -similar to lapply, but will simplify the result of lapply if possible
# instead of returning list, will try to return a vector , by picking the elements from the result of lapply.
# but only when possible

x <- list(a=1:4, b=rnorm(4))
o <- sapply(x, mean) # any extra parameters after function name are be passed on to the function

#apply is used to evaluate a function over margins of an array
# it is often used to apply function to the rows or columns of a matrix
# not faster than a loop

x <- matrix(rnorm(200), 20, 10)
apply(x, 2, mean)
apply(x, 1, sum)
# rowSums ==== apply(x, 1, sum)
# colSums ==== apply(x, 2, sum)

x <- matrix(rnorm(200), 20, 10)
apply(x, 1, quantile, probs=c(0.25, 0.75)) # quantile function - parts of the distribution

#tapply is used to apply a function over subsets of a vector
#tapply(x, index, fun, ..., simplify=true)
# x -> vector
# index -> factor vector for grouping x and applying fun on the group

x <- c(rnorm(10), runif(10), rnorm(10, 1))
f <- gl(3, 10)
tapply(x, 1:30, mean)

#split takes a vector or other objects and splits it into groups determined by the factor

#split -> function(x, f, drop=F)
# x -> vector or data frame
# f -> factor
# drop - whether empty factor levels should be dropped or not
# returns a list of splitted groups

x <- c(rnorm(10), runif(10), rnorm(10, 1))
f <- gl(3, 10)
o <- split(x, f)

# common idiom is to split and lapply
lapply(split(x, f), mean)

library(datasets)
head(airquality)
s <- split(airquality, airquality$Month)
lapply(s, function(x) colMeans(x[, c("Ozone", "Solar.R", "Wind")]))

#splitting at multiple factor levels
f1 <- gl(2, 5)
# split(x, list(f1, f2))