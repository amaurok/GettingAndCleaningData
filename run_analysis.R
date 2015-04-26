#Load the required libraries
library(data.table)
library(reshape2)

#Helper function to parse files reading locally
parseFileToDataTable <- function (file) {
  df <- read.table(file)
  dt <- data.table(df)
}


##Download the file, and unzip it.
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
path <- getwd()
if(!file.exists(path)){ 
  dir.create(path)
}
fileName <- "DataSet.zip"
download.file(url, file.path(path, fileName))
unzip(fileName)

#Define the target folder, where the files should be read from.
targetFolder <- file.path(path, "UCI HAR Dataset")

#Read the subjects from training and test.
dtSubjectTrain <- fread(file.path(targetFolder, "train", "subject_train.txt"))
dtSubjectTest  <- fread(file.path(targetFolder, "test" , "subject_test.txt" ))

#Read the training.
dtTrainingLabels <- fread(file.path(targetFolder, "train", "y_train.txt"))
dtTestLabels  <- fread(file.path(targetFolder, "test" , "y_test.txt" ))

#Read the training and test sets.
dtTraininigSet <- parseFileToDataTable(file.path(targetFolder, "train", "X_train.txt"))
dtTestSet <- parseFileToDataTable(file.path(targetFolder, "test", "X_test.txt"))

#Join by rows the subject sets.
dtSubject <- rbind(dtSubjectTrain, dtSubjectTest)
setnames(dtSubject, "V1", "Subject")

#Join by rows the subject and labels sets.
dtLabels <- rbind(dtTrainingLabels, dtTestLabels)
setnames(dtLabels, "V1", "ActivityNumber")
dtSet <- rbind(dtTraininigSet, dtTestSet)

#Join by columns the sets.
dtSubject <- cbind(dtSubject, dtLabels)
dtJoined <- cbind(dtSubject, dtSet)

#Set the keys to sort the resulting table.
setkey(dtJoined, Subject, ActivityNumber)

#Read the features
dtFeatures <- fread(file.path(targetFolder, "features.txt"))
setnames(dtFeatures, names(dtFeatures), c("FeatureNumber", "FeatureName"))

#Extract just the the mean and std variables.
dtFeatures <- dtFeatures[grepl("mean\\(\\)|std\\(\\)", FeatureName)]
dtFeatures$featureCode <- dtFeatures[, paste0("V", FeatureNumber)]

#Join the sets with the features.
select <- c(key(dtJoined), dtFeatures$featureCode)
dtJoined <- dtJoined[, select, with=FALSE]

#Read the files with activities.
dtActivities <- fread(file.path(targetFolder, "activity_labels.txt"))
setnames(dtActivities, names(dtActivities), c("ActivityNumber", "ActivityName"))

#Merge the set by activity number.
dtJoined <- merge(dtJoined, dtActivities, by="ActivityNumber", all.x=TRUE)
setkey(dtJoined, Subject, ActivityNumber, ActivityName)

dtJoined <- data.table(melt(dtJoined, key(dtJoined), variable.name="featureCode"))

#Produce the expected result, as the average of each variable by subject and activity.
tidyData <- by(dtJoined$value, list(dtJoined$Subject,dtJoined$ActivityName), mean)

#Write the tidy data result to a txt file.
write.table(tidyData,"tidy.txt",row.name=FALSE)