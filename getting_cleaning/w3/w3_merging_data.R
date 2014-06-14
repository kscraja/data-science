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

names(reviews)
names(solutions)

mergedData <- merge(reviews, solutions, by.x="solution_id", by.y="id", all=TRUE)
head(mergedData)
