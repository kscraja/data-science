exestData <- read.csv("./data/restaurants.csv")

#creating indexes

seq(1,10, by=2)
seq(1,10, length=3)

x <- c(1,3,8,25,100);
seq(along=x)

restData$nearMe = restData$neighborhood %in% c("Roland Park", "Homeland")
table(restData$nearMe)

restData$zipWrong = ifelse(restData$zipCode < 0, TRUE, FALSE)
table(restData$zipWrong, restData$zipCode < 0)

# quantitative into categorical
restData$zipGroups = cut(restData$zipCode, breaks=quantile(restData$zipCode))

restData$zcf <- factor(restData$zipCode)
# library(Hmisc)
restData$zipGroups = cut2(restData$zipCode, g=4)

#library(plyr)
restData2 = mutate(restData, zipGroups = cut2(zipCode, g=4))
table(restData$zipGroups)