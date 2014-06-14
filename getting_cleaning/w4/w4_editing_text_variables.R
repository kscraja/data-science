init <- function() {
  if(!file.exists(("./data"))) {dir.create("./data")}
  fileUrl <- "https://data.baltimorecity.gov/api/views/dz54-2aru/rows.csv?accessType=DOWNLOAD"
  download.file(fileUrl, destfile="./data/cameras.csv", method="curl")
  cameraData <- read.csv("./data/cameras.csv")
}

names(cameraData)
tolower(names(cameraData))
splitNames <- strsplit(names(cameraData), "\\.")

mylist <- list(letters=c("A", "b", "c"), numbers=1:3, matrix(1:20, 5, 5))

firstElement <- function(x){x[1]}
sapply(splitNames, firstElement)


downloadPeerReviewData <- function() {
  if(!file.exists('./data')) { dir.create("./data")}
  fileUrl1 <- "https://dl.dropboxusercontent.com/u/7710864/data/reviews-apr29.csv"
  fileUrl2 <- "https://dl.dropboxusercontent.com/u/7710864/data/solutions-apr29.csv"
  download.file(fileUrl1, destfile="./data/reviews.csv", method="curl")
  download.file(fileUrl2, destfile="./data/solutions.csv", method="curl")
}
solutions <- read.csv("./data/solutions.csv")
reviews <- read.csv("./data/reviews.csv");
head(reviews)
head(solutions)

#sub
#gsub
#nchar
#substr
#grep
#paste
