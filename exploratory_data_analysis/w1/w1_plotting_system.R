#base plotting system
# piece together line by line

# start with blank canvas
# start with plot function
# use annotations to add/modify (text, lines, points, axis)

library(datasets)
data(cars)
with(cars, plot(speed, dist))

#lattice system
#single function call xyplot, bwplot
#panel plots

library(lattice)
state <- data.frame(state.x77, region=state.region)
xyplot(Life.Exp ~ Income | region, data=state, layout=c(2,2))
