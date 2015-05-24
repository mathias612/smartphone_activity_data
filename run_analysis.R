# Step 1
# First install "data.table" package if not already installed then load into library
library(data.table)

# Step 2
# First download the UCI data from the URL below and unzip the data and save it to  load test and training sets and the activities
# Use the course CDN instead of the original UCI zip file.
# Original File URL --> http://archive.ics.uci.edu/ml/machine-learning-databases/00240/UCI%20HAR%20Dataset.zip
# Course page URL --> https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

# Step 3
# Read table data via the read.table function into variables
testData <- read.table("./UCI HAR Dataset/test/X_test.txt", header=FALSE)
testData_Subject <- read.table("./UCI HAR Dataset/test/subject_test.txt", header=FALSE)
testData_Activity <- read.table("./UCI HAR Dataset/test/y_test.txt", header=FALSE)
trainData <- read.table("./UCI HAR Dataset/train/X_train.txt", header=FALSE)
trainData_Subject <- read.table("./UCI HAR Dataset/train/subject_train.txt", header=FALSE)
trainData_Activity <- read.table("./UCI HAR Dataset/train/y_train.txt", header=FALSE)

# Step 4 
# Attach the descriptive activity to name activities in data set
activities <- read.table("./UCI HAR Dataset/activity_labels.txt", header=FALSE, colClasses="character")
testData_Activity$V1 <- factor(testData_Activity$V1, levels=activities$V1, labels=activities$V2)
trainData_Activity$V1 <- factor(trainData_Activity$V1, levels=activities$V1, labels=activities$V2)

# Step 5
# Label data frames with descriptive names
features <- read.table("./UCI HAR Dataset/features.txt", header=FALSE, colClasses="character")
colnames(testData) <- features$V2
colnames(trainData) <- features$V2
colnames(testData_Subject) <- c("Subject")
colnames(trainData_Subject) <- c("Subject")
colnames(testData_Activity) <- c("Activity")
colnames(trainData_Activity) <- c("Activity")

# Step 6
# Merge test and training data into one data set
testData <- cbind(testData, testData_Activity)
testData <- cbind(testData, testData_Subject)
trainData <- cbind(trainData, trainData_Activity)
trainData <- cbind(trainData, trainData_Subject)
mergeData <- rbind(testData, trainData)

# Step 7
# Extract mean and standard deviation for each measurement
mergeData_Mean <- sapply(mergeData, mean, na.rm=TRUE)
mergeData_Std_Dev <- sapply(mergeData, sd, na.rm=TRUE)

# Step 8
# Create tidy data with average for each activity and each subject
dataTable <- data.table(mergeData)
tidy <- dataTable[,lapply(.SD, mean), by="Subject,Activity"]
write.table(tidy, file="tidy.txt", sep=",", row.names = FALSE)
