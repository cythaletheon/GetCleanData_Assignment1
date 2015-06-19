---
title: "README: Getting And Cleaning Data - Assignment 1"
author: Damon Grummet  
date: 10/06/2015  
output: html_document  
---  

## Introduction

This file set represents my submission for the course assignment for 'Getting and Cleaning Data', part of the Data Science specialisation presented through Coursera.org.

The assignment is to perform acquisition and refactoring (getting and cleaning :) ) of a raw dataset used for machine learning algorithm development.  The expected output of the assignment is a script for performing all the required operations on the data, a consolidated result dataset in a text file, and documentation (a codebook and this README) on the steps taken and the data produced.

The remainder of this document (README.md) gives a summary of the format of the source data and the steps to clean and tidy the data (as performed by run_analysis.R).

## Data Acquisition

This project utilises accelerometer data collected from Samsung Galaxy S
smartphones by the authors of the following paper:

**Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012**

The data has been made publicly available on UCI Machine Learning Repository.

Full details are available at:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The data is located at:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## Code Book

The code book for this project is 'CodeBook.md'.  The code book contains descriptions
of the variables in the result set.

## Scripts

The following scripts are provided in this project.  Details follow:

### run_analysis.R

This script performs all the work of the project, collecting the source data
and tidying it to generate the result set.

The script has only been tested on R version 3.2.0 and has the following prerequisites:
* data.table
* sqldf
* dplyr

To install these packages, use

> install.packages("data.table","sqldf","dplyr")

To run the script, use the following command:

> source("run_analysis.R")


The script consumes the data files sourced from UCI into a data frame in the following manner:

####Step 1:

Download and import the source data into data.frame objects:

* activity_labels.txt ---> activities(id,name) {Data Table}
* Y_test.txt ---> yTestCol (id) {Data Table}
* Y_train.txt ---> yTrainCol (id) {Data Table}
* X_test.txt ---> xTestData (many numeric columns) {Data Table}
* X_train.txt ---> xTrainData (many numeric columns) {Data Table}
* subject_test.txt ---> testSubjects (id) {Data Table}
* subject_train.txt ---> trainingSubjects (id) {Data Table}
* features.txt ---> columnNames (text) {Data Table}

####Step 2:

Label the columns:

xTestData and xTrainData receive the column names collected in V2 of the columnNames object:

> setnames(xTestData,columnNames$V2) 

> setnames(xTrainData,columnNames$V2)

activities has the columns 'id' and 'activity':

> setnames(activities, c("id","activity"))

yTestCol and yTrainCol are single column tables with the name 'id':

> setnames(yTestCol, "id")  
> setnames(yTrainCol, "id")

testSubjects and trainingSubjects are lists of the Subject ID:

> setnames(testSubjects, "subjectID")  
> setnames(trainingSubjects, "subjectID")


####Step 3:

Reduce the data columns of the x data to the required subset:

We only need the mean and std columns, so use grep to identify the required
columns, and use the result to restrict the columns for the data:

> restrictCols <- columnNames[grep("-mean|-std", columnNames$V2, ignore.case=TRUE),]

Note here, that the mean and std keywords are being purposefully prefixed with a dash (-mean, -std) to exclude some of the variables whose names indicate they are a function using mean/std such as 'angle(Y,gravityMean)' which are outside the requirements of the result set.

Using the restrictCols object, the data is reduced:

> xTestData <- xTestData[,restrictCols$V1,with=FALSE]  
> xTrainData <- xTrainData[,restrictCols$V1,with=FALSE]


####Step 4:

Merge the data: Currently the data is split up into three objects for test, and three for training.  The result set requires the subject id, activity name and numerical data to be present in a single data object.

First, join data with subject and activity: subject:activity:data

> rawTestData <-cbind(testSubjects,yTestCol,xTestData)  
> rawTrainData <-cbind(trainingSubjects,yTrainCol,xTrainData)

Now, join activity names to y tables using sqldf to maintain order of rows:

> yTestCol <- sqldf("select activity from yTestCol join activities using(id)")  
> yTrainCol <- sqldf("select activity from yTrainCol join activities using(id)")

####Step 5:

The objective of this exercise is to produce a single dataset of all the available required data, thus join the two data sets to create the final data set:

> rawData <- rbind(rawTestData,rawTrainData)

####Step 6:
From this data we want a table of the averages of each feature (variable) grouped
by each activity, for each subject.

Using dplyr to select, group, summarise and sort the required data:

> resultData <- rawData %>%  
>   group_by(subjectID,activity) %>%  
>   summarise_each(funs(mean)) %>%  
>   arrange(subjectID, activity) 


####Step 7:

Save the result data as a text file "samsung_tidy_data.txt" using write.table.


####Step 8:

Clean up the working environment.  Remove all intemediary objects.

## Note on usage of the final dataset

Due to the more descriptive characters in the column names of the source data which have been preserved in the result data to retain the value of the original documentation, to reference specific columns of data for further analysis, use back quotes around the name, for example:

    > sqldf('select subjectID, activity, `tBodyAcc-mean()-X` from resultData where subjectID=2')
    
| subjectID|activity           | tBodyAcc-mean()-X|
|---------:|:------------------|-----------------:|
|         2|STANDING           |         0.2779115|
|         2|SITTING            |         0.2770874|
|         2|LAYING             |         0.2813734|
|         2|WALKING            |         0.2764266|
|         2|WALKING_DOWNSTAIRS |         0.2776153|
|         2|WALKING_UPSTAIRS   |         0.2471648|

FYI: to get the above table in markdown format, use the 'knitr' library, and the 'kable' method such that kable(object_to_display) produces markdown text that can be copied into an .md file.
