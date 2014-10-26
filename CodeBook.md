Some variables in the Data sets：

Subject:
	The collection of subject train sets and subject test sets, sources respectively from UCI_HAR_Dataset/train/subject_train.txt and UCI_HAR_Dataset/test/subject_test.txt
	Each row of subject identifies the subject who performed the activity for each window sample. Its range is from 1 to 30

Activity:
	The collection of y train sets and y test sets, sources respectively from UCI_HAR_Dataset/train/y_train.txt (training labels) and UCI_HAR_Dataset/test/y_test.txt(testing labels)
	There are six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING), and the corresponding labels are 1, 2, 3, 4, 5 and 6

Features:
	There are 561 kinds of features, and these features are normalized and bounded within [-1,1]. 
	From each window, a vector of features was obtained by calculating variables from the time and frequency domain.
	The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz.

x data:
  The collection of x training data and test data, which are respectively from train/X_train.txt and test/X_test.txt. The dimension of the collection is 10299 * 561.

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.
tBodyAcc-XYZ
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
fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 
mean(): Mean value
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
angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:
gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean

most data files used in this code:
'features.txt': List of all features.
'train/X_train.txt': Training set.
'train/y_train.txt': Training labels.
'test/X_test.txt': Test set.
'test/y_test.txt': Test labels.
'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.
‘test/subject_test.txt’: similar to subject_train.txt, but it is a test data file not a train data file

  To clean up the data as we aspect, what we should do firstly is merging the training and the test sets to create one data set. Merge the x train data sets and x test data sets using the rbind() function, and we get a data set named x. We get y data set and subject data set in the same way. Then use the cbind() function to merge subject, y and x data sets into a new data set, which is just what data set we want. 
  Based on column names in the features is an open question as to is the entries that include mean() and std() at the end, or does it include entries with mean in an earlier part of the name as well. There are no specific marking criteria on the number of columns. Match the column names using the grepl() function, and output the matched columns, then we did it.
  Use activity names from features.txt to name the activities in the data set, and appropriately labels the data set with descriptive variable names.
  To create an independent tidy data set with the average of each variable for each activity and each subject, create a new data.frame including the subject, activity column and computed average using the mean() function.
