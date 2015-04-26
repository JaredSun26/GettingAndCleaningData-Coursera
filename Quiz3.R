#----------------------------
#           quize 3
#----------------------------

#Problem 1
##download the file
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv","housing.csv")
##load the file
housing<-read.csv("housing.csv",stringsAsFactors=F)
library("dplyr")
housing<-mutate(housing, agricultureLogical=(ACR==3 | AGS==6))
which(housing$agricultureLogical==TRUE)
with(housing,which(agricultureLogical))

#Problem 2
library(jpeg)
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg ","ins.jpg")
ins<-readJPEG("ins.jpg", native=TRUE)
quantile(ins,c(0.3,0.8))

#Problem 3
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv ","gross.csv")
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv","edu.csv")

gross<-read.csv("gross.csv",header=F,skip=5, nrow=190, 
                colClasses=c(NA,NA,'NULL',NA,'numeric','NULL','NULL','NULL','NULL','NULL'))
edu<-read.csv("edu.csv")

result<-merge(gross,edu,by.x="V1", by.y="CountryCode", all= FALSE)
nrow(result)
result<-arrange(result,desc(V2))
result$V4[13]

#problem 4
result1<-group_by(result, Income.Group)
dplyr::summarize(result1, meanRK=mean(V2))

#problem 5
library(Hmisc)
result2<-mutate(result,GDPCut=cut2(V2,g=5))
xtabs(~GDPCut+Income.Group,data=result2)


