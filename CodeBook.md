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


lines 28-29 creates two data frames with all of the tests and train measurments as well as their associated subjectIDs and Activity IDs. those lines also add a variable to each table,in order to identify test and train data when the tables are combined.

lines 32-33 change the data frames to tibbles, so that we can use tidyverse functions.

lines 36-37 select on the columns that corresponed to mean and standard deviation measurements.

lines 40-41 data the variables that are in rows and put them into one column. the one column becomes a list of the different types of measurements.

lines 44-45 join the activity_labels table, so that we can have activity name in the tables.

lines 48-49 drop the activity ID label, as we have the activity name and no longer need the ID.

line 52 combines the test and train data into one table: total_data

lines 55-58 create a tibble with an average of each variable for each activity and each subject.

lines 62-63 write the final two tables to csvs in the current working directory.
