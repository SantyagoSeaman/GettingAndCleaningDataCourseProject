# Getting and Cleaning Data Course Project Code Book
## Data source
The experiment data was collected from a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz were captured. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

For each record it is provided:

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

## Raw data brief

The raw data can be located at the following URL:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Both the "test" and "train" folders consisted of three files:

- `subject` file contains the ID number of the individual performing the activity
- `X` file contains the actual data measurements
- `Y` file contains data identifying which of the six activities was being performed at time of measurement

Also there are two common references located in the root directory of data archive:
- `features.txt` consists of column names for data located in X
- `activity_labels.txt` consists of labels for activities

## Goals

- Merges the training and the test sets to create one data set.
- Extracts only the measurements on the mean and standard deviation for each measurement. 
- Uses descriptive activity names to name the activities in the data set
- Appropriately labels the data set with descriptive variable names. 
- From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Preparatory steps

Before launch the script `run_alaysis.R` you have to unpack archive with data to root directory of project

## Tranformation steps

1. Load and clean reference data from `features.txt` and `activity_labels.txt` files
2. Rename features list using descriptive and meaningful names using `gsub` function
2. Load and merge TEST data using `cbind` function
3. Load and merge TRAIN data using `cbind` function
4. Merge TEST and TRAIN datasets to raw dataset using `rbind` function
5. Get column names list which includes only required (with mean() and std() values) using `grep` function
6. Get only required columns from raw dataset and create dataset with tidy data
7. Create dataset with the average of each variable for each activity and each subject
8. Write mean_tidy_data_set.txt

## Variables

- `feature_names` - Feature names list after transformation
- `activity_labels` - Activity lables reference
- `merged_test_data` - TEST data merged to single dataset
- `merged_train_data` - TRAIN data merged to single dataset
- `all_data` - Test and train dataset merget to single dataset
- `mean_col_names` - Column names with mean measurements
- `std_col_names` - Column names with standard deviation measurements
- `tidy_data` - Slices dataset with only required columns with mean and standard deviation measurements
- `mean_data` - Dataset with the average of each variable for each activity and each subject

## Resulting tidy dataset format

### Final dataset consists of 68 columns:

* `subject`
* `activity`
* `TimeBodyAccelerometer_mean_X`
* `TimeBodyAccelerometer_mean_Y`
* `TimeBodyAccelerometer_mean_Z`
* `TimeGravityAccelerometer_mean_X`
* `TimeGravityAccelerometer_mean_Y`
* `TimeGravityAccelerometer_mean_Z`
* `TimeBodyAccelerometerJerk_mean_X`
* `TimeBodyAccelerometerJerk_mean_Y`
* `TimeBodyAccelerometerJerk_mean_Z`
* `TimeBodyGyroscope_mean_X`
* `TimeBodyGyroscope_mean_Y`
* `TimeBodyGyroscope_mean_Z`
* `TimeBodyGyroscopeJerk_mean_X`
* `TimeBodyGyroscopeJerk_mean_Y`
* `TimeBodyGyroscopeJerk_mean_Z`
* `TimeBodyAccelerometerMagnitude_mean`
* `TimeGravityAccelerometerMagnitude_mean`
* `TimeBodyAccelerometerJerkMagnitude_mean`
* `TimeBodyGyroscopeMagnitude_mean`
* `TimeBodyGyroscopeJerkMagnitude_mean`
* `FrequencyBodyAccelerometer_mean_X`
* `FrequencyBodyAccelerometer_mean_Y`
* `FrequencyBodyAccelerometer_mean_Z`
* `FrequencyBodyAccelerometerJerk_mean_X`
* `FrequencyBodyAccelerometerJerk_mean_Y`
* `FrequencyBodyAccelerometerJerk_mean_Z`
* `FrequencyBodyGyroscope_mean_X`
* `FrequencyBodyGyroscope_mean_Y`
* `FrequencyBodyGyroscope_mean_Z`
* `FrequencyBodyAccelerometerMagnitude_mean`
* `FrequencyBodyAccelerometerJerkMagnitude_mean`
* `FrequencyBodyGyroscopeMagnitude_mean`
* `FrequencyBodyGyroscopeJerkMagnitude_mean`
* `TimeBodyAccelerometer_std_X`
* `TimeBodyAccelerometer_std_Y`
* `TimeBodyAccelerometer_std_Z`
* `TimeGravityAccelerometer_std_X`
* `TimeGravityAccelerometer_std_Y`
* `TimeGravityAccelerometer_std_Z`
* `TimeBodyAccelerometerJerk_std_X`
* `TimeBodyAccelerometerJerk_std_Y`
* `TimeBodyAccelerometerJerk_std_Z`
* `TimeBodyGyroscope_std_X`
* `TimeBodyGyroscope_std_Y`
* `TimeBodyGyroscope_std_Z`
* `TimeBodyGyroscopeJerk_std_X`
* `TimeBodyGyroscopeJerk_std_Y`
* `TimeBodyGyroscopeJerk_std_Z`
* `TimeBodyAccelerometerMagnitude_std`
* `TimeGravityAccelerometerMagnitude_std`
* `TimeBodyAccelerometerJerkMagnitude_std`
* `TimeBodyGyroscopeMagnitude_std`
* `TimeBodyGyroscopeJerkMagnitude_std`
* `FrequencyBodyAccelerometer_std_X`
* `FrequencyBodyAccelerometer_std_Y`
* `FrequencyBodyAccelerometer_std_Z`
* `FrequencyBodyAccelerometerJerk_std_X`
* `FrequencyBodyAccelerometerJerk_std_Y`
* `FrequencyBodyAccelerometerJerk_std_Z`
* `FrequencyBodyGyroscope_std_X`
* `FrequencyBodyGyroscope_std_Y`
* `FrequencyBodyGyroscope_std_Z`
* `FrequencyBodyAccelerometerMagnitude_std`
* `FrequencyBodyAccelerometerJerkMagnitude_std`
* `FrequencyBodyGyroscopeMagnitude_std`
* `FrequencyBodyGyroscopeJerkMagnitude_std`
