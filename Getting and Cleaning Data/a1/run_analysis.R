####
#Part 1
# Merges the training and the test sets to create one data set
####

# Set working directory
setwd("/Users/edmondlau/R/datasciencecoursera/Getting and Cleaning Data/a1/")

# Read data 
subject_Train <- read.table("./train/subject_train.txt")
subject_Test <- read.table("./test/subject_test.txt")
x_Train <- read.table("./train/X_train.txt")
x_Test <- read.table("./test/X_test.txt")
y_Train <- read.table("./train/y_train.txt")
y_Test <- read.table("./test/y_test.txt")
feature_Names <- read.table("features.txt")

# Add column name for subject files
names(subject_Train) <- "subjectID"
names(subject_Test) <- "subjectID"

# Add column names for measurement files
names(x_Train) <- feature_Names$V2
names(x_Test) <- feature_Names$V2

# Add column name for label files
names(y_Train) <- "activity"
names(y_Test) <- "activity"

# Combine files into one dataset
train <- cbind(subject_Train, y_Train, x_Train)
test <- cbind(subject_test, y_Test, x_Test)
combined_data <- rbind(train, test)


####
# Part 2
# Extracts only the measurements on the mean and standard 
# deviation for each measurement
####

# Determine which columns contain mean or standard deviation
mean_Std_Cols <- grepl("mean\\(\\)", names(combined_data)) |
  grepl("std\\(\\)", names(combined_data))

# Keep both subjectID and activity columns
mean_Std_Cols[1:2] <- TRUE

# Remove unnecessary columns
combined_data <- combined_data[, mean_Std_Cols]


## STEP 3: Uses descriptive activity names to name the activities
## in the data set.
## STEP 4: Appropriately labels the data set with descriptive
## activity names. 

# convert the activity column from integer to factor
combined_data$activity <- factor(combined_data$activity, labels=c("Walking",
                                                        "Walking Upstairs", "Walking Downstairs", "Sitting", "Standing", "Laying"))


## STEP 5: Creates a second, independent tidy data set with the
## average of each variable for each activity and each subject.

# Load reshape2 package
library(reshape2)

# create the tidy data set
melted_Data <- melt(combined_data, id=c("subjectID","activity"))
tidy_Data <- dcast(melted_data, subjectID+activity ~ variable, mean)

# write the tidy data set to a file
write.csv(tidy_Data, "tidy.txt", row.names=FALSE)