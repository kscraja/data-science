
# lattice plotting system depends on
# lattice and  grid packages - trellis graphics 

# no two-phase plotting as in base plotting system
# all plotting is done using single function call

# lattice functions

# histogram - histograms
# xyplot - scatter

# bwplot - box plot
# stripplot - like boxplot but with actual points

# dotplot : plots dots on violin strings
# splom: scatterplot matrix, like pairs in base plotting system
# levelplot, contourplot: for plotting "image" data

# xyplot
# xyplot(y-var ~ x-var | f * g, data)
# desc: do a scatter plot of y-var is plotted in y-axis, x-var is plotted along x-axis
# f and g are conditioning variables
# data - data frame to use when picking values for y-var and x-var

library(lattice)
library(datasets)
xyplot(Ozone ~ Wind, data=airquality)

airquality <- transform(airquality, Month=factor(Month))
xyplot(Ozone ~ Wind | Month, data=airquality, layout=c(5, 1))

# behaviour difference
# lattice plotting functions don't print to graphic devices
# every plotting function returns a object of type 'trellis'
# the trellis object can then be printed
# the r-console can print 'trellis' object - just like printing on console
# the 'trellis' object can be saved/stored but it is better to save code and data
# using which the trellis object can be regenerated at a later time

p <- xyplot(Ozone ~ Wind, data=airquality)
print(p)

# lattice system can plot on multiple panels
# these panel functions can be configured
# lattice system provides x,y coordinates for the data points
# panel system can then actual do the painting etc.

set.seed(10)
x <- rnorm(100)
f <- rep(0:1, each=50)
y <- x +f - f *x + rnorm(100, sd=0.5)
f <- factor(f, labels=c("Group 1", "Group 2"))
xyplot(y ~ x | f, layout=c(2, 1))

## custom panel function

# horizontal line at median
xyplot(y ~ x | f, panel = function(x, y, ...) {
    panel.xyplot(x, y, ...) # first call the default panel function for xyplot
    panel.abline(h=median(y), lty=2)
})

# linear regression line at median
xyplot(y ~ x | f, panel = function(x, y, ...) {
    panel.xyplot(x, y, ...) # first call the default panel function for xyplot
    panel.lmline(x, y, col=2)
})


