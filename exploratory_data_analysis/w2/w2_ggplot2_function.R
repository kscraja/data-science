# fundamental ggplot2
# layering with other attribs

g <- ggplot(maacs, aes(logpm25, NocturnalSympt)) # aesthetics

summary(g) # g is ggplot2 object, not printable. It doesn't know what elements to use (points, lines etc.)

p <- g + geom_point() # adding geom attribs (has some defaults). p is another ggplot2 instance

# adding more layers 
g + geom_point() + geom_smooth() # another smoother

g + geom_point() + geom_smooth(method="lm") # linear model - smoothing

# facet layer

g + geom_point() + facet_grid(. ~ bmicat) + geom_smooth(method="lm")

# annotations
# 
# Labels: xlab(), ylab(), labs(), ggtitle()
# Each of geom_* functions have options to modify
# Use theme for global effect e.g theme(legend.position = "none")
# Two standard themes 
# - theme_gray() - default theme
# - theme_bw() - black-white

# modifying aesthetics
g + geom_point(color="steelblue", size=4, alpha=1/2) 

# different colors based on bmicat
g + geom_point(aes(color=bmicat), size=4, alpha=1/2)

# better labelling
g + geom_point(aes(color=bmicat), size=4, alpha=1/2) + labs(title="MAACS Cohort")
+ labs(x = expression("log" * PM[2.5]), y= "Nocturnal Symptoms")

# modifying geom_smooth function
g + geom_point(aes(color=bmicat), size=4, alpha=1/2) + geom_smooth(size=4, linetype=3, method="lm", se=FALSE)

# theming

g + geom_point(aes(color=bmicat), size=4, alpha=1/2) + teheme_bw(base_familty="Times")

