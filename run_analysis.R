library(dplyr)
library(reshape2)

# Load look-up data:
featureLabels <- read.table("UCI HAR Dataset/features.txt")
activityLabels <- read.table("UCI HAR Dataset/activity_labels.txt")

# Prepare nice variable labels:
label <-  gsub("-", "_", featureLabels[, 2])
label <- gsub("\\(", "", labels)
label <- gsub("\\)", "", labels)

# Define file paths:
subjectsFilePath = c("UCI HAR Dataset/test/subject_test.txt", "UCI HAR Dataset/train/subject_train.txt")
activitiesFilePath = c("UCI HAR Dataset/test/y_test.txt", "UCI HAR Dataset/train/y_train.txt")
measurementsFilePath = c("UCI HAR Dataset/test/X_test.txt", "UCI HAR Dataset/train/X_train.txt")

if (exists("newDataSet")) {
      remove(newDataSet)
}

dataCategory <- as.factor(c("test", "training"))

for (j in 1:2) { # Loop over test/training data sets
      # Load data:
      subjects <- read.table(subjectsFilePath[j])
      activities <- read.table(activitiesFilePath[j])
      measurements <- read.table(measurementsFilePath[j])
      
      # Perform look-up on activities:
      activities <- merge(activities, activityLabels, by.x = "V1", by.y="V1", all=FALSE, sort=FALSE)
            
      # Set category, subjet and activity columns:
      dataSet <- data.frame(category = rep(dataCategory[j], length(subjects$V1)))
      dataSet$subject <- subjects$V1
      dataSet$activity <- activities$V2
      
      # Set all columns containing mean and std of measurements:
      featureIndex <- seq_along(featureLabels[, 2])
      for (i in featureIndex) {
            if ((grepl("mean", featureLabels[i, 2]) | grepl("std", featureLabels[i, 2])) & !grepl("meanFreq", featureLabels[i, 2])) {
                  dataSet <- cbind(dataSet, measurements[, i])
                  names(dataSet)[ncol(dataSet)] <- label[i]
            }       
      }
      
      # Put data set (test or training, respectively) into an overarching data set variable:
      if (exists("newDataSet")) {
            newDataSet <- rbind(newDataSet, dataSet)
      }
      else {
            newDataSet <- dataSet
      }
}

# Create separate data set with average of each variable for each activity and each subject: 
idVars <- c("category", "subject", "activity")
measureVars <- names(newDataSet)[!(names(newDataSet) %in% idVars)]
meltedData <- melt(newDataSet, id = idVars, measure.vars = measureVars)
aggregateData <- dcast(meltedData, subject + activity ~ variable, mean)
write.table(aggregateData, file = "aggregateData.txt", row.name=FALSE)


