## Final Project ##

# 0.Load the data sets
subtrain<-read.table("./UCI HAR Dataset/train/subject_train.txt")
subtest<-read.table("./UCI HAR Dataset/test/subject_test.txt")
features<-read.table("./UCI HAR Dataset/features.txt")
xtrain<-read.table("./UCI HAR Dataset/train/X_train.txt")
xtest<-read.table("./UCI HAR Dataset/test/X_test.txt")
ytrain<-read.table("./UCI HAR Dataset/train/y_train.txt")
ytest<-read.table("./UCI HAR Dataset/test/y_test.txt")


# 1.Merges the training and the test sets to create one data set
x<-rbind(xtrain,xtest)
y<-rbind(ytrain,ytest)
sub<-rbind(subtest,subtrain)
mergedData<-cbind(sub,y,x)
head(names(mergedData))
name<-gsub("-","",features$V2)
name<-gsub("\\()","",name)
name<-gsub(",","",name)
names(mergedData)<-c('Subject','Activity',as.character(name))


# 2.Extracts only the measurements on the mean and standard deviation for 
# each measurement
library(dplyr)
# Remove the column with duplicate names
selectData<-mergedData[,!duplicated(colnames(mergedData))]
selectData<-select(selectData,c(1,2,grep("(mean|std)[^F]",names(selectData))))
names(selectData)


# 3.Uses descriptive activity names to name the activities in the data set
selectData$Activity<-gsub("1","WALKING",selectData$Activity)
selectData$Activity<-gsub("2","WALKING_UPSTAIRS",selectData$Activity)
selectData$Activity<-gsub("3","WALKING_DOWNSTAIRS",selectData$Activity)
selectData$Activity<-gsub("4","SITTING",selectData$Activity)
selectData$Activity<-gsub("5","STANDING",selectData$Activity)
selectData$Activity<-gsub("6","LAYING",selectData$Activity)


# 4.Appropriately labels the data set with descriptive variable names
# (I have done this in the second step)


# 5.From the data set in step 4, creates a second, independent tidy data
# set with the average of each variable for each activity and each subject
dat<-melt(selectData,id=c("Subject","Activity"))
tidydat <- dcast(dat, Subject + Activity ~ variable, mean)
write.table(tidydat, "tidy.txt", row.names = FALSE, quote = FALSE)








