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

|Original Column |New Column |Variable Name                |Type      |
|:---------------|:----------|:----------------------------|:---------|
|#0              |1          |subjectid                    |integer   |
|#1              |2          |activity                     |Factor    |
|1               |3          |tbodyaccmeanx                |numeric   |
|2               |4          |tbodyaccmeany                |numeric   |
|3               |5          |tbodyaccmeanz                |numeric   |
|4               |6          |tbodyaccstdx                 |numeric   |
|5               |7          |tbodyaccstdy                 |numeric   |
|6               |8          |tbodyaccstdz                 |numeric   |
|41              |9          |tgravityaccmeanx             |numeric   |
|42              |10         |tgravityaccmeany             |numeric   |
|43              |11         |tgravityaccmeanz             |numeric   |
|44              |12         |tgravityaccstdx              |numeric   |
|45              |13         |tgravityaccstdy              |numeric   |
|46              |14         |tgravityaccstdz              |numeric   |
|81              |15         |tbodyaccjerkmeanx            |numeric   |
|82              |16         |tbodyaccjerkmeany            |numeric   |
|83              |17         |tbodyaccjerkmeanz            |numeric   |
|84              |18         |tbodyaccjerkstdx             |numeric   |
|85              |19         |tbodyaccjerkstdy             |numeric   |
|86              |20         |tbodyaccjerkstdz             |numeric   |
|121             |21         |tbodygyromeanx               |numeric   |
|122             |22         |tbodygyromeany               |numeric   |
|123             |23         |tbodygyromeanz               |numeric   |
|124             |24         |tbodygyrostdx                |numeric   |
|125             |25         |tbodygyrostdy                |numeric   |
|126             |26         |tbodygyrostdz                |numeric   |
|161             |27         |tbodygyrojerkmeanx           |numeric   |
|162             |28         |tbodygyrojerkmeany           |numeric   |
|163             |29         |tbodygyrojerkmeanz           |numeric   |
|164             |30         |tbodygyrojerkstdx            |numeric   |
|165             |31         |tbodygyrojerkstdy            |numeric   |
|166             |32         |tbodygyrojerkstdz            |numeric   |
|201             |33         |tbodyaccmagmean              |numeric   |
|202             |34         |tbodyaccmagstd               |numeric   |
|214             |35         |tgravityaccmagmean           |numeric   |
|215             |36         |tgravityaccmagstd            |numeric   |
|227             |37         |tbodyaccjerkmagmean          |numeric   |
|228             |38         |tbodyaccjerkmagstd           |numeric   |
|240             |39         |tbodygyromagmean             |numeric   |
|241             |40         |tbodygyromagstd              |numeric   |
|253             |41         |tbodygyrojerkmagmean         |numeric   |
|254             |42         |tbodygyrojerkmagstd          |numeric   |
|266             |43         |fbodyaccmeanx                |numeric   |
|267             |44         |fbodyaccmeany                |numeric   |
|268             |45         |fbodyaccmeanz                |numeric   |
|269             |46         |fbodyaccstdx                 |numeric   |
|270             |47         |fbodyaccstdy                 |numeric   |
|271             |48         |fbodyaccstdz                 |numeric   |
|294             |49         |fbodyaccmeanfreqx            |numeric   |
|295             |50         |fbodyaccmeanfreqy            |numeric   |
|296             |51         |fbodyaccmeanfreqz            |numeric   |
|345             |52         |fbodyaccjerkmeanx            |numeric   |
|346             |53         |fbodyaccjerkmeany            |numeric   |
|347             |54         |fbodyaccjerkmeanz            |numeric   |
|348             |55         |fbodyaccjerkstdx             |numeric   |
|349             |56         |fbodyaccjerkstdy             |numeric   |
|350             |57         |fbodyaccjerkstdz             |numeric   |
|373             |58         |fbodyaccjerkmeanfreqx        |numeric   |
|374             |59         |fbodyaccjerkmeanfreqy        |numeric   |
|375             |60         |fbodyaccjerkmeanfreqz        |numeric   |
|424             |61         |fbodygyromeanx               |numeric   |
|425             |62         |fbodygyromeany               |numeric   |
|426             |63         |fbodygyromeanz               |numeric   |
|427             |64         |fbodygyrostdx                |numeric   |
|428             |65         |fbodygyrostdy                |numeric   |
|429             |66         |fbodygyrostdz                |numeric   |
|452             |67         |fbodygyromeanfreqx           |numeric   |
|453             |68         |fbodygyromeanfreqy           |numeric   |
|454             |69         |fbodygyromeanfreqz           |numeric   |
|503             |70         |fbodyaccmagmean              |numeric   |
|504             |71         |fbodyaccmagstd               |numeric   |
|513             |72         |fbodyaccmagmeanfreq          |numeric   |
|516             |73         |fbodybodyaccjerkmagmean      |numeric   |
|517             |74         |fbodybodyaccjerkmagstd       |numeric   |
|526             |75         |fbodybodyaccjerkmagmeanfreq  |numeric   |
|529             |76         |fbodybodygyromagmean         |numeric   |
|530             |77         |fbodybodygyromagstd          |numeric   |
|539             |78         |fbodybodygyromagmeanfreq     |numeric   |
|542             |79         |fbodybodygyrojerkmagmean     |numeric   |
|543             |80         |fbodybodygyrojerkmagstd      |numeric   |
|552             |81         |fbodybodygyrojerkmagmeanfreq |numeric   |

FYI: to get the above table in markdown format, use the 'knitr' library, and the 'kable' method such that kable(object_to_display) produces markdown text that can be copied into an .md file.

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



