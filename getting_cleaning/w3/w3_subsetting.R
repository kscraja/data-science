set.seed(13435)
X <- data.frame("var1"=sample(1:5), "var2"=sample(6:10), "var3"=sample(11:15))
print(X)
selection <- sample(1:5)
print(selection)
X <- X[selection,]; X$var2[c(1,3)] = NA
print(X)

downloadRestaurantsData <- function() {
  if(!file.exists("./data")) {dir.create("./data")}
  
  url <- "https://data.baltimorecity.gov/api/views/k5ry-ef3g/rows.csv?accessType=DOWNLOAD"
  download.file(url, destfile="./data/restaurants.csv", method="curl")
}

restData <- read.csv("./data/restaurants.csv")

summary(restData)
head(restData, n=3)
tail(restData, n=3)
str(restData)

table(restData$zipCode, useNA="ifany")
table(restData$councilDistrict, restData$zipCode)

sum(is.na(restData$councilDistrict))
any(is.na(restData$councilDistrict))
all(restData$zipCode > 0)
colSums(is.na(restData))

table(restData$zipCode %in% c("21212", "21213"))
restData[restData$zipCode %in% c("21212", "21213"),]

data(UCBAdmissions)
DF <- as.data.frame(UCBAdmissions)
xt <- xtabs(Freq ~ Gender + Admit, data=DF)
