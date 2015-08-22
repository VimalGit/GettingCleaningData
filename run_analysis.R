biodata <- function() {
  
  ## Load required R libraries
  library(plyr)
  library(dplyr)
  library(reshape)
  
  ## Read the meta data
  features <- read.table("features.txt")
  activity_labels <- read.table("activity_labels.txt")
  
  ## Read the training data
  X_train <- read.table("train/X_train.txt")
  y_train <- read.table("train/y_train.txt")
  subject_train <- read.table("train/subject_train.txt")

  ## Read the test data
  X_test <- read.table("test/X_test.txt")
  y_test <- read.table("test/y_test.txt")
  subject_test <- read.table("test/subject_test.txt")

  ## Merge the train and test data
  X_all <- rbind(X_train, X_test)
  y_all <- rbind(y_train, y_test)
  subject_all <- rbind(subject_train, subject_test)

  ## Assign feature labels
  names(X_all) <- features$V2
  
  ## Extract only the measurements on the mean and standard deviation for each measurement
  X_all_mean_std <- X_all[,grepl("mean\\(\\)|std\\(\\)", names(X_all))]

  ## Assign descriptive activity names to name the activities in the data set
  y_all_labels <- join(y_all, activity_labels, type="inner")
  y_all_activity_name <- data.frame(y_all_labels$V2)

  names(subject_all) <- c("Subject")
  names(y_all_activity_name) <- c("ActivityName")
  
  ## Merge all 3 tables
  samsung_tidy_data <- cbind(subject_all, y_all_activity_name, X_all_mean_std)

  ## Calculate the mean of the data after grouping them by subject and activity
  mean_data <- aggregate(samsung_tidy_data[,-(1:2)], list(Subject=samsung_tidy_data$Subject, Activity=samsung_tidy_data$ActivityName), mean)
  
  ## Sort the data by Subject
  mean_data_sorted <- arrange(mean_data, Subject)
  
  ## Write the data to output table
  write.table(mean_data_sorted, file="samsung_mean_sorted.csv", sep=",", row.names = FALSE)
  
  }