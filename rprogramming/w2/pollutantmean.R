pollutantmean <- function(directory, pollutant, id=1:332) {
  alldata <- numeric()
  for(i in id) {
    path = file.path(directory, sprintf("%03d.csv", i))
    if (file.exists(path)) {
      d <- read.csv(path)
      pdata <- d[[pollutant]]
      use <- complete.cases(pdata)
      alldata <- c(alldata, pdata[use])
    } else {
      print(path)
      print("Above file does not exist !")
    }
  }
  mean(alldata)
}

#print(pollutantmean(paste("./w2/specdata", sep=""), "sulfate", 1:10))