


#Q5
library(quantmod)
library(lubridate)
amzn = getSymbols("AMZN",auto.assign=FALSE)
sampleTimes = index(amzn) 

names(amzn)
sum(year(amzn[,1])=="2012")
sum(wday(amzn[,1])==2 & year(amzn[,1])=="2012" )
