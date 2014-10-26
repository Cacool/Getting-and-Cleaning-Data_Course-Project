## Merging the Training and Test data, do some naming and extraction operations as asked
run_analysis <- function() {

## read subject training and test data into R, and merge them to a new data set named "subject"
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")    
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")       
subject <- rbind(subject_train, subject_test)                             
names(subject) <- "subject"                                               

## read y training and test data into R, and merge them to a new data set named "activity"
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")                
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")                   
y <- rbind(y_train, y_test)                                                
names(y) <- "activity"                                                    

## read x training and test data into R, and merge them to a new data set named "x"
x_train <- read.table("./UCI HAR Dataset/train/X_train.txt")                 
x_test <- read.table("./UCI HAR Dataset/test/X_test.txt")                   
x <- rbind(x_train, x_test)                                               

## read features.txt and assign the second column content to the names of x data
features <- read.table("./UCI HAR Dataset/features.txt") 
names(x) <- features[, 2] 

## merge the training and the test sets to create one data set
data <- cbind(subject, y, x)

## create condition of matching "mean()" or "std()"
match_mean <- grepl("mean()", names(data))                  
match_std <- grepl("std()", names(data))
match <- match_mean | match_std                             

##extracts the measurements on the mean and standard and create a new data set named data_ext
mean_std <- data[match]
data_ext <- cbind(subject, y, mean_std)
names(data_ext) <- c("subject", "activity", names(mean_std))

## naming the activities 
data_ext[, "activity"][data_ext[, "activity"] == 1] <- "Walking"
data_ext[, "activity"][data_ext[, "activity"] == 2] <- "Walking_Up"
data_ext[, "activity"][data_ext[, "activity"] == 3] <- "Walking_Down"
data-ext[, "activity"][data_ext[, "activity"] == 4] <- "Sitting"
data_ext[, "activity"][data_ext[, "activity"] == 5] <- "Standing"
data_ext[, "activity"][data_ext[, "activity"] == 6] <- "Laying"

rownum <- nrow(data_ext)
colnum <- ncol(data_ext)

## initial variables setting
subject_len <- length(unique(subject[, 1]))
activity_names <- c("Walking", "Walking_Up", "Walking_Down", "Sitting", "Standing", "Laying")

## assign NULL to the initial data.frame
tidy_data <- data.frame(NULL)
x_same <- data.frame(NULL)

for(s in 1:subject_length){           			## subject name
	for(a in activity_names){           		  ## activity name

		names <- c(s, a)                		    ## the collection of subject and activity names

		for(i in 1:rownum){               		
			name_temp <- c(data_ext[i, "subject"], data_ext[i, "activity"])
			if(all(names == name_temp)){    	    ## if matching successfully, store the content of this row
			x_same <- rbind(x_same, data_ext[i, 3:colnum])
		}                                 		  ## if
		}                                 		
		
		x_mean <- sapply(x_same, mean)    		## compute the average we want
		tidy_data <- rbind(tidy_data, c(names, x_mean))   ## construct the tidy data set
		x_same <- data.frame(NULL)        		## for next loop

		}                                 		
}                                     			

## set the names of tidy data set
names(tidy_data) <- names(data_ext)   

## creating txt file and store the tidy data
write.table(tidy_data, "tidy_data_average.txt", row.name = FALSE)   

}
