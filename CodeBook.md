Overview:

This Github repository hosts the R code related to the project for the Johns Hopkins Data Specialization “Getting and Cleaning Data” course.  This project covers best practices for how data scientists clean data in preparation for further analysis to be conducted.  The initial Data Description and File Description sections of this Code Book contain text that has been taken directly from the UCI Machine Learning Repository on Human Activity Recognition Using Smartphone Data Set website (http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) or from files downloaded from this site.



Data Description:

Per the UCI Machine Learning Repository on Human Activity Recognition Using Smartphone Data Set:

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers were selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

Check the README.txt file for further details about this dataset. 

A video of the experiment including an example of the six (6) recorded activities with one of the participants can be seen in the following link: [Web Link]

For each record in the dataset it is provided: 
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. 
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.



File Description: 

Per the UCI Machine Learning Repository on Human Activity Recognition Using Smartphone Data Set “README.txt” file (http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones): 
- 'features_info.txt': Shows information about the variables used on the feature vector.
- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent: 
- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 
- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 
- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second.



Variable Description:

Per the UCI Machine Learning Repository on Human Activity Recognition Using Smartphone Data Set features_info.txt file:

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  

'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean

The complete list of variables of each feature vector is available in 'features.txt'



Data Transformation:

Load test sets, training sets, and activities
The original data taken from the Coursera website was stored in the UCI HAR Dataset/ directory. The data was then unzipped. Both of these items were done outside of R. Further, the RStudio working directory was moved so that the parent directory of UCI HAR Dataset/ (namely, “Getting and Cleaning Data Project” was performed).

read.table package was already installed within RStudio but if not present then this would need to occur. The read.table package was then loaded into R library. Use read.table to load the test sets, training sets, and activities into R environment.

testData <- read.table("./UCI HAR Dataset/test/X_test.txt", header=FALSE)
testData_Subject <- read.table("./UCI HAR Dataset/test/subject_test.txt", header=FALSE)
testData_Activity <- read.table("./UCI HAR Dataset/test/y_test.txt", header=FALSE)
trainData <- read.table("./UCI HAR Dataset/train/X_train.txt", header=FALSE)
trainData_Subject <- read.table("./UCI HAR Dataset/train/subject_train.txt", header=FALSE)
trainData_Activity <- read.table("./UCI HAR Dataset/train/y_train.txt", header=FALSE)

Attach descriptive activity to name the activities in data set
Attach the descriptive activity to the test and training data sets. The activity name labels are brought in from the activity_labels.txt file. The activity names replace the numbers of the testData_Activity and trainData_Activity data frames.

activities <- read.table("./UCI HAR Dataset/activity_labels.txt", header=FALSE, colClasses="character")
testData_Activity$V1 <- factor(testData_Activity$V1, levels=activities$V1, labels=activities$V2)
trainData_Activity$V1 <- factor(trainData_Activity$V1, levels=activities$V1, labels=activities$V2)

Label data frames with descriptive names
Data frame is labeled using the features.txt file with appropriate column names. Further, the Activity and Subject columns are also named.

features <- read.table("./UCI HAR Dataset/features.txt", header=FALSE, colClasses="character")
colnames(testData) <- features$V2
colnames(trainData) <- features$V2
colnames(testData_Subject) <- c("Subject")
colnames(trainData_Subject) <- c("Subject")
colnames(testData_Activity) <- c("Activity")
colnames(trainData_Activity) <- c("Activity")

Merge test and training data into one data set
The Subject and Activity columns are added to the test and training data frames. The test and training are merged into one data frame – mergeData.

testData <- cbind(testData, testData_Activity)
testData <- cbind(testData, testData_Subject)
trainData <- cbind(trainData, trainData_Activity)
trainData <- cbind(trainData, trainData_Subject)
mergeData <- rbind(testData, trainData)

Extract mean and standard deviation for each measurement
The mean and standard deviation -- mean() and sd() respectively -- are used against the merged data frame using sapply().  Note a warning is returned for the Activity column because it's not numeric. This does not impact the calculation of the rest and NA is stored in the new data frames instead, since mean and standard deviation are not applicable in this case. 

mergeData_Mean <- sapply(mergeData, mean, na.rm=TRUE)
mergeData_Std_Dev <- sapply(mergeData, sd, na.rm=TRUE)

Create tidy data with average for each activity and each subject
The tidy data table is generated with average of each measurement per subject and per activity (180 total results are generated because of combination of 30 subjects and 6 activities each). The new file is saved as tidy.txt.

dataTable <- data.table(mergeData)
tidy <- dataTable[,lapply(.SD, mean), by="Subject,Activity"]
write.table(tidy, file="tidy.txt", sep=",", row.names = FALSE)
