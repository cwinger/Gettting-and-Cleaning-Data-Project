### Codebook for HAR using Smartphones tidy data set

## Raw Data

Comes from the HAR using Smartphones data set
In particular, uses the following files:

Subjects:
 - “UCI HAR Dataset/test/subject_test.txt"
 - “UCI HAR Dataset/train/subject_train.txt"

Activities:
 - “UCI HAR Dataset/test/Y_test.txt"
 - “UCI HAR Dataset/train/Y_train.txt"

Activity descriptions:
 - “UCI HAR Dataset/activity_labels.txt"

Features names: 
 - “UCI HAR Dataset/features.txt"

Smartphone Data:
 - “UCI HAR Dataset/test/X_test.txt"
 - “UCI HAR Dataset/train/X_train.txt"

## Transformations

 - Subjects for both subject_test file and subject_train file were combined.
 - Activities from Y_test and Y_train files were combined
 - Activities were then transformed from codes 1-6 to the readable descriptions stored in 
	activity_labels.txt
 - feature names were cleaned.  Only features with “mean()” or “std()” in the name were 	included.  See below for final feature names.
 - Special characters such as - ( ) were replaced with “_” in feature names for 
	readability.  
 - Some feature names containing “BodyBody” were cleaned by removing the second “Body”
 - Smartphone data from X_test and X_train were combined.  Additionally, only columns with
	“std()” or “mean()” in the feature name were included.  
 - All combinations occurred by appending the test file to the end of the corresponding
	train file.
 - Subjects, activities and feature data were combined into one table by appending the
	columns in that order.  the cleaned feature names were used for column headers,
	with “subject” and “activity” included for the first two columns. This table is
	stored in “tidy data.txt”
 - The table in “tidydata.txt” is aggregated to create a row for each subject and activity 
	combination. Each row aggregates using the mean.  This aggregate table is stored
	in “tidydataSummary.txt”

## Column Names of tidydata.txt and tidydataSummary.txt

"subject"      
"activity"              
"tBodyAcc_mean_X"       
"tBodyAcc_mean_Y"      
"tBodyAcc_mean_Z"       
"tBodyAcc_std_X"        
"tBodyAcc_std_Y"        
"tBodyAcc_std_Z"       
"tGravityAcc_mean_X"    
"tGravityAcc_mean_Y"    
"tGravityAcc_mean_Z"    
"tGravityAcc_std_X"    
"tGravityAcc_std_Y"     
"tGravityAcc_std_Z"     
"tBodyAccJerk_mean_X"   
"tBodyAccJerk_mean_Y"  
"tBodyAccJerk_mean_Z"   
"tBodyAccJerk_std_X"    
"tBodyAccJerk_std_Y"    
"tBodyAccJerk_std_Z"   
"tBodyGyro_mean_X"      
"tBodyGyro_mean_Y"      
"tBodyGyro_mean_Z"      
"tBodyGyro_std_X"      
"tBodyGyro_std_Y"       
"tBodyGyro_std_Z"       
"tBodyGyroJerk_mean_X"  
"tBodyGyroJerk_mean_Y" 
"tBodyGyroJerk_mean_Z"  
"tBodyGyroJerk_std_X"   
"tBodyGyroJerk_std_Y"   
"tBodyGyroJerk_std_Z"  
"tBodyAccMag_mean"      
"tBodyAccMag_std"       
"tGravityAccMag_mean"   
"tGravityAccMag_std"   
"tBodyAccJerkMag_mean"  
"tBodyAccJerkMag_std"   
"tBodyGyroMag_mean"     
"tBodyGyroMag_std"     
"tBodyGyroJerkMag_mean" 
"tBodyGyroJerkMag_std"  
"fBodyAcc_mean_X"       
"fBodyAcc_mean_Y"      
"fBodyAcc_mean_Z"       
"fBodyAcc_std_X"        
"fBodyAcc_std_Y"        
"fBodyAcc_std_Z"       
"fBodyAccJerk_mean_X"   
"fBodyAccJerk_mean_Y"   
"fBodyAccJerk_mean_Z"   
"fBodyAccJerk_std_X"   
"fBodyAccJerk_std_Y"    
"fBodyAccJerk_std_Z"    
"fBodyGyro_mean_X"      
"fBodyGyro_mean_Y"     
"fBodyGyro_mean_Z"     
"fBodyGyro_std_X"       
"fBodyGyro_std_Y"       
"fBodyGyro_std_Z"      
"fBodyAccMag_mean"      
"fBodyAccMag_std"       
"fBodyAccJerkMag_mean"  
"fBodyAccJerkMag_std"  
"fBodyGyroMag_mean"     
"fBodyGyroMag_std"      
"fBodyGyroJerkMag_mean" 
"fBodyGyroJerkMag_std"