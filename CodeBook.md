---
title: "CodeBook.md"
author: "Anes"
date: "01 11 2020"
output: html_document
---


## Original data

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip


## Transformation
The original data were transformed as follows in the assignment:

1. Merged the training and the test sets to create one data set: all_joined

2. Extracted only the measurements on the mean and standard deviation for each measurement: mean_and_std_data

3. Used descriptive activity names to name the activities in the data set: names took from 'activity_labels.txt' file

4. Appropriately labeled the data set with descriptive variable names: columns names took from 'features.txt' file

5. From the data set in step 4, created a second, independent tidy data set with the average of each variable for each activity and each subject: dataSet2