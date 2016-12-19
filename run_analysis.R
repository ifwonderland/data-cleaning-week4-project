#Load required packages
library(dplyr)


#Load subject data, these are person ids
subjectTrain <- read.table("dataset/train/subject_train.txt", col.names = c("personId"))
subjectTest <- read.table("dataset/test/subject_test.txt", col.names = c("personId"))
subject <- rbind(subjectTrain, subjectTest)

#Load actual readings data, rename features to actual feature names
features <- read.table("dataset/features.txt", col.names = c("id","name"))
dataTrain <- read.table("dataset/train/X_train.txt", col.names = features$name)
dataTest <- read.table("dataset/test/X_test.txt", col.names = features$name)

data <- rbind(dataTrain, dataTest)
#Only choose the columns of mean or standard deviation
data <- data[,grep("mean|std",colnames(data))]

#Load activity data
activityTrain <- read.table("dataset/train/y_train.txt", col.names = c("activityId"))
activityTest <- read.table("dataset/test/y_test.txt", col.names = c("activityId"))
activity <- rbind(activityTrain, activityTest)

#Label activity id by type
activityType <- read.table("dataset/activity_labels.txt", col.names = c("activityId", "activityType"))
activity <- full_join(activity, activityType, by = "activityId")
activityType <- select(activity, activityType)

#Comine subject/person, activity type, and data
combined <- cbind(subject, activityType, data)

#Find mean for all features per person, activity grouping
by_person_activity <- group_by(combined, personId, activityType)
by_person_activity_mean <- combined %>% group_by(personId, activityType) %>% summarise_each(funs(mean))

#Write clean data results to file
write.table(by_person_activity_mean, file="./person-activity-features-mean.txt")





