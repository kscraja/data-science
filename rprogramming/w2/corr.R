corr <- function(directory, threshold=0) {
  out <- numeric(0)
  for(i in 1:332) {
    path = file.path(directory, sprintf("%03d.csv", i))
    if (file.exists(path)) {
      d <- read.csv(path)
      data <- d[complete.cases(d),]
      nobs <- nrow(data)
      if (nobs > threshold) {
        out <- c(out, cor(data$sulfate, data$nitrate))
      }
    } else {
      print(path)
      print("above file does not exist!")
    }
  }
  out
}

#print(corr("specdata", threshold=150))