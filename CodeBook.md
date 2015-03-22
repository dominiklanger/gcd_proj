#Code Book

## Source data
Source data was downloaded from
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

It is described in more detail in the file README.txt and features_info.txt contained in the ZIP file mentioned above as well as in on the following web page:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Briefly, the source data set contains a test and a training data set, both with features derived from time series sensor data obtained from the smartphone gyroscope and accelerometer, respectively. Sampling frequency of sensors was 50 Hz. Raw data from both sensor types were filtered to remove high frequency noise. Feature variables when then obtained as follows:
1. Accelerometer data was separated into body and gravity components. 
2. Subsequently, the body linear acceleration and angular velocity from the gyrometer were derived in time to obtain a jerk signal. 
3. Magnitude of these three-dimensional signals were calculated using the Euclidean norm. 
4. Finally a Fast Fourier Transform (FFT) was applied to some of these signals to produce frequency domain signals. 
5. Mean value, standard deviation and other operations resulted in the final feature variables.

## Target data
The transformation script *run_analysis.R* creates a file named *aggregateData.txt*. Variables (columns) in this result file were obtained from mean value and standard deviation features in the source data set by averaging over all observations from the same test subject and with the same activity type from both test and training data. X, Y and Z components were kept separate like in the source data set and indicated by the last character of the variable name.

* Body component of the acceleration signal (mean and standard deviation, respectively):

** tBodyAcc_mean_X
** tBodyAcc_mean_Y
** tBodyAcc_mean_Z
** tBodyAcc_std_X
** tBodyAcc_std_Y
** tBodyAcc_std_Z

* tGravityAcc_mean_X
* tGravityAcc_mean_Y
* tGravityAcc_mean_Z
* tGravityAcc_std_X
* tGravityAcc_std_Y
* tGravityAcc_std_Z
* tBodyAccJerk_mean_X
* tBodyAccJerk_mean_Y
* tBodyAccJerk_mean_Z
* tBodyAccJerk_std_X
* tBodyAccJerk_std_Y
* tBodyAccJerk_std_Z
* tBodyGyro_mean_X
* tBodyGyro_mean_Y
* tBodyGyro_mean_Z
* tBodyGyro_std_X
* tBodyGyro_std_Y
* tBodyGyro_std_Z
* tBodyGyroJerk_mean_X
* tBodyGyroJerk_mean_Y
* tBodyGyroJerk_mean_Z
* tBodyGyroJerk_std_X
* tBodyGyroJerk_std_Y
* tBodyGyroJerk_std_Z
* tBodyAccMag_mean
* tBodyAccMag_std
* tGravityAccMag_mean
* tGravityAccMag_std
* tBodyAccJerkMag_mean
* tBodyAccJerkMag_std
* tBodyGyroMag_mean
* tBodyGyroMag_std
* tBodyGyroJerkMag_mean
* tBodyGyroJerkMag_std
* fBodyAcc_mean_X
* fBodyAcc_mean_Y
* fBodyAcc_mean_Z
* fBodyAcc_std_X
* fBodyAcc_std_Y
* fBodyAcc_std_Z
* fBodyAccJerk_mean_X
* fBodyAccJerk_mean_Y
* fBodyAccJerk_mean_Z
* fBodyAccJerk_std_X
* fBodyAccJerk_std_Y
* fBodyAccJerk_std_Z
* fBodyGyro_mean_X
* fBodyGyro_mean_Y
* fBodyGyro_mean_Z
* fBodyGyro_std_X
* fBodyGyro_std_Y
* fBodyGyro_std_Z
* fBodyAccMag_mean
* fBodyAccMag_std
* fBodyBodyAccJerkMag_mean
* fBodyBodyAccJerkMag_std
* fBodyBodyGyroMag_mean
* fBodyBodyGyroMag_std
* fBodyBodyGyroJerkMag_mean
* fBodyBodyGyroJerkMag_std


## Transformation of source to target data
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.