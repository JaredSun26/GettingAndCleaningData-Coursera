#Q1
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv", destfile="survey.csv")
file.info("survey.csv")
survey<-read.csv("survey.csv")
file.remove("survey.csv")

#Q2
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv ","gross.csv")
gross<-read.csv("gross.csv",header=F,skip=5, nrow=190, 
                colClasses=c(NA,NA,"NULL",NA,NA,"NULL","NULL","NULL","NULL","NULL"))
gross$V5<-as.numeric(gsub(",","",gross$V5))
names(gross)<-c("ShortName","Ranking","Names","GDP")
mean(gross$GDP)

#Q3
sum(grepl("^United",gross$Names))

#Q4
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv ","gross.csv")
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv","edu.csv")

gross<-read.csv("gross.csv",header=F,skip=5, nrow=190, 
                colClasses=c(NA,NA,"NULL",NA,NA,"NULL","NULL","NULL","NULL","NULL"))
gross$V5<-as.numeric(gsub(",","",gross$V5))
edu<-read.csv("edu.csv")
length(grep("Fiscal year end:.*June", edu$Special.Notes, ignore.case=TRUE))




#Q5
library(quantmod)
library(lubridate)
amzn = getSymbols("AMZN",auto.assign=FALSE)
sampleTimes = index(amzn) 

names(amzn)
sum(year(amzn[,1])=="2012")
sum(wday(amzn[,1])==2 & year(amzn[,1])=="2012" )
