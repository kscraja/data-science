# ggplot2 system

# a package implementing  "Grammar of Graphics"(GG) by Leland Wilkinson
# written by Hadley Wickham 
# built on grid package
# third graphics system (base, lattice, ggplot2)

# GG represents abstraction of grapics ideas/objects
# Think "verb", "noun", "adjective" for graphics
# Allows for theory of graphics on which to build new graphics and graphics objects
# shorten the distance from mind to page

# In brief, the grammar tells us that statistical graphic is 
# mapping from data to aesthetic attributes(color, shape, size) of 
# geometric objects(points, lines, bars).
# The plot may also contain statistical transformations of the data
# and is drawn on a specific coordinate system

# plots are made up of aesthetics (size, shape, color) and geoms(points, lines)
# qplot() is the workhorse..similar to plot in base system
# ggplot() is the core function and very flexible for doing things that qplot() cannot do
# factors in a data frame are for grouping data and are good to lable and plot

library(ggplot2)
str(mpg)
qplot(displ, hwy, data=mpg) # x, y, data-frame
qplot(displ, hwy, data=mpg, color=drv) # auto legend, color aesthetic
qplot(displ, hwy, data=mpg, geom=c("point", "smooth"))

#histogram
qplot(hwy, data=mpg, fill=drv)

#facets..like panels in lattice
# .~drv -->  (left) ~ (right) --> (rows) ~ (cols)
# . -> all rows
# drv -> column name
qplot(displ, hwy, data=mpg, facets= drv~.) 
qplot(displ, hwy, data=mpg, facets= .~drv) 

qplot(hwy, data=mpg, facets=drv~., binwidth=2)

# assuming that there is a dataset maacs
# 1D plots
qplot(log(eno), data=maacs)
qplot(log(eno), data=maacs, fill=mopos)
qplot(log(eno), data=maacs, geom="density")
qplot(log(eno), data=maacs, geom="density", color=mopos)

#scatter plots
qplot(log(pm25), log(eno), data=maacs)
qplot(log(pm25), log(eno), data=maacs, shape=mopos)
qplot(log(pm25), log(eno), data=maacs, color=mopos)
qplot(log(pm25), log(eno), data=maacs, color=mopos, geom=c("point", "smooth"), method="lm")

#scatter plot with splitting into two panels using facets
qplot(log(pm25), log(eno), data=maacs, geom=c("point", "smooth"), method="lm", facets=.~mopos)
