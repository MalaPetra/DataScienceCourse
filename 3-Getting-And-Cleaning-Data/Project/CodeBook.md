# Getting and Cleaning Data 

## Introduction

This codebook describes the data and work performed on data.

Full description of the data can be found on . The data can be found here: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

## Attributes Information

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope.
- A 561-feature vector with time and frequency domain variables.
- Its activity label.
- An identifier of the subject who carried out the experiment.

## Data Transformation 


###Step 1. 

In the first part of the assignment, I download the data, unzip the file CI HAR Dataset folder, read files into R and assign name to variables.

Files Used: 
- features.txt
- activity_labels.txt
- X_train
- X_test
- y_train
- y_test
- subject_train
- subject_test


###Step 2. 

In step 2, I created train set by binding y_train, subject_train and x_train and test set by binding y_test. At the end, I merged both datasets together.

###Step 3. 

Extracting only the measurements on the mean and standard deviation for each measurement.

###Step 4. 

Replace activity id with name of activity.

###Step 5. 

Change and use appropriate label names to be make data readable. 

###Step 6. 

Create a second, independent tidy data set with the average of each variable for each activity and each subject and writing it to FinalOutput.txt file.

