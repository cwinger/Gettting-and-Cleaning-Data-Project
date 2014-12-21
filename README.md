### Analysis for Human Activity Recognition Using Smartphones

This repository contains the code necessary for analyzing the data for the Human Activity Recognition Using Smartphones Dataset. A description of the data can be found here:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

## Contents

Repository includes the following:
 - README.md
 - CodeBook.md 
 - run_analysis.r
 - tidydata.txt
 - tidydataSummary.txt


To read the tidydata.txt or tidydataSummary.txt file into R, use the command read.table("tidydata.txt",header=TRUE) or read.table("tidydataSummary.txt",header=TRUE)

The CodeBook.md file contains descriptions of the variables present in tidydata.txt, as well as how they were transformed from the original files.

run_analysis.r contains the code used to create tidydata.txt and tidydataSummary.txt.  In order to run the code, you will need the extracted “UCI HAR Dataset” folder in your working directory.  After sourcing and running run_analysis.r, it will output tidydata.txt and tidydataSummary.txt into your working directory.  The contents will match the contents of the respective files located in the repository.  





