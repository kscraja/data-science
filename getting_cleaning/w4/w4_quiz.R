fileUrl = "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
fileUrl2 = "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
download.file(fileUrl, destfile="./data/quiz.csv", method="curl")
download.file(fileUrl2, destfile="./data/quiz2.csv", method="curl")

data <- read.csv("./data/quiz.csv")
names(data )
l <- strsplit(names(data), "wgtp")
l[[123]]

gdp <- read.csv("./data/quiz2.csv", header=F)
ncol(gdp)
names(gdp) <- c("CountryCode", "Code", "", "Country", "GDP", "", "", "", "", "")

gdpValues <- gdp$GDP
gdpValues1 <- gsub(",", "", gdpValues)
gdpValues2 <- gsub("[.]", "", gdpValues1)
gdpValues3 <- gsub(" ", "", gdpValues2)
gdpValues4 <- as.numeric(gdpValues3)
gdpValues5 <- gdpValues4[!is.na(gdpValues4)]
mean(gdpValues4, na.rm=T)

############
fileUrl3 = "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
download.file(fileUrl3, destfile="./data/quiz3.csv", method="curl")
eduData <- read.csv("./data/quiz3.csv")
names(eduData)

nd <- merge(gdp, eduData, by.x = "CountryCode", by.y = "CountryCode")
View(nd)
