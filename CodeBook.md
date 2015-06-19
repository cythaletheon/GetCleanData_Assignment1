---
title: "Code Book for Getting and Cleaning Data - Assignment1"
author: "Damon Grummet"
date: "10/06/2015"
output: html_document
---

## Variables


The raw data has 561 variables per observation (columns per row).
This project requires only the means and standard deviations for each (variable/observation) which are represented by the 'features.txt' values.
According to the 'features_info.txt' file, the keywords used in the features are
'mean' or 'Mean' and 'std' for the required features.  

**Note 1:** there are some occurrences of these key words as parameters to what appear to be functions - these have been omitted as not being actual mean/std values.

**Note 2:** the data values are all normalised (as detailed in the UCI data documentation.)


Following is a table of the variables provided in the final output dataset "samsung_tidy_data.txt".

**Note 3:**  
 #0 is from the subject files  
 #1 is from the activity file

|Column |Original data column|Variable Name|
|:--|:---|:-------------------------------|
|1  |#0  |subjectID                       |
|2  |#1  |activity                        |
|3  |1   |tBodyAcc-mean()-X               |
|4  |2   |tBodyAcc-mean()-Y               |
|5  |3   |tBodyAcc-mean()-Z               |
|6  |4   |tBodyAcc-std()-X                |
|7  |5   |tBodyAcc-std()-Y                |
|8  |6   |tBodyAcc-std()-Z                |
|9  |41  |tGravityAcc-mean()-X            |
|10 |42  |tGravityAcc-mean()-Y            |
|11 |43  |tGravityAcc-mean()-Z            |
|12 |44  |tGravityAcc-std()-X             |
|13 |45  |tGravityAcc-std()-Y             |
|14 |46  |tGravityAcc-std()-Z             |
|15 |81  |tBodyAccJerk-mean()-X           |
|16 |82  |tBodyAccJerk-mean()-Y           |
|17 |83  |tBodyAccJerk-mean()-Z           |
|18 |84  |tBodyAccJerk-std()-X            |
|19 |85  |tBodyAccJerk-std()-Y            |
|20 |86  |tBodyAccJerk-std()-Z            |
|21 |121 |tBodyGyro-mean()-X              |
|22 |122 |tBodyGyro-mean()-Y              |
|23 |123 |tBodyGyro-mean()-Z              |
|24 |124 |tBodyGyro-std()-X               |
|25 |125 |tBodyGyro-std()-Y               |
|26 |126 |tBodyGyro-std()-Z               |
|27 |161 |tBodyGyroJerk-mean()-X          |
|28 |162 |tBodyGyroJerk-mean()-Y          |
|29 |163 |tBodyGyroJerk-mean()-Z          |
|30 |164 |tBodyGyroJerk-std()-X           |
|31 |165 |tBodyGyroJerk-std()-Y           |
|32 |166 |tBodyGyroJerk-std()-Z           |
|33 |201 |tBodyAccMag-mean()              |
|34 |202 |tBodyAccMag-std()               |
|35 |214 |tGravityAccMag-mean()           |
|36 |215 |tGravityAccMag-std()            |
|37 |227 |tBodyAccJerkMag-mean()          |
|38 |228 |tBodyAccJerkMag-std()           |
|39 |240 |tBodyGyroMag-mean()             |
|40 |241 |tBodyGyroMag-std()              |
|41 |253 |tBodyGyroJerkMag-mean()         |
|42 |254 |tBodyGyroJerkMag-std()          |
|43 |266 |fBodyAcc-mean()-X               |
|44 |267 |fBodyAcc-mean()-Y               |
|45 |268 |fBodyAcc-mean()-Z               |
|46 |269 |fBodyAcc-std()-X                |
|47 |270 |fBodyAcc-std()-Y                |
|48 |271 |fBodyAcc-std()-Z                |
|49 |294 |fBodyAcc-meanFreq()-X           |
|50 |295 |fBodyAcc-meanFreq()-Y           |
|51 |296 |fBodyAcc-meanFreq()-Z           |
|52 |345 |fBodyAccJerk-mean()-X           |
|53 |346 |fBodyAccJerk-mean()-Y           |
|54 |347 |fBodyAccJerk-mean()-Z           |
|55 |348 |fBodyAccJerk-std()-X            |
|56 |349 |fBodyAccJerk-std()-Y            |
|57 |350 |fBodyAccJerk-std()-Z            |
|58 |373 |fBodyAccJerk-meanFreq()-X       |
|59 |374 |fBodyAccJerk-meanFreq()-Y       |
|60 |375 |fBodyAccJerk-meanFreq()-Z       |
|61 |424 |fBodyGyro-mean()-X              |
|62 |425 |fBodyGyro-mean()-Y              |
|63 |426 |fBodyGyro-mean()-Z              |
|64 |427 |fBodyGyro-std()-X               |
|65 |428 |fBodyGyro-std()-Y               |
|66 |429 |fBodyGyro-std()-Z               |
|67 |452 |fBodyGyro-meanFreq()-X          |
|68 |453 |fBodyGyro-meanFreq()-Y          |
|69 |454 |fBodyGyro-meanFreq()-Z          |
|70 |503 |fBodyAccMag-mean()              |
|71 |504 |fBodyAccMag-std()               |
|72 |513 |fBodyAccMag-meanFreq()          |
|73 |516 |fBodyBodyAccJerkMag-mean()      |
|74 |517 |fBodyBodyAccJerkMag-std()       |
|75 |526 |fBodyBodyAccJerkMag-meanFreq()  |
|76 |529 |fBodyBodyGyroMag-mean()         |
|77 |530 |fBodyBodyGyroMag-std()          |
|78 |539 |fBodyBodyGyroMag-meanFreq()     |
|79 |542 |fBodyBodyGyroJerkMag-mean()     |
|80 |543 |fBodyBodyGyroJerkMag-std()      |
|81 |552 |fBodyBodyGyroJerkMag-meanFreq() |


The data for each observation on record is stored within the files 'X_test.txt'
and 'X_train.txt'.  Each row in these files corresponds to the same row in the
companion file 'Y_test.txt' and 'Y_train.txt' respectively, allowing a merging
of the two files to create a data frame.

Note the Y_*.txt files are a list of numbers that correspond to the activities noted
in the activity_labels.txt file mentioned below.

## Activities

The activities mentioned in the data are the Observations.

WALKING  
WALKING_UPSTAIRS  
WALKING_DOWNSTAIRS  
SITTING  
STANDING  
LAYING

(sourced from file activity_labels.txt)

***

## Source Data

The source data is from the UCI Machine Learning Repository.  Key files of the
data set are 

test\X_test.txt
train\X_train.txt

Y_ files are the id key linking the row of X to the activity_labels

subject_* files are the ID of the observed subject, and match the rows of X.

All of which are in space separated text format.

## Output Data

The result data "samsung_tidy_data.txt" is a grouped summary of the restricted subset of the original data, merged into a single data object combining the Activities, Subject ID's and mechanical data.  The result data is grouped by subject, with the data for each activity averaged (mathematical mean) to produce a single mean value for each variable for that activity per subject.

This data is suitable for production of graphs of the average expected value for each measurement from the Samsung devices.



