Getting and Cleaning Data : Course Project

### Some data files used in the code:
* 'features.txt': List of all features.
* 'train/X_train.txt': Training set.
* 'train/y_train.txt': Training labels.
* 'test/X_test.txt': Test set.
* 'test/y_test.txt': Test labels.
* 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.
‘test/subject_test.txt’: similar to subject_train.txt, but it is a test data file not a train data file

### I、Reading Data Sets
  First of all, we need to read training and test data into R using the read.table() function. Data in subject_train.txt, subject_test.txt, X_train.txt, X_test.txt, y_train.txt and y_test.txt will be read in R environment in this step.

### II、Merging the Training and the Test Sets
  To clean up the data as we aspect, what we should do now is merging the training and the test sets to create one data set. Merge the x train data sets and x test data sets using the rbind() function, and we get a data set named x. We get y data set and subject data set in the same way. Then use the cbind() function to merge subject, y and x data sets into a new data set called data in the code, which is just what data set we want. 

### III、Names Variables
  There are six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING), and the corresponding labels are 1, 2, 3, 4, 5 and 6). Now we use readable names (like Walking, Walking_Up) to repalce the labels (1, 2, 3, 4,5 and 6).
  561 kinds of features in features.txt names will be assigned to the names of x data set (e.g. names(x) <- features[, 2]).
  The subject column is named "subject", and the activity column has its name - "activity" in the code.

### IV、Extracting Satisfactory Measurements from data
  Based on column names in the features is an open question as to is the entries that include mean() and std() at the end, or does it include entries with mean in an earlier part of the name as well. There are no specific marking criteria on the number of columns.
The grepl() function is playing a significant role in making the screening condition to select the right columns of the data. Output the matched columns, then we make it.

### V、A New Tidy Data Set with the Average of Each variable tidy data set with the average of each variable
  We get the subject column to create a new data.frame named average, then extend the columns with the function cbind(). The activity column is added to the average data.frame. 
  Get the transposition of x and turn the intermediate result into data.frame , then compute its average call mean with sapply() function. Add mean into the average data.frame, and wirte it to the disk, then we get the average.txt which is what file we want.
