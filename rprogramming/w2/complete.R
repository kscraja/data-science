complete <- function(directory, id = 1:332) {
  out <- data.frame(id=integer(), nobs=integer())
  for(i in id) {
    path = file.path(directory, sprintf("%03d.csv", i))
    if (file.exists(path)) {
      d <- read.csv(path)
      nobs <- nrow(d[complete.cases(d),])
      out <- rbind(out, c(i, nobs))
    } else {
      print(path)
      print("above file does not exist!")
    }
  }
  names(out) <- c("id", "nobs")
  out
}

print(complete("specdata", 30:25))