
testdat <- data.frame(x = 1:100, y=rnorm(100))
testdat[50, 2] <- 100 # outlier

plot(testdat$x, testdat$y, type= "l", ylim=c(-3, 3))

# outlier screws it up
g <- ggplot(testdat, aes(x = x, y = y))
g + geom_line()


g + geom_line() + ylim(-3, 3)

g + geom_line() + coord_cartesian(ylim = c(-3, 3))

## little more complex based on MAACS

g <- ggplot(maacs, aes(logpm25, NocturnalSympt))

g + geom_point(alpha = 1/3)
  + facet_wrap(bmicat ~ no2dec, nrow=2, ncol=4)
  + geom_smooth(method = "lm", se=FALSE, col="steelblue")
  + theme_bw(base_family = "Avenir", base_size = 10)
  + labs(x = experssion("log " * PM[2.5]))
  + labs(y = "Nocturnal Symptoms")
  + labs(title = "MAACS Cohort")

