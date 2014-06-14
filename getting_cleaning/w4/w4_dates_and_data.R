d1 = date()
d2 <- Sys.Date()
format(d2, "%a %b %d")

x = c("1jan1960", "10jan1960")
z <- as.Date(x, "%d%bY")

z[1] - z[2]

weekdays(d2)

months(d2)

julian(d2)

library(lubridate)