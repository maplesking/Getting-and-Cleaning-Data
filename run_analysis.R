
# Create a directory to store the data
if(!file.exists("./datagc")) {dir.create("./datagc")}

# Download the data and unzip the data mannually 
fileurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileurl, destfile = "./datagc/dataset.zip", method = "curl")

# Set work directory
setwd("./datagc/dataset/UCI HAR Dataset")


# 1. Merges the training and the test sets to create one data set.

# Read the test data files ("subject_test.txt", "X_test.txt", "y_test.txt")
subject_test <- read.table("test/subject_test.txt")
x_test <- read.table("test/X_test.txt")
y_test <- read.table("test/y_test.txt")

# Merge the above test data files by column_bind function
testdata <- cbind(y_test, subject_test, x_test)

# Read the file of "features.txt"
features <- read.table("features.txt")

# Set the column names for testdata
colnames(testdata) <- c("activitylable", "subject", as.character(features[, 2]))

# read the training data files ("subject_train.txt", "X_train.txt", "y_train.txt")
subject_train <- read.table("train/subject_train.txt")
x_train <- read.table("train/X_train.txt")
y_train <- read.table("train/y_train.txt")

# Merge the above train data files by column_bind function
traindata <- cbind(y_train, subject_train, x_train)

# Set the column names for traindata
colnames(traindata) <- c("activitylable", "subject", as.character(features[, 2]))

# Merge the testdata and traindata by row_bind function
totaldata <- rbind(testdata, traindata)


# 2. Extracts only the measurements on the mean and standard deviation for each measurement.

namelist <- colnames(totaldata)
Mean <- grep("mean()", namelist, value = FALSE, fixed = TRUE)
Std <- grep("std()", namelist, value = FALSE, fixed = TRUE)
            
meanstddata <- totaldata[, c(1, 2, Mean, Std)]


# 3. Uses descriptive activity names to name the activities in the data set

# Read the file of "activity_labels.txt"
actlables <- read.table("activity_labels.txt")
colnames(actlables) <- c("activitylable", "activityname")
datameanstd <- merge(actlables, meanstddata)


# 4. Appropriately labels the data set with descriptive variable names.
# ^t: time, ^f: frequency, Acc: Accelerator, Gyro: Gyroscope, Mag: Magnitude, mean(): Mean value, std(): Standard deviation

varname <- colnames(datameanstd)
varname <- gsub("^t", "time", varname)
varname <- gsub("^f", "frequency", varname)
varname <- gsub("Acc", "Accelerator", varname)
varname <- gsub("Gyro", "Gyroscope", varname)
varname <- gsub("Mag", "Magnitude", varname)
varname <- gsub("mean()", "MeanValue", varname, fixed = TRUE)
varname <- gsub("std()", "StandardDeviation", varname, fixed = TRUE)

colnames(datameanstd) <- varname


# 5. From the data set in step 4, creates a second, independent tidy data set 
# with the average of each variable for each activity and each subject.

# Convert the "subject" column from integer to factor
datameanstd$subject <- as.factor(datameanstd$subject)

library(reshape2)
datamelted <- melt(datameanstd[, 2:69], id = c("subject", "activityname"))
tidydata <- dcast(datamelted, subject + activityname ~ variable, mean)

write.table(tidydata, file = "Tidy.txt", row.names = FALSE)

