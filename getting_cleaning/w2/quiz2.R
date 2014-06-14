library(httr)

oauth_endpoints("github")
myapp <- oauth_app("datascience", key="5c4ac1c6a2f30743ec4a", secret="39cb2f30f830f962377ff06c55fa9f0efa393715")
gh_token <- oauth2.0_token(oauth_endpoints("github"), myapp)

u <- "https://api.github.com/users/jtleek/repos"
req <- GET(u, config(token=gh_token))

# lengh of strings
# u <- "http://biostat.jhsph.edu/~jleek/contact.html"
# u2 <- url(u)
# c <- readLines(u2)
# l <- c[c(10, 20, 30, 100)]
# sapply(l, nchar)

#sqldf
library(sqldf)
u <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
download.file(url=u, destfile="survey.csv")
acs <- read.csv("./suryve.csv")
unique(acs$AGEP)

# reading fixed with files
x <- read.fwf(file="./data.for", skip=4, widths=c(12, 7,4,9,4, 9,4, 9,4))


