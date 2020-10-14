# merge training and test datasets
x <- rbind(x_train, x_test)
y <- rbind(y_train, y_test)
subject <- rbind(subject_train, subject_test)
data <- cbind(subject, y, x)

# extracts only measurements of mean and standard deviation for each measurement
TidyData <- data %>% select(subject, code, contains("mean"), contains("std"))

# uses descriptive activity names to name the activities in the data set
TidyData$code <- activities[TidyData$code, 2]

# appropriately labels the data set with descriptive variable names
names(TidyData)[1] <- "Subject"
names(TidyData)[2] <- "Activity"
names(TidyData) <- gsub("Acc", "Accelerometer",names(TidyData))
names(TidyData) <- gsub("Gyro", "Gyroscope",names(TidyData))
names(TidyData) <- gsub("BodyBody", "Body",names(TidyData))
names(TidyData) <- gsub("Mag", "Magnitude",names(TidyData))
names(TidyData) <- gsub("mean", "Mean",names(TidyData))
names(TidyData) <- gsub("std", "StandardDeviation",names(TidyData))
names(TidyData) <- gsub("Freq", "Frequency",names(TidyData))
names(TidyData) <- gsub("^t", "Time",names(TidyData))
names(TidyData) <- gsub("^f", "Frequency",names(TidyData))
names(TidyData) <- gsub("angle", "Angle",names(TidyData))
names(TidyData) <- gsub("tBody", "TimeBody",names(TidyData))
names(TidyData) <- gsub("gravity", "Gravity",names(TidyData))
names(TidyData) <- gsub("\\.", "",names(TidyData))

# create independent tidy data set with the average of each variable 
# for each activity and each subject
FinalData <- TidyData %>%
    group_by(Subject, Activity) %>%
    summarise_all(mean)
write.table(FinalData, "FinalData.txt")

