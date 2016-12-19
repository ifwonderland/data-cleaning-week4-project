#Data Cleaing Project 


##Summary
The script run_analysis.R reads raw readings from training and testing data recorded in "Human Activity Recognition Using Smartphones Dataset" (more description on the raw data set please read [this:](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)).  

The script merges testing and training data sets together, extra only mean and std for each measures, and summarize mean for each feature with user friendly labels. And output tidy data in person-activity-features-mean.txt. 


##How to run analysis script
###Data
Raw data has already been load/downloaded into "dataset" folder, if you want to download them, you can find data [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) and unzip to "dataset" folder. 

###Run script
The script is presented as one file with no functions, you can simple run "source("run_analysis.R")", and once finished, you can find clean data output at "person-activity-features-mean.txt" in the same folder

###Read output 
Simply run
"cleandata <- read.table("person-activity-features-mean.txt")" and you will be able to see data frame with clean data.
Detailed description on the features of data, please see CodeBook.md in the same folder. 


##How Data are processed in the script
Detailed steps can also be found in comments of the run_analysis.R script

###Raw data processing
Subject/person testing and training data were merged.
Features testing and training data were merged and also properly labeled with feature info.
Readings testing and training data were merged and also only mean and standard deviation measures are extracted.
Activty testing and training were merged and labeled with corresponding activity type. 

###Tidy data
The aforementione data were then group by person and activity and then summarized with mean for each measure. 
After joining and merging, each column represents one measures, each row represents on person, one activity type. This clean were later on written to the output file. 


###References
[Coursera final project](https://www.coursera.org/learn/data-cleaning/peer/FIZtT/getting-and-cleaning-data-course-project)
[Hadley Wickham paper on tidy data](http://vita.had.co.nz/papers/tidy-data.pdf)


