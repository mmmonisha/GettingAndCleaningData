# Code Book

1. Download the dataset for this project, containing the url for the following zip file: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

2. You would notice that the dataset consists of many text documents, one text document dedicated to each variable. Thus, we can assign each data file to an appropriate variable name. The columns of each text document are also assigned the appropriate column names. The details of the variable and column assignment is shown below:
- features <- features.txt (Table consisting of 561 rows and 2 columns, with the first column showing index number and the second column showing the function linked to the index number)
- activities <- activities.txt (Table consisting of 6 rows and 2 columns, with the first column showing code number and the second column showing the activity linked to the code number. For example, the activity of walking upstairs is assigned a code 2, whereas the activity of standing is assigned a code 5)
- subject_test <- test/subject_test.txt (Table consisting of 2947 rows and 1 column, showing the test data taken from 9 out of 30 volunteers)
- x_test <- test/x_test.txt (Table consisting of 2947 rows and 561 columns, each column showing one feature as mentioned in features.txt, for all the test subjects)
- y_test <- test/y_test.txt (Table consisting of 2947 rows and 1 column, showing the activity code for all the test subjects)
- subject_train <- train/subject_train.txt (Table consisting of 7352 rows and 1 column, showing the training data taken from 21 out of 30 volunteers)
- x_train <- train/x_train.txt (Table consisting of 7352 rows and 561 columns,  each column showing one feature as mentioned in features.txt, for all the training subjects)
- y_train <- train/y_train.txt (Table consisting of 7352 rows and 1 column, showing the activity code for all the training subjects)

3. Merge the training sets and the test sets to create a single data set.
- First, merge x_train and x_test using rbind(), to create a new table, x.
- Second, merge y_train and y_test using rbind(), to create a new table, y.
- Third, merge subject_train and subject_test using rbind(), to create a new table, subject.
- Finally, merge subject, y, x using cbind(), to create the new merged dataset, data. This dataset consists of 10299 rows and 563 columns.

4. Extract only the mean and standard deviation measurements.
- A new dataset, called TidyData, is created by selecting the columns consisting of the subject, code, and the columns containing the phrase "mean" or "std". The number of columns in TidyData is now only 88 (compared to 563 columns in the "data" dataset).

5. Use the descriptive activity names to name the values in the "activities" column of the "TidyData" dataset.
- The number code in the activities column is replaced with the appropriate column names.

6. Appropriately label the columns of the dataset with descriptive variable names.
- 1st column: "Subject"
- 2nd column: "Activity"
- Replace columns containing "Acc" with "Accelerometer", using gsub()
- Replace columns containing "Gyro" with "Gyroscope", using gsub()
- Replace columns containing "BodyBody" with "Body", using gsub()
- Replace columns containing "Mag" with "Magnitude", using gsub()
- Replace columns containing "mean" with "Mean", using gsub(), to capitalise the first letter for consistency
- Replace columns containing "std" with "StandardDeviation", using gsub()
- Replace columns containing "Freq" with "Frequency", using gsub()
- Replace columns containing "t" as the first letter of column name, with "Time", using gsub()
- Replace columns containing "f" as the first letter of column name, with "Frequency", using gsub()
- Replace columns containing "angle" with "Angle", using gsub(), to capitalise the first letter for consistency
- Replace columns containing "tBody" with "TimeBody", using gsub()
- Replace columns containing "gravity" with "Gravity", using gsub(), to capitalise the first letter for consistency
- Remove the periods in the column names, for tidier and more consistent naming of columns

7. Create a second, independent tidy dataset with the average of each variable for each activity and each subject
- First, group the "TidyData" dataset by Subject and Activity
- Then, use the summarise_all() function to find the mean of each variable for each activity and each subject, creating the second dataset called "FinalData"
- Export the new dataset to a text document, "FinalData.txt"

