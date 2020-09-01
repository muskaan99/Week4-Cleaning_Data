library(dplyr)

#features and activity label
feat<- read.table("features.txt")
colnames(feat)<- c("no.","features")
activ<- read.table("activity_labels.txt")
colnames(activ)<- c("label","activity")

#reading test data
subject_test <- read.table("test/subject_test.txt", col.names = "subject")
X_test <- read.table("test/X_test.txt", col.names = feat$features)
y_test <- read.table("test/y_test.txt", col.names = "label")

#reading train data
subject_train <- read.table("train/subject_train.txt", col.names = "subject")
X_train <- read.table("train/X_train.txt",col.names = feat$features)
y_train <- read.table("train/y_train.txt", col.names = "label")

#combined data
tidy_x<-rbind(X_train,X_test)
tidy_y<-rbind(y_train,y_test)
tidy_sub<-rbind(subject_train,subject_test)
tidy_total<-cbind(tidy_x,tidy_y,tidy_sub)

meanstd <-  select(tidy_total,subject, label, contains("mean"), contains("std"))
meanstd$code <- activ[meanstd$label, 2]

names(meanstd)[2] = "activity"
names(meanstd)<-gsub("-mean()", "Mean", names(meanstd), ignore.case = TRUE)
names(meanstd)<-gsub("-std()", "STD", names(meanstd), ignore.case = TRUE)
names(meanstd)<-gsub("-freq()", "Frequency", names(meanstd), ignore.case = TRUE)

dat2 <- meanstd %>%
group_by(subject, activity) %>%
summarise_all(funs(mean))

write.table(dat2, "data2.txt", row.name=FALSE)
