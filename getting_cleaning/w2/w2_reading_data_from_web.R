u <- "http://scholar.google.com/citations?user=HI-I6C0AAAAJ&hl=en"

# con <- url(u)
# htmlCode <- readLines(con)
# close(con)
# htmlCode
# 

# using httr package to retrive html content
# library(httr)
# html2 <- GET(u)
# content2 <- content(html2, as="text")
# parsedHtml <- htmlParse(content2, asText=TRUE)
# xpathSApply(parsedHtml, "//title", xmlValue)
# 

google = handle("http://google.com")

pg1 = GET(handle=google, path="/")
pg2 = GET(handle=google, path="search")