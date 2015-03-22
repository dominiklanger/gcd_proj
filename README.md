# gcd_proj
Coursera course "Getting and Cleaning Data": course project

## Introduction
One of the most exciting areas in all of data science right now is wearable computing. Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

This repository focuses on tidying data obtained from smartphone sensors. The experiment that delivered the data is described here:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The actual data was downloaded from here:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

## Content of this repository

### Code book
Contains details about source data set, target data set and the transformation algorithm (*CodeBook.md*).

### R script
This project contains an R script called *run_analysis.R* that does the following:

1. Reads in look-up tables with feature and activity labels.
2. Loops over test and training data sets, performing the following in each case:
  1. Measurement data are read from file (X_test.txt and X_train.txt, respectively).
  2. Corresponding activity type is read from file (y_test and y_train.txt, respectively).
  3. Corresponding subject id is read from file (subject_test.txt and subject_train.txt, respectively).
  4. Target data are prepared with data category ("test" or "training", respectively).
  5. Target data are prepared with test subject ids. 
  6. Target data are prepared with readable activity labels using the look-up table mentioned above.
  7. Measurements on the mean and standard deviation for each measurement are extracted and added to target data. 
  8. Target data variables (columns) are labelled with names.
3. Test and training data sets are merged into a single new data set.
4. Each variable for each activity and each subject is aggregated by computing the average.

