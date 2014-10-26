## Merging the Training and Test data, do some naming and extraction operations as asked
run_analysis <- function() {

## read subject training and test data into R, and merge them to a new data set named "subject"
subject_train <- read.table("UCI_HAR_Dataset/train/subject_train.txt")    
subject_test <- read.table("UCI_HAR_Dataset/test/subject_test.txt")       
subject <- rbind(subject_train, subject_test)                             
names(subject) <- "subject"                                               

## read y training and test data into R, and merge them to a new data set named "activity"
y_train <- read.table("UCI_HAR_Dataset/train/y_train.txt")                
y_test <- read.table("UCI_HAR_Dataset/test/y_test.txt")                   
y <- rbind(y_train, y_test)                                                
names(y) <- "activity"                                                    

## read x training and test data into R, and merge them to a new data set named "x"
x_train <- read.table("UCI_HAR_Dataset/train/X_train.txt")                 
x_test <- read.table("UCI_HAR_Dataset/test/X_test.txt")                   
x <- rbind(x_train, x_test)                                               

## read features.txt and assign the second column content to the names of x data
features <- read.table("UCI_HAR_Dataset/features.txt") 
names(x) <- features[, 2] 

## merge the training and the test sets to create one data set
data <- cbind(subject, y, x)    

## create condition of matching "mean()" or "std()"
match_mean <- grepl("mean()", names(data))                  
match_std <- grepl("std()", names(data))
match <- match_mean | match_std                             

##extracts the measurements on the mean and standard 
mean_std <- data[condition] 

## naming the activities 
data[, "activity"][data[, "activity"] == 1] <- "WALKING"
data[, "activity"][data[, "activity"] == 2] <- "WALKING_UPSTAIRS"
data[, "activity"][data[, "activity"] == 3] <- "WALKING_DOWNSTAIRS"
data[, "activity"][data[, "activity"] == 4] <- "SITTING"
data[, "activity"][data[, "activity"] == 5] <- "STANDING"
data[, "activity"][data[, "activity"] == 6] <- "LAYING"

## creating a new independent tidy data set
ave <- data["subject"] 
ave <- cbind(ave, data[, "activity"]) 

## get the transposition of x and turn it into data.frame
x_t <- t(x)                                             
x_t <- as.data.frame(x_t)

## compute the average and add it into ave                               
mean <- sapply(x_t, mean)                                 
ave <- cbind(ave, mean)                         
names(ave) <- c("subject", "activity", "ave")      

## creating txt file
write.table(ave, "ave.txt", row.name = FALSE)   

}
