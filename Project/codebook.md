This file describes the variables, the data, and any transformations or work that I performed to clean up the data 

The data description is [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)
The data is downloaded from [here](
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

The run_analysis.R script performs the following steps to clean the data set:

1. Download the data to the folder
  * Download data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
  * unzip the file
2. read in the test and train data set from the files
  * Read X_train.txt , y_train.txt and subject_train.txt from the "./UCI HAR Dataset/" folder and store them in *trainSet*, *trainLabel*, and *trainSubject* data frames respectively.
  * Read X_test.txt, y_test.txt and subject_test.txt from the "./UCI HAR Dataset/" folder and store them in *testSet*, *testLabel*, and *testSubject* data frames respectively.
3. Merges the training and the test sets to create one data set
  * Combine *testSet* and *trainSet* by rows into *combinedSet*
  * Combine *testLabel* and *trainLabel* by rows into *combinedLabel*
  * Combine *testSubject* and *trainSubject* by rows into *combinedSubject*
4. Extracts only the measurements on the mean and standard deviation for each measurement. 
  * Read the features.txt file from the "./UCI HAR Dataset/" folder and store into *features* data frame.
  * Find the features corresponding to the mean and standard deviation for each measurement.
5. Uses descriptive activity names to name the activities in the data set
  * Read the activity_labels.txt file from the "./UCI HAR Dataset/"" folder into *activity* data frame
  * Transform the activity label to the actual activity in *joinLabel* according to the *activity* data frame
6. Appropriately labels the data set with descriptive variable names. 
  * Combine the *joinSubject*, *joinLabel* and *joinData* by column to form the *tidy* data frame
  * Write *cleanedData* to "merged_data.txt" file.
7.  Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
  * Aggregate  the average of each variable in *tidy* by subject and activity and store the result to *tidyWithMean*
  * Write *tidyWithMean* to "tidy_with_mean.txt" file.