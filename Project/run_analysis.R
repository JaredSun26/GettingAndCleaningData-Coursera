#----------------------------------------------------
#                   download dataset                |
#----------------------------------------------------
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",destfile="mobile.zip")
unzip("mobile.zip")

#-------------------------------
#1.Merge training and test sets|
#-------------------------------
trainSet<- read.table("./UCI HAR Dataset/train/X_train.txt")
trainLabel <- read.table("./UCI HAR Dataset/train/y_train.txt")
trainSubject <- read.table("./UCI HAR Dataset/train/subject_train.txt")

testSet <- read.table("./UCI HAR Dataset/test/X_test.txt")
testLabel <- read.table("./UCI HAR Dataset/test/y_test.txt") 
testSubject <- read.table("./UCI HAR Dataset/test/subject_test.txt")

combinedSet <- rbind(trainSet, testSet)
combinedLabel <- rbind(trainLabel, testLabel)
combinedSubject <- rbind(trainSubject, testSubject)

#-------------------------------------------------------------------------------
#2.Extracts only the measurements on mean and sd deviation for each measurement| 
#-------------------------------------------------------------------------------

features <- read.table("./UCI HAR Dataset/features.txt")
ind_MeanStd=grep(pattern="mean\\(\\)|std\\(\\)",features[,2])

combinedSet<-combinedSet[,ind_MeanStd]
names(combinedSet)<-features[ind_MeanStd,2]

#-------------------------------------------------------------------------
#3.Uses descriptive activity names to name the activities in the data set|
#-------------------------------------------------------------------------

act<- read.table("./UCI HAR Dataset/activity_labels.txt",stringsAsFactors=FALSE)
combinedLabel[, 1] <- act[combinedLabel[,1],2]
names(combinedLabel) <- "activity"

#--------------------------------------------------------------------
#4.Appropriately labels the data set with descriptive variable names|
#--------------------------------------------------------------------

names(combinedSubject) <- "subject"
tidy <- cbind(combinedSubject, combinedLabel, combinedSet)
write.table(tidy, "tidy_data.txt", row.name=FALSE)
#--------------------------------------------------------------------------
#5. creates a second, independent tidy data set with the average          |
#   of each variable for each activity and each subject.                  |
#--------------------------------------------------------------------------

tidyWithMean<-with(tidy,
            aggregate(tidy[,c(3:68)],
            by=list(subject=subject,activity=activity), 
            FUN=mean))
write.table(tidyWithMean, "tidy_with_mean.txt", row.name=FALSE)
