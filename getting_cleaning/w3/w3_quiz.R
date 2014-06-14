downloadACSData <- function() {
  fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv" 
  download.file(fileUrl, destfile="./data/acs.csv", method="curl")
}

acs <- read.csv("./data/acs.csv")

acs$agricultureLogical <- ifelse(acs$TYPE == 1 & acs$ACR == 3 & acs$AGS == 6, T, F)
which(acs$agricultureLogical)[1:3]

library(jpeg)
readJPEG("./data/jeff.jpeg", native=TRUE)

GDP <- read.csv("./data/GDP.csv")
EDU <- read.csv("./data/EDU.csv")

#ans0: -15258512-10575416
# ans1 : 125, 238, 262
# ans2 : 189, St. Kitts
# ans3: 32.96667, 91.91
# ans4: 5
