
#url <- "http://w3schools.com/xml/simple.xml"
#download.file(url=url, destfile="simple.xml")

library(XML)

doc <- xmlTreeParse("./simple.xml", useInternalNodes=TRUE)
rootNode <- xmlRoot(doc)


rootNode[[1]] # accessing the first child

xmlSApply(rootNode, xmlValue) # applying xmlValue on all children

length(xmlNode) # number of children

#using xpath
xpathSApply(rootNode, "//name", xmlValue)

#------------------------------------------
Durl2 <- "http://espn.go.com/nfl/team/_/name/bal/baltimore-ravens"
#download.file(url=url2, destfile="baltimore.xml")
doc2 <- htmlTreeParse("./baltimore.xml", useInternal=TRUE)
scores <- xpathSApply(doc2, "//li[@class='score']", xmlValue)
teams <- xpathSApply(doc2, "//li[@class='team-name']", xmlValue)