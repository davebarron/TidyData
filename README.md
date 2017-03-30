# TidyData
## Merge Training & Test Sets
Read the subject (1-30) data for test (subject_test.txt) and training (subject_train.txt) files and merge (append) into single data frame (subjectdata).
Read the activity (1-6) data for test (y_test.txt) and training (y_train.txt) and merge (append) into single data frame (actvitydata).
## Appropriate Label Data Set
Read the features.txt file to get names for columns of measurment data.
Reads the measured data for test (X_test.txt) and training (X_train.txt) using column names from features and merge into single data frame (measureddata)
## Extract Mean & STD Dev in to Data Frame
Subset measureddata to only include columns containing data on Mean or standard deviation (STD)
## Descriptive Activity Names
Merge (join) activitydata,subjectdata and measureddata into single "flat" data frame (DF2)
Merge (join) activity_labels.txt with large dataFrame to create large data frame (DF3)
Since Activity ID is no longer needed remove that column
## Create Tidy Data frame of average of each variable for each activity/subject
Use Aggregate function to find mean of each column by Actity and Subject
