#Data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip was saved on the desktop

#be sure to unzip files first

#packagesused
library(tidyverse)

#Create all tables, files were stored on my desktop, these file paths need to be replaced with wherever you're storing the zip file

#create a features table that has 1 column with unique IDs for each feature and another column with the description for each feature
features <- read.table("C:\\UserData\\OneDrive - Red Ventures\\Desktop\\getdata%2Fprojectfiles%2FUCI HAR Dataset\\UCI HAR Dataset\\features.txt", header = FALSE, col.names = c("featureID","feature"))

#create an activity table that has 1 column with the activity IDs and another column with the description of the activity
activity_labels <- read.table("C:\\UserData\\OneDrive - Red Ventures\\Desktop\\getdata%2Fprojectfiles%2FUCI HAR Dataset\\UCI HAR Dataset\\activity_labels.txt", header = FALSE, col.names = c("activityID","activity"))

#extracts all of the test data, where subject_test is the subjectID, y_test is the activityID correspending to the activities in activity_label, and x_test are all of the measurements for the test group
subject_test <- read.table("C:\\UserData\\OneDrive - Red Ventures\\Desktop\\getdata%2Fprojectfiles%2FUCI HAR Dataset\\UCI HAR Dataset\\test\\subject_test.txt", header = FALSE, col.names = "subjectID")
y_test <- read.table("C:\\UserData\\OneDrive - Red Ventures\\Desktop\\getdata%2Fprojectfiles%2FUCI HAR Dataset\\UCI HAR Dataset\\test\\Y_test.txt", header = FALSE, col.names = "activityID")
x_test <- read.table("C:\\UserData\\OneDrive - Red Ventures\\Desktop\\getdata%2Fprojectfiles%2FUCI HAR Dataset\\UCI HAR Dataset\\test\\X_test.txt", header = FALSE, col.names = features[,2])

#extracts all of the train data, labels are the same as the test data
subject_train <- read.table("C:\\UserData\\OneDrive - Red Ventures\\Desktop\\getdata%2Fprojectfiles%2FUCI HAR Dataset\\UCI HAR Dataset\\train\\subject_train.txt", header = FALSE, col.names = "subjectID")
y_train <- read.table("C:\\UserData\\OneDrive - Red Ventures\\Desktop\\getdata%2Fprojectfiles%2FUCI HAR Dataset\\UCI HAR Dataset\\train\\y_train.txt", header = FALSE, col.names = "activityID")
x_train <- read.table("C:\\UserData\\OneDrive - Red Ventures\\Desktop\\getdata%2Fprojectfiles%2FUCI HAR Dataset\\UCI HAR Dataset\\train\\x_train.txt", header = FALSE, col.names = features[,2])


#creates two data frames with all of the tests and train measurments as well as their associated subjectIDs and ACtivity IDs, as well as add a variable to identify test and train data when the tables are combined
train_total <- data.frame('group' = 'train',y_train,subject_train,x_train)
test_total <- data.frame('group' = 'test',y_test,subject_test,x_test)

#change data frame to tibble to use tidyverse functions
train_total <- as_tibble(train_total)
test_total <- as_tibble(test_total)

#select only the mean and standard deviation measurements
train_total <- select(train_total,'group','activityID','subjectID',contains("mean"),contains("std"))
test_total <- select(test_total,'group','activityID','subjectID',contains("mean"),contains("std"))

#all of the measurement variables are rows that need to be in one column to be tidy data
train_total <- gather(train_total,"tBodyAcc.mean...X":"fBodyBodyGyroJerkMag.std..", key = "measurement", value = "acceleration" )
test_total <- gather(test_total,"tBodyAcc.mean...X":"fBodyBodyGyroJerkMag.std..", key = "measurement", value = "acceleration" )

#add in the activity names
train_total <-left_join(train_total,activity_labels,by = "activityID")
test_total <-left_join(test_total,activity_labels,by = "activityID")

#drop activity ID because it's essentially a duplicate column with activity
train_total <- select(train_total,-activityID)
test_total <- select(test_total,-activityID)

#combine the train and test data into one table
total_data <- bind_rows(train_total,test_total)

#create a tibble with average of each variable for each activity and each subject
total_data2 <-
total_data %>%
group_by(subjectID,measurement,activity)  %>%
summarise(average = mean(acceleration))


#writetables to text, be sure to set working directory to wherever you want to save them
write.table(total_data2,"total_data2.txt", row.name = FALSE)