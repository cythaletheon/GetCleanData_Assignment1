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

|Original Column |New Column |Variable Name                |
|:---------------|:----------|:----------------------------|
|#0              |1          |subjectid                    |
|#1              |2          |activity                     |
|1               |3          |tbodyaccmeanx                |
|2               |4          |tbodyaccmeany                |
|3               |5          |tbodyaccmeanz                |
|4               |6          |tbodyaccstdx                 |
|5               |7          |tbodyaccstdy                 |
|6               |8          |tbodyaccstdz                 |
|41              |9          |tgravityaccmeanx             |
|42              |10         |tgravityaccmeany             |
|43              |11         |tgravityaccmeanz             |
|44              |12         |tgravityaccstdx              |
|45              |13         |tgravityaccstdy              |
|46              |14         |tgravityaccstdz              |
|81              |15         |tbodyaccjerkmeanx            |
|82              |16         |tbodyaccjerkmeany            |
|83              |17         |tbodyaccjerkmeanz            |
|84              |18         |tbodyaccjerkstdx             |
|85              |19         |tbodyaccjerkstdy             |
|86              |20         |tbodyaccjerkstdz             |
|121             |21         |tbodygyromeanx               |
|122             |22         |tbodygyromeany               |
|123             |23         |tbodygyromeanz               |
|124             |24         |tbodygyrostdx                |
|125             |25         |tbodygyrostdy                |
|126             |26         |tbodygyrostdz                |
|161             |27         |tbodygyrojerkmeanx           |
|162             |28         |tbodygyrojerkmeany           |
|163             |29         |tbodygyrojerkmeanz           |
|164             |30         |tbodygyrojerkstdx            |
|165             |31         |tbodygyrojerkstdy            |
|166             |32         |tbodygyrojerkstdz            |
|201             |33         |tbodyaccmagmean              |
|202             |34         |tbodyaccmagstd               |
|214             |35         |tgravityaccmagmean           |
|215             |36         |tgravityaccmagstd            |
|227             |37         |tbodyaccjerkmagmean          |
|228             |38         |tbodyaccjerkmagstd           |
|240             |39         |tbodygyromagmean             |
|241             |40         |tbodygyromagstd              |
|253             |41         |tbodygyrojerkmagmean         |
|254             |42         |tbodygyrojerkmagstd          |
|266             |43         |fbodyaccmeanx                |
|267             |44         |fbodyaccmeany                |
|268             |45         |fbodyaccmeanz                |
|269             |46         |fbodyaccstdx                 |
|270             |47         |fbodyaccstdy                 |
|271             |48         |fbodyaccstdz                 |
|294             |49         |fbodyaccmeanfreqx            |
|295             |50         |fbodyaccmeanfreqy            |
|296             |51         |fbodyaccmeanfreqz            |
|345             |52         |fbodyaccjerkmeanx            |
|346             |53         |fbodyaccjerkmeany            |
|347             |54         |fbodyaccjerkmeanz            |
|348             |55         |fbodyaccjerkstdx             |
|349             |56         |fbodyaccjerkstdy             |
|350             |57         |fbodyaccjerkstdz             |
|373             |58         |fbodyaccjerkmeanfreqx        |
|374             |59         |fbodyaccjerkmeanfreqy        |
|375             |60         |fbodyaccjerkmeanfreqz        |
|424             |61         |fbodygyromeanx               |
|425             |62         |fbodygyromeany               |
|426             |63         |fbodygyromeanz               |
|427             |64         |fbodygyrostdx                |
|428             |65         |fbodygyrostdy                |
|429             |66         |fbodygyrostdz                |
|452             |67         |fbodygyromeanfreqx           |
|453             |68         |fbodygyromeanfreqy           |
|454             |69         |fbodygyromeanfreqz           |
|503             |70         |fbodyaccmagmean              |
|504             |71         |fbodyaccmagstd               |
|513             |72         |fbodyaccmagmeanfreq          |
|516             |73         |fbodybodyaccjerkmagmean      |
|517             |74         |fbodybodyaccjerkmagstd       |
|526             |75         |fbodybodyaccjerkmagmeanfreq  |
|529             |76         |fbodybodygyromagmean         |
|530             |77         |fbodybodygyromagstd          |
|539             |78         |fbodybodygyromagmeanfreq     |
|542             |79         |fbodybodygyrojerkmagmean     |
|543             |80         |fbodybodygyrojerkmagstd      |
|552             |81         |fbodybodygyrojerkmagmeanfreq |

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



