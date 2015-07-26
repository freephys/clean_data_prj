---
title: "README"
author: "Ning Shen"
date: "Wednesday, July 22, 2015"
output: html_document
---
##Introduction
This tool is used to prepare tidy data collected from accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

It contains two other scripts in addition to this readme file.

1. run_analysis.R
This R script is the core part which has the following functions:
+ Merges the training and the test sets to create one data set.
+ Extracts only the measurements on the mean and standard deviation for each measurement. 
+ Uses descriptive activity names to name the activities in the data set
+ Appropriately labels the data set with descriptive variable names. 

2. CodeBook.md
It is a markdown document to demonstrate the usage of the run_analysis.R to clean up the data as well as descriptions of the variables, the data, and any transformations performed to the data

##How to run the example
1.Download data from : https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
and unzip it
2.Run the R script from the same directory of the downloaded zip file and output tidy_data.txt is written in the same directory


