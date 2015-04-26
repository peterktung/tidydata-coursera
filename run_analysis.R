library(reshape2)

#get and clean feature names and some characters are replaced with a period when used as a column name
features <- read.table("features.txt", col.names=c("id","feature"))
features$feature <- gsub("\\(\\)","Func", features$feature)
features$feature <- gsub("\\(|\\)|,|-","", features$feature)

#create function to reduce global variables
readmerge <- function() {
  activities <-read.table("activity_labels.txt", col.names=c("id", "activity"))
  
  #read & label the columns for test data
  xtest <- read.table("test/X_test.txt", col.names=features$feature)
  ytest <- read.table("test/y_test.txt", col.names=c("activity_id"))
  subjecttest <- read.table("test/subject_test.txt", col.names=c("subject_id"))
  
  #read & label the columns for train data
  xtrain <- read.table("train/X_train.txt", col.names=features$feature)
  ytrain <- read.table("train/y_train.txt", col.names=c("activity_id"))
  subjecttrain <- read.table("train/subject_train.txt", col.names=c("subject_id"))
  
  #append test & train data
  xall <- rbind(xtest, xtrain)
  yall <- rbind(ytest, ytrain)
  subjectall <-rbind(subjecttest, subjecttrain)
  
  #join tables
  cbind(subjectall, merge(yall, activities, by.x="activity_id", by.y="id"), xall)
}

alldata <- readmerge()

#extract mean and std features only
meanstd = features[grep("meanFunc|stdFunc", features$feature),]$feature

#filter columns
filterdata <- alldata[,c(c("subject_id", "activity"), as.vector(meanstd))]

#mean data per subject, per activity
filterMelt <- melt(filterdata, id=c("subject_id", "activity"), measure.vars = as.vector(meanstd))
subActData <- dcast(filterMelt, subject_id + activity ~ variable, mean)

#write result to a txt file
write.table(subActData, "subjectActivtyMean.txt", row.names = F)
