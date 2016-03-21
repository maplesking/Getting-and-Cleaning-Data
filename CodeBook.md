Code Book
=================
Getting and Cleaning Data Project

1. Dataset:
===================================================

The raw dataset are from the website of https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The description of the dataset can be found at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The following ((1.1-1.5)) are copied from the above websites and the document files of the raw dataset:

1.1 "Human Activity Recognition Using Smartphones Dataset:" 

"The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. "

1.2 "The following files are available for the train and test data. Their descriptions are equivalent." 

"- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second." 

1.3 "For each record it is provided:"

"- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment."

1.4 "Notes:" 

"- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file."

1.5 "Variables:"

"The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). "

"These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions."

"tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag"

"The set of variables that were estimated from these signals are: "

"mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors."

"Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:"

"gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean""

2. Transformations or work that I performed to clean up the data:
====================================================================
2.1. Create a directory to store the data

2.2. Download the data and unzip the data 

2.3. Set work directory

2.4. Merges the training and the test sets to create one data set.
2.4.1 Read the test data files ("subject_test.txt", "X_test.txt", "y_test.txt")
2.4.2 Merge the above test data files by column_bind function
2.4.3 Read the file of "features.txt"
2.4.4 Set the column names for testdata
2.4.5 Read the training data files ("subject_train.txt", "X_train.txt", "y_train.txt")
2.4.6 Merge the above train data files by column_bind function
2.4.7 Set the column names for traindata
2.4.8 Merge the testdata and traindata by row_bind function

2.5. Extracts only the measurements on the mean and standard deviation for each measurement.

2.6. Uses descriptive activity names to name the activities in the data set
2.6.1 Read the file of "activity_labels.txt"
2.6.2 Merge the above data frame with the "datameanstd" data frame

2.7. Appropriately labels the data set with descriptive variable names.
 (^t: time, ^f: frequency, Acc: Accelerator, Gyro: Gyroscope, Mag: Magnitude, mean(): Mean value, std(): Standard deviation)

2.8. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
2.8.1 Convert the "subject" column from integer to factor
2.8.2 Load "reshape2", melt "datameanstd" with id = c("subject", "activityname") and dcast it with mean function on the variables.
2.8.3 Write the tidy data into file "Tidy.txt".

3. Tidy Data
=================
3.1 Identifiers in the Tidy.txt:

subject - The ID of the test subject
activityname - The type of activity performed when the corresponding measurements were taken

3.2 Activity Labels and Names:

1 WALKING
2 WALKING_UPSTAIRS
3 WALKING_DOWNSTAIRS
4 SITTING
5 STANDING
6 LAYING

3.3 Columns' names in the Tidy.txt ( The values show the average of each variable for each activity and each subject):

 [1] "subject"                                                    
 [2] "activityname"                                               
 [3] "timeBodyAccelerator-MeanValue-X"                            
 [4] "timeBodyAccelerator-MeanValue-Y"                            
 [5] "timeBodyAccelerator-MeanValue-Z"                            
 [6] "timeGravityAccelerator-MeanValue-X"                         
 [7] "timeGravityAccelerator-MeanValue-Y"                         
 [8] "timeGravityAccelerator-MeanValue-Z"                         
 [9] "timeBodyAcceleratorJerk-MeanValue-X"                        
[10] "timeBodyAcceleratorJerk-MeanValue-Y"                        
[11] "timeBodyAcceleratorJerk-MeanValue-Z"                        
[12] "timeBodyGyroscope-MeanValue-X"                              
[13] "timeBodyGyroscope-MeanValue-Y"                              
[14] "timeBodyGyroscope-MeanValue-Z"                              
[15] "timeBodyGyroscopeJerk-MeanValue-X"                          
[16] "timeBodyGyroscopeJerk-MeanValue-Y"                          
[17] "timeBodyGyroscopeJerk-MeanValue-Z"                          
[18] "timeBodyAcceleratorMagnitude-MeanValue"                     
[19] "timeGravityAcceleratorMagnitude-MeanValue"                  
[20] "timeBodyAcceleratorJerkMagnitude-MeanValue"                 
[21] "timeBodyGyroscopeMagnitude-MeanValue"                       
[22] "timeBodyGyroscopeJerkMagnitude-MeanValue"                   
[23] "frequenceBodyAccelerator-MeanValue-X"                       
[24] "frequenceBodyAccelerator-MeanValue-Y"                       
[25] "frequenceBodyAccelerator-MeanValue-Z"                       
[26] "frequenceBodyAcceleratorJerk-MeanValue-X"                   
[27] "frequenceBodyAcceleratorJerk-MeanValue-Y"                   
[28] "frequenceBodyAcceleratorJerk-MeanValue-Z"                   
[29] "frequenceBodyGyroscope-MeanValue-X"                         
[30] "frequenceBodyGyroscope-MeanValue-Y"                         
[31] "frequenceBodyGyroscope-MeanValue-Z"                         
[32] "frequenceBodyAcceleratorMagnitude-MeanValue"                
[33] "frequenceBodyBodyAcceleratorJerkMagnitude-MeanValue"        
[34] "frequenceBodyBodyGyroscopeMagnitude-MeanValue"              
[35] "frequenceBodyBodyGyroscopeJerkMagnitude-MeanValue"          
[36] "timeBodyAccelerator-StandardDeviation-X"                    
[37] "timeBodyAccelerator-StandardDeviation-Y"                    
[38] "timeBodyAccelerator-StandardDeviation-Z"                    
[39] "timeGravityAccelerator-StandardDeviation-X"                 
[40] "timeGravityAccelerator-StandardDeviation-Y"                 
[41] "timeGravityAccelerator-StandardDeviation-Z"                 
[42] "timeBodyAcceleratorJerk-StandardDeviation-X"                
[43] "timeBodyAcceleratorJerk-StandardDeviation-Y"                
[44] "timeBodyAcceleratorJerk-StandardDeviation-Z"                
[45] "timeBodyGyroscope-StandardDeviation-X"                      
[46] "timeBodyGyroscope-StandardDeviation-Y"                      
[47] "timeBodyGyroscope-StandardDeviation-Z"                      
[48] "timeBodyGyroscopeJerk-StandardDeviation-X"                  
[49] "timeBodyGyroscopeJerk-StandardDeviation-Y"                  
[50] "timeBodyGyroscopeJerk-StandardDeviation-Z"                  
[51] "timeBodyAcceleratorMagnitude-StandardDeviation"             
[52] "timeGravityAcceleratorMagnitude-StandardDeviation"          
[53] "timeBodyAcceleratorJerkMagnitude-StandardDeviation"         
[54] "timeBodyGyroscopeMagnitude-StandardDeviation"               
[55] "timeBodyGyroscopeJerkMagnitude-StandardDeviation"           
[56] "frequenceBodyAccelerator-StandardDeviation-X"               
[57] "frequenceBodyAccelerator-StandardDeviation-Y"               
[58] "frequenceBodyAccelerator-StandardDeviation-Z"               
[59] "frequenceBodyAcceleratorJerk-StandardDeviation-X"           
[60] "frequenceBodyAcceleratorJerk-StandardDeviation-Y"           
[61] "frequenceBodyAcceleratorJerk-StandardDeviation-Z"           
[62] "frequenceBodyGyroscope-StandardDeviation-X"                 
[63] "frequenceBodyGyroscope-StandardDeviation-Y"                 
[64] "frequenceBodyGyroscope-StandardDeviation-Z"                 
[65] "frequenceBodyAcceleratorMagnitude-StandardDeviation"        
[66] "frequenceBodyBodyAcceleratorJerkMagnitude-StandardDeviation"
[67] "frequenceBodyBodyGyroscopeMagnitude-StandardDeviation"      
[68] "frequenceBodyBodyGyroscopeJerkMagnitude-StandardDeviation"  





