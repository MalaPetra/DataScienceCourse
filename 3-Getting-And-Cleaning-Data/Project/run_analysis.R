# Step 1
## Download data 

library(data.table)
library(dplyr)


fileurl = 'https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip'
if (!file.exists('./UCI HAR Dataset.zip')){
  download.file(fileurl,destfile ="./documents/github/datasciencecoursera/3-Getting-And-Cleaning-Data/Data/Submission.zip", method="curl")
  unzip("./documents/github/datasciencecoursera/3-Getting-And-Cleaning-Data/Data/Submission.zip", exdir = "./documents/github/datasciencecoursera/3-Getting-And-Cleaning-Data/Data/")
  }


## Read and convert data


features <- read.table('./documents/github/datasciencecoursera/3-Getting-And-Cleaning-Data/Data//UCI HAR Dataset/features.txt', col.names = c("n","functions"))
activities <- read.table('./documents/github/datasciencecoursera/3-Getting-And-Cleaning-Data/Data//UCI HAR Dataset/activity_labels.txt', col.names = c("code", "activity"))
subject_test <- read.table('./documents/github/datasciencecoursera/3-Getting-And-Cleaning-Data/Data//UCI HAR Dataset/test/subject_test.txt', col.names = "subject")
x_test <- read.table('./documents/github/datasciencecoursera/3-Getting-And-Cleaning-Data/Data//UCI HAR Dataset/test/X_test.txt', col.names = features$functions)
y_test <- read.table('./documents/github/datasciencecoursera/3-Getting-And-Cleaning-Data/Data//UCI HAR Dataset/test/y_test.txt', col.names = "code")
subject_train <- read.table('./documents/github/datasciencecoursera/3-Getting-And-Cleaning-Data/Data//UCI HAR Dataset/train/subject_train.txt', col.names = "subject")
x_train <- read.table('./documents/github/datasciencecoursera/3-Getting-And-Cleaning-Data/Data//UCI HAR Dataset/train/X_train.txt', col.names = features$functions)
y_train <- read.table('./documents/github/datasciencecoursera/3-Getting-And-Cleaning-Data/Data//UCI HAR Dataset/train/y_train.txt', col.names = "code")

# Step 2
## Creating y 
X <- rbind(x_train, x_test)

## Creating x
Y <- rbind(y_train, y_test)

## Creating subject set
Subject <- rbind(subject_train, subject_test)

## Merge data

Merged_Data <- cbind(Subject, Y, X)
str(Merged_Data)

# Step 3
## Extract the measurements on the mean and standard deviation for each mesurement

TidyData <- Merged_Data %>% select(subject, code, contains("mean"), contains("str"))

# Step 4
## Use descriptive activity names to name the activities in the data set

TidyData$code <- activities[TidyData$code, 2]

# Step 5
## Appropriately labels the data set with descriptive variable names

names(TidyData)[2] = "activity"
names(TidyData)<-gsub("Acc", "Accelerometer", names(TidyData))
names(TidyData)<-gsub("Gyro", "Gyroscope", names(TidyData))
names(TidyData)<-gsub("BodyBody", "Body", names(TidyData))
names(TidyData)<-gsub("Mag", "Magnitude", names(TidyData))
names(TidyData)<-gsub("^t", "Time", names(TidyData))
names(TidyData)<-gsub("^f", "Frequency", names(TidyData))
names(TidyData)<-gsub("tBody", "TimeBody", names(TidyData))
names(TidyData)<-gsub("-mean()", "Mean", names(TidyData), ignore.case = TRUE)
names(TidyData)<-gsub("-std()", "STD", names(TidyData), ignore.case = TRUE)
names(TidyData)<-gsub("-freq()", "Frequency", names(TidyData), ignore.case = TRUE)
names(TidyData)<-gsub("angle", "Angle", names(TidyData))
names(TidyData)<-gsub("gravity", "Gravity", names(TidyData))

# Step 6
## From the data set in step 5, creates a second, independent tidy data set with the average of each variable for each activity and each subject

TidyData2 <- TidyData %>%
  group_by(subject, activity) %>%
  summarise_all(funs(mean))

write.table(TidyData2, "FinalOutput.txt", row.name=FALSE)




