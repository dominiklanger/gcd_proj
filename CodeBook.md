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
The transformation script *run_analysis.R* creates a file named *aggregateData.txt*. The following variables (columns) designate the measurement collection each record belongs to:
* *subject*: id of the test subject the data is from.
* *activity*: activity type the data belongs to.

The additional variables (columns) in this result file were obtained from mean value and standard deviation features in the source data set by averaging over all observations from the same test subject and with the same activity type from both test and training data. X, Y and Z components were kept separate like in the source data set and indicated by the last character of the variable name.

_IMPORTANT: All of the following variables are dimensionless because features in the source data set are normalized and bounded to the range [-1, 1]._

* Body component of the acceleration signal (in time domain):
  * *tBodyAcc_mean_X*
  * *tBodyAcc_mean_Y*
  * *tBodyAcc_mean_Z*
  * *tBodyAcc_std_X*
  * *tBodyAcc_std_Y*
  * *tBodyAcc_std_Z*
* Gravity component of the acceleration signal (in time domain):
  * *tGravityAcc_mean_X*
  * *tGravityAcc_mean_Y*
  * *tGravityAcc_mean_Z*
  * *tGravityAcc_std_X*
  * *tGravityAcc_std_Y*
  * *tGravityAcc_std_Z*
* Jerk signal obtained as time derivative of body acceleration (in time domain):
  * *tBodyAccJerk_mean_X*
  * *tBodyAccJerk_mean_Y*
  * *tBodyAccJerk_mean_Z*
  * *tBodyAccJerk_std_X*
  * *tBodyAccJerk_std_Y*
  * *tBodyAccJerk_std_Z*
* Gyrometer signal (in time domain): 
  * *tBodyGyro_mean_X*
  * *tBodyGyro_mean_Y*
  * *tBodyGyro_mean_Z*
  * *tBodyGyro_std_X*
  * *tBodyGyro_std_Y*
  * *tBodyGyro_std_Z*
* Jerk signal obtained as time derivative of gyrometer signal (in time domain):
  * *tBodyGyroJerk_mean_X*
  * *tBodyGyroJerk_mean_Y*
  * *tBodyGyroJerk_mean_Z*
  * *tBodyGyroJerk_std_X*
  * *tBodyGyroJerk_std_Y*
  * *tBodyGyroJerk_std_Z*
* Magnitude of body acceleration signal (in time domain):
  * *tBodyAccMag_mean*
  * *tBodyAccMag_std*
* Magnitude of gravity signal (in time domain):
  * *tGravityAccMag_mean*
  * *tGravityAccMag_std*
* Magnitude of acceleration jerk signal (in time domain):
  * *tBodyAccJerkMag_mean*
  * *tBodyAccJerkMag_std*
* Magnitude of gyrometer signal (in time domain):
  * *tBodyGyroMag_mean*
  * *tBodyGyroMag_std*
* Magnitude of gyrometer jerk signal (in time domain): 
  * *tBodyGyroJerkMag_mean*
  * *tBodyGyroJerkMag_std*
* Body component of the acceleration signal (in frequency domain):
  * *fBodyAcc_mean_X*
  * *fBodyAcc_mean_Y*
  * *fBodyAcc_mean_Z*
  * *fBodyAcc_std_X*
  * *fBodyAcc_std_Y*
  * *fBodyAcc_std_Z*
* Jerk signal obtained as time derivative of body acceleration (in frequency domain):
  * *fBodyAccJerk_mean_X*
  * *fBodyAccJerk_mean_Y*
  * *fBodyAccJerk_mean_Z*
  * *fBodyAccJerk_std_X*
  * *fBodyAccJerk_std_Y*
  * *fBodyAccJerk_std_Z*
* Gyrometer signal (in frequency domain): 
  * *fBodyGyro_mean_X*
  * *fBodyGyro_mean_Y*
  * *fBodyGyro_mean_Z*
  * *fBodyGyro_std_X*
  * *fBodyGyro_std_Y*
  * *fBodyGyro_std_Z*
* Magnitude of body acceleration signal (in frequency domain):  
  * *fBodyAccMag_mean*
  * *fBodyAccMag_std*
* Magnitude of acceleration jerk signal (in frequency domain):  
  * *fBodyBodyAccJerkMag_mean*
  * *fBodyBodyAccJerkMag_std*
* Magnitude of gyrometer signal (in frequency domain):  
  * *fBodyBodyGyroMag_mean*
  * *fBodyBodyGyroMag_std*
* Magnitude of gyrometer jerk signal (in frequency domain):   
  * *fBodyBodyGyroJerkMag_mean*
  * *fBodyBodyGyroJerkMag_std*

## Transformation of source to target data
The transformation script *run_analysis.R* transforms the source data set as follows to create the target set:
1. Test and Training data (from X_test.txt and X_train.txt) are enriched with readable activity labels (from activity_labels.txt).
2. For both test and training data, measurements on the mean and standard deviation for each measurement are extracted. 
3. For both test and training data, Variables (columns) are labelled (with names taken from features.txt).
4. Test and training data sets are merged into a single new data set.
5. Each variable for each activity and each subject is aggregated by computing the average.