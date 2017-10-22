* Data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip was saved on the desktop

* the file must be unzipped before it can be used

* all packages used were from the tidyverse library

lines 8-25 create the initial tables requried for the analysis below is a description of each table:

* features - table that has 1 column with unique IDs for each feature and another column with the description for each feature
* activity_lables - activity table that has 1 column with the activity IDs and another column with the description of the activity
* subject_test - a list of the subject IDs that correspond to each row entry in the x_test table
* y_test - a list of the activity IDs that correspond to each row entry in the y_test table
* x_test - a list of all measurements from the test group, with each row being measurments unique to a subject and an activity and each column being a type of acceleration measurement.
*  subject_train - same as above but for the train group
* y_train - same as above but for the train group
* x_train - same as above but for the train group


#creates two data frames with all of the tests and train measurments as well as their associated subjectIDs and ACtivity IDs, as well as add a variable to identify test and train data when the tables are combined

#change data frame to tibble to use tidyverse functions

#select only the mean and standard deviation measurements

#all of the measurement variables are rows that need to be in one column to be tidy data

#add in the activity names

#drop activity ID because it's essentially a duplicate column with activity

#combine the train and test data into one table

#create a tibble with average of each variable for each activity and each subject



#writetables to text, be sure to set working directory to wherever you want to save them
