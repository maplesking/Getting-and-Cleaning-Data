Getting and Cleaning Data Project 

This Github repo includes the following files:

- 'CodeBook.md': shows the information about the raw data, the tidy data (Tidy.txt), and the R script (run_analysis.R) used to process the raw data to get tidy data. 

- 'Tidy.txt': has 180 observations and 68 variables. The IDs are "subject" and "activityname". The other variables are the average of each variable(that is the mean and standard deviation for each measurement) for each activity and each subject. 

- 'run_analysis.R': processes the raw data to get the tidy data with the following steps:
1. Create a directory to store the raw dataset.
2. Download the raw dataset and unzip it. 
3. Set work directory.
4. Merges the training and the test sets to create one data set.
5. Extracts only the measurements on the mean and standard deviation for each measurement.
6. Uses descriptive activity names to name the activities in the data set.
7. Appropriately labels the data set with descriptive variable names.
8. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

The above files are submitted according to the requirements of the Getting and Cleaning Data Project from the following website:

https://www.coursera.org/learn/data-cleaning/peer/FIZtT/getting-and-cleaning-data-course-project

The following are copied from the above website:

"You will be required to submit: 
1) a tidy data set as described below, 
2) a link to a Github repository with your script for performing the analysis, and 
3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. 
You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected."

"You should create one R script called run_analysis.R that does the following.
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject."





