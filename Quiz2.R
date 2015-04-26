#problem 1
library(httr)
library(jsonlite)
oauth_endpoints("github")
myapp <- oauth_app("github", "40b8a1e57e667e830e62","ef9e809065450bf5222aa70bcf20b3d3c3bfded2")
github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)
#scarp the data
gtoken <- config(token = github_token)
req <- GET("https://api.github.com/users/jtleek/repos", gtoken)
stop_for_status(req)
#extract what I need
json1=content(req)
json2=fromJSON(toJSON(json1))
json2[5,45]

#problem 4
con=url("http://biostat.jhsph.edu/~jleek/contact.html ")
htmlCode=readLines(con)
nchar(htmlCode[c(10,20,30,100)])

#problem 5
data<-read.fwf("C:/Users/ZHE/Desktop/getdata-wksst8110.for",
         widths =c(10,-5,4,-1,3,-5,4,-1,3,-5,4,-1,3,-5,4,-1,3),skip=4)
sum(colSums(data[,c(4,9)]))
