#quiz 1
#Q1
url="https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv "
download.file(url,destfile="./temp.csv")
temp<-read.csv("temp.csv")
sum(temp$VAL==24,na.rm=T)

#Q2

Tidy data has one variable per column.
Each tidy data table contains information about only one type of observation.

#Q3
library("xlsx")
dat<-read.xlsx("gas.xlsx",sheetIndex=1, startRow=18,endRow=23,colIndex=7:15)
sum(dat$Zip*dat$Ext,na.rm=T) 

#Q4
#xmlTreeParse does not support https
library("XML")
url="http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
doc<-xmlTreeParse(url,useInternalNodes=T)
rootNode<-xmlRoot(doc)
sum(xpathSApply(rootNode,"//zipcode",xmlValue)=="21231")

#Q5
library("data.table")
url="https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv "
download.file(url,"./temp.csv")
DT<-fread("./temp.csv")

system.time(mean(DT$pwgtp15,by=DT$SEX))
system.time(sapply(split(DT$pwgtp15,DT$SEX),mean))

