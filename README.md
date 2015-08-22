==================================================================
run_analysis.R
Program to find the average of each variable for each activity and each subject based on data from "Human Activity Recognition Using Smartphones Dataset"
Version 1.0
==================================================================
Vimal Natarajan
==================================================================

Script Execution Requirement
==================================================================

The script "run_analysis.R" expects the following directories and files to be present at the same level as the where the script is.

---|---run_analysis.R 
   |---features.txt 
   |---activity_labels.txt 
   |---/train 
       |---X_train.txt 
	   |---y_train.txt 
	   |---subject_train.txt 
   |---/test
       |---X_test.txt 
	   |---y_test.txt 
	   |---subject_test.txt 
   

The script finds the average of each variable for each activity and each subject based on data from "Human Activity Recognition Using Smartphones Dataset" and outputs the result in a text file.

The whole script is contained in a function called biodata().

The script first loads the required R libraries namely, plyr, dplyr and reshape in that order.
First the script reads the meta data for the dataset.
Then the script reads the various training data from the different training datasets and assigns them to different data frames.  
The script then reads the various test  data from the different test datasets and assigns them to different data frames.  
After reading the training and test datasets the script then merges both the datasets row wise.  
After the merge, the data frame columns contain default labels like V1, V2 etc. The script reads the Features text file and assigns meaningful columns labels.
The mean and standard deviation columns alone are extracted using grepl function matching for column labels with "mean()" and "std()".
At this point in time the data frame contains numbers (1, 2 etc.) for the activities instead of labels like WALKING, LAYING etc.
The script then reads the text file containing the labels and assigns meaningful labels for the activities.
The first 2 columns are appropriately labeled as "Subject" and "ActivityName".
The data in the 3 different data frames are merged column wise.
This single merged data frame is then grouped by Subject and Activity and the mean values for all their readings are calcualted.
This data frame is then sorted by Subject and the final output is writtten as a text file.
  

The delivery package includes the following files:
==================================================

- 'README.md': [This file] Explains how the script works and various files involved in the delivery package.

- 'CodeBook.md': Describes the variables, the data, and transformations or work that was performed to clean up the data.

- 'run_analysis.R': List of all features.

- 'HAR_mean_sorted.txt': Training set.


Notes: 
======
- The output is sorted by Subject.
- Each Subject and Activity combination is a row on the output text file.

License:
========
This programmay be used only after communicating and receiving an acknowledgement from the author. 

This program is distributed AS-IS and no responsibility implied or explicit can be addressed to the author or their institutions for its use or misuse. Any commercial use is prohibited.

Vimal Natarajan