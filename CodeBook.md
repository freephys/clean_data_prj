---
title: "CodeBook"
author: "Ning Shen"
date: "Wednesday, July 22, 2015"
output: html_document
---

##Data Descriptions

The source data comes from two parts: test data set and train data set. 


1.activity_label.txt : two columns data with all the six different activity types collected in 2nd column
2.features.txt : two columns data with 561 measured features in the 2nd column, where we only interested features related to the mean and standard deviation values.
3.Under test/train sub-directory:
+x_test.txt or x_train.txt : wide-format data with dimention 2947*561, each features are listed in each column
+y_test.txt or y_train.txt : single column data with activity type coded with numeric numbers
+subject_test.txt or subject_train.txt : single column data with subject coded with numeric numbers

##Data Cleaning steps

1. select_feature function is written to read input files and output a data.table with selected features in each column. 
2. Corresponding output from train and test data set are combined
3. The wide-formated data is converted into long formated with Fast melt for data.table. The three columns specified by id_labels from the wide-formatted data are left intact. The remaining columns specified by measure.vars are all converted into long format.
4. For data.table object obtained from step 3, we did a dcast to convert it back to wide-format to be written to output file: tidy_data.txt. Formula " subject + Activity_Label ~ variable " are used to describe the shape of the data, where subject + Activity_Label are the ID variables (we want a column for each) and variable  describes the measured variables. Since we merge test and train data set, there can be ultiple values per cell When you cast your data.You also need to tell dcast how to aggregate the data, which we take the "mean" values here.
