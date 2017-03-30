## 
## Week 4 Project 
##
## 1) Merge training & test sets to create 1 data set 
##    Append files in train directory (X_train, y_train, subject_train) with files in 
##    test directory (X_test, y_test, subject_test)
## 2) Extract Mean & Standard Deviation for each measurement 
##    features table identify each column containing mean and/or std
## 3) Uses descrtiptive activity names to name the activity in the data set
## 4) Appropriately labels the data set with descriptive variable names
## 5) From the dataset in step 4 creates a second, independent tidy data set with the average of each variable 
##    for each activity (1->6) and each subject (1->30)
##
##-----------------------------------------------------------------------
## PART 1: Merge
## navigate to directory containing initial data
## comment out for submittal setwd("E:/Coursera/Data/C3_Week4/proj/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset")

## merge subject data
testdata<-read.table("./test/subject_test.txt")
traindata<-read.table("./train/subject_train.txt")
subjectdata<-rbind(testdata,traindata)
names(subjectdata)[1] = "Subject"

## merge activity data
testdata<-read.table("./test/y_test.txt")
traindata<-read.table("./train/y_train.txt")
activitydata<-rbind(testdata,traindata)
names(activitydata)[1] = "Activity ID"

## Get column names for measured variables
features<-read.table("features.txt")
label<-features$V2

## merge measured data
testdata<-read.table("./test/X_test.txt",col.names=label,check.names=FALSE)
traindata<-read.table("./train/X_train.txt",col.names=label,check.names=FALSE)
measureddata<-rbind(testdata,traindata)
##--------------------------------------------------------
## Part 2 Extract Mean & STD Dev into data frame DF2
##
## find columns that contain mean and std reference
ColOfInterest=grep("Mean|STD",label,ignore.case=TRUE)
##
DF2<-measureddata[,ColOfInterest]
##-------------------------------------------------------
## Part 3: Descriptive Activity Names
##
## Merge activitydata, subjectdata with mean/std data frame
##
DF2<-cbind(activitydata,subjectdata,DF2)
##
## Read labels for each activity and substitute ID for label
##
activityLabels<-read.table("activity_labels.txt")
names(activityLabels)[1] = "Activity ID"
names(activityLabels)[2] = "Activity"
##
DF3<-merge(activityLabels,DF2,by.x="Activity ID",by.y="Activity ID",sort=FALSE)
## Remove Activity ID
DF3[1]<-NULL
##-----------------------------------------------------
## Part 4: Appropriate Label data set
##
## Performed when data tables were read in Parts 1 & 3 above
##-------------------------------------
## Part 5: Create second DF average of each variable for each activity/subject
##
DF_Tidy<-aggregate(DF3[c(3:ncol(DF3))],by=list(DF3[[1]],DF3[[2]]),FUN=mean)
names(DF_Tidy)[1]="Activity"
names(DF_Tidy)[2]="Subject"
write.table(DF_Tidy,file="Tidy.txt",row.names=FALSE)
