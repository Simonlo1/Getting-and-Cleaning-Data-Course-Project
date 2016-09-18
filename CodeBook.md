## Description

This code book describes the variables in the final tidy data set and the transformations performed to clean up the data.

## Variables

You can include R code in the document as follows:

- ```Subject``` - The ID of the volunteer
- ```Activity``` - The type of activity performed by the volunteer

## Measurements
- `tBodyAccmeanX`    
- `tBodyAccmeanY`      
- `tBodyAccmeanZ`     
- `tBodyAccstdX`     
- `tBodyAccstdY`       
- `tBodyAccstdZ`       
- `tGravityAccmeanX`  
- `tGravityAccmeanY`   
- `tGravityAccmeanZ`   
- `tGravityAccstdX`   
- `tGravityAccstdY`    
- `tGravityAccstdZ`    
- `tBodyAccJerkmeanX` 
- `tBodyAccJerkmeanY`  
- `tBodyAccJerkmeanZ`  
- `tBodyAccJerkstdX`  
- `tBodyAccJerkstdY`   
- `tBodyAccJerkstdZ`   
- `tBodyGyromeanX`    
- `tBodyGyromeanY`     
- `tBodyGyromeanZ`     
- `tBodyGyrostdX`     
- `tBodyGyrostdY`      
- `tBodyGyrostdZ`      
- `tBodyGyroJerkmeanX`
- `tBodyGyroJerkmeanY` 
- `tBodyGyroJerkmeanZ` 
- `tBodyGyroJerkstdX` 
- `tBodyGyroJerkstdY`  
- `tBodyGyroJerkstdZ`  
- `fBodyAccmeanX`     
- `fBodyAccmeanY`      
- `fBodyAccmeanZ`      
- `fBodyAccstdX`      
- `fBodyAccstdY`       
- `fBodyAccstdZ`       
- `fBodyAccJerkmeanX` 
- `fBodyAccJerkmeanY`  
- `fBodyAccJerkmeanZ`  
- `fBodyAccJerkstdX`  
- `fBodyAccJerkstdY`   
- `fBodyAccJerkstdZ`   
- `fBodyGyromeanX`    
- `fBodyGyromeanY`     
- `fBodyGyromeanZ`     
- `fBodyGyrostdX`     
- `fBodyGyrostdY`      
- `fBodyGyrostdZ`     

## Cleaning Process
My first step was to merge the training and test sets using `rbind` and `cbind`, and then use `gsub` to delete all `-` and `()` in features.txt, and also replace `,` by blank, which then will be the column name of the merged data set. And then I delete several duplicate columns since they have the same column names, extract only the measurements on the mean and standard deviation for each measurement using `grep` command. After that I used `gsub`  to name the activities in the data set. Finally I combined `melt` and `dcast` to calculate the average of each variable for each activity and each subject.
  

