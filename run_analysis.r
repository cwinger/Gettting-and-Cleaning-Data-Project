run_analysis <- function() {
  # This code reads in smartphone data from UCI HAR dataset. 
  # It then merges the data to create a tidy data set which 
  # only includes values for the mean and standard deviation.
  
  # Read subject data and merge subjects from test and train into one vector
  subjectstest = read.table("./UCI HAR Dataset/test/subject_test.txt")
  subjectstrain = read.table("./UCI HAR Dataset/train/subject_train.txt")
  subjects = rbind(subjectstrain,subjectstest)
  
  # Read activities data and merge anactivities from test and train into one vector
  activitytest = read.table("./UCI HAR Dataset/test/Y_test.txt")
  activitytrain = read.table("./UCI HAR Dataset/train/Y_train.txt")
  activity = rbind(activitytrain,activitytest)

  # Transform the activity ids into corresponding labels for readability
  activity_labels = read.table("./UCI HAR Dataset/activity_labels.txt",sep = " ",stringsAsFactors = FALSE)
  activity = sapply(activity,function(x){activity_labels$V2[x]})
  
  # Extract the feature names for mean and std only. Rename the features to remove special characters
  features = read.table("./UCI HAR Dataset/features.txt",sep = " ",stringsAsFactors = FALSE)
  fnames = sapply(features$V2,function(x){ ifelse(grepl("-std()",x)|grepl("-mean()",x),ifelse(grepl("-meanFreq()",x),FALSE,TRUE),FALSE)})
  colNames = sapply(features$V2[fnames],function(x){gsub("[()-]+","_",x)})
  colNames = sapply(colNames,function(x){gsub("BodyBody","Body",x)})
  colNames = sapply(colNames,function(x){ifelse(substr(x,start = nchar(x),stop=nchar(x))=="_",
                                                substr(x,start = 1,stop = nchar(x)-1),x)})
  
  # Extract and merge the actual data values, but only for the features with mean or std. (ignore MeanFreq)
  Xtest = read.table("./UCI HAR Dataset/test/X_test.txt",colClasses = 
                       sapply(features$V2,function(x){ 
                              ifelse(grepl("-std()",x)|grepl("-mean()",x),
                                     ifelse(grepl("-meanFreq()",x),"NULL","numeric"),
                                     "NULL" )}))
  Xtrain = read.table("./UCI HAR Dataset/train/X_train.txt",colClasses = 
                        sapply(features$V2,function(x){ 
                              ifelse(grepl("-std()",x)|grepl("-mean()",x),
                                     ifelse(grepl("-meanFreq()",x),"NULL","numeric"),
                                     "NULL" )}))
  
  # Combine the subject, activity, and data into one table, while labeling the columns
  dataset = cbind(subjects,activity,rbind(Xtrain,Xtest))
  names(dataset) = c("subject","activity",colNames)
  
  write.table(dataset,file = "./tidydata.txt",row.names=FALSE)
  
  datasetSummary = aggregate(dataset[,-c(1,2)],by = list(dataset$subject,dataset$activity),FUN = mean)
  names(datasetSummary) = names(dataset)
  write.table(datasetSummary,file = "./tidydataSummary.txt",row.names=FALSE)
}