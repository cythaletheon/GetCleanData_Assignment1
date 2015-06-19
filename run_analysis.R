# run_analysis.R
#
# author: Damon Grummet
# date: "10/06/2015"
#
library(data.table)
library(sqldf)
library(dplyr)

# Step 1
## Get the raw data 
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

# only get the data from the website if it isn't already present:
if (!file.exists("rawdata.zip")) {
  download.file(fileURL, destfile = "rawdata.zip")
}

## unpack the raw data - remove old copies if necessary
zipdirName <- "UCI HAR Dataset"
if (file.exists(zipdirName)) {
  unlink(zipdirName, recursive=TRUE)
}
unzip("rawdata.zip")

if (file.exists("data")) {
  unlink("data", recursive=TRUE)
}
file.rename(zipdirName,"data")

# tidy up workspace
rm(zipdirName)
rm(fileURL)

# load raw data:
# activity_labels.txt ---> activities(V1:id,V2:name) {Data Table}
activities <- fread("data/activity_labels.txt")
#Y_test.txt ---> yTestCol (id) {Data Table}
yTestCol <- fread("data/test/y_test.txt")
#Y_train.txt ---> yTrainCol (id) {Data Table}
yTrainCol <- fread("data/train/y_train.txt")

# note, have to use read.table here due to a bug in fread 1.9.4
# causing a crash of R studio.
#X_test.txt ---> xTestData (many numeric columns) {Data Table}
xTestData <- as.data.table(read.table("data/test/X_test.txt"))
#X_train.txt ---> xTrainData (many numeric columns) {Data Table}
xTrainData <- as.data.table(read.table("data/train/X_train.txt"))


#subject_test.txt ---> testSubjects (id) {Data Table}
testSubjects <- fread("data/test/subject_test.txt")
#subject_train.txt ---> trainingSubjects (id) {Data Table}
trainingSubjects <- fread("data/train/subject_train.txt")
#features.txt ---> columnNames (text) {Data Table}
columnNames <- fread("data/features.txt")
#


# Step 2: Apply labels to data set
setnames(xTestData,columnNames$V2)
setnames(xTrainData,columnNames$V2)

setnames(activities, c("id","activity"))
setnames(yTestCol, "id")
setnames(yTrainCol, "id")

setnames(testSubjects, "subjectID")
setnames(trainingSubjects, "subjectID")

# Step 3: extract only the mean and std columns
# here, we can use the columnNames data.table to subset:
restrictCols <- columnNames[grep("-mean|-std", columnNames$V2, ignore.case=TRUE),]
xTestData <- xTestData[,restrictCols$V1,with=FALSE]
xTrainData <- xTrainData[,restrictCols$V1,with=FALSE]

# Step 4
# join activity names to y tables using sqldf to maintain order of rows
yTestCol <- sqldf("select activity from yTestCol join activities using(id)")
yTrainCol <- sqldf("select activity from yTrainCol join activities using(id)")

# join data with subject and activity: subject:activity:data
rawTestData <-cbind(testSubjects,yTestCol,xTestData)
rawTrainData <-cbind(trainingSubjects,yTrainCol,xTrainData)

# Step 5 - join both datasets
rawData <- rbind(rawTestData,rawTrainData)


# Step 6 - Extract average (arithmetic mean) of each variable for each activity and each subject
# (ie extract average of each column grouped by activity for each subject)

# use dplyr package for this action
resultData <- rawData %>%
  group_by(subjectID,activity) %>%
  summarise_each(funs(mean)) %>%
  arrange(subjectID, activity)

# Step 7 - save resultData as a file
write.table(resultData, file = "samsung_tidy_data.txt", row.names=FALSE)

# Step 8 - cleanup
rm(activities)
rm(columnNames)
rm(rawTestData)
rm(rawTrainData)
rm(restrictCols)
rm(rawData)
rm(testSubjects)
rm(trainingSubjects)
rm(xTestData)
rm(xTrainData)
rm(yTestCol)
rm(yTrainCol)

