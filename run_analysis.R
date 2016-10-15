 library(reshape2)
 filename<-"UCI_dataset.zip"
 
  # Download and extract the dataset from the Zip file
  if(!file.exists(filename)){
  + UCI_URL<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  + library(bitops)
  + library(RCurl)
  + download.file(UCI_URL,filename,method = "libcurl")}
  
  #Get the ativities
  activity<-read.table("C:/UCI HAR Dataset/activity_labels.txt")
   activity[,2]<-as.character(activity[,2])
   
   #Get the features from the dataset
   feature_data<-read.table("C:/UCI HAR Dataset/features.txt"
    feature_data[,2]<-as.character(feature_data[,2])
    #view first few rows of resulting data
    
    head(activity)
    head(features)
    
    #Get the data concerning only mean and standard deviation
    Required<-grep(".*mean.*|.*std.*",features[,2])
   Required_data<-feature_data[Required,2]
 Required_data=gsub('-mean','Mean',required_data)
 Required_data=gsub('-std','Std',required_data)
 Required_data=gsub('[-()]','',required_data)
 
 # Load the Data set on training data
train_data <- read.table("UCI HAR Dataset/train/X_train.txt")[Required]                         
train_Activities<-read.table("C:/UCI HAR Dataset/train/Y_train.txt")
train_Subjects<-read.table("C:/UCI HAR Dataset/train/subject_train.txt")
 train<-cbind(train_Subjects,train_Activities,train_data)
 #Load the Data set on test Data
 test_data<-read.table("C:/UCI HAR Dataset/test/X_test.txt")[Required]
 test_Activities<-read.table("C:/UCI HAR Dataset/test/Y_test.txt")
 test_Subjects<-read.table("C:/UCI HAR Dataset/test/subject_test.txt")
 test<-cbind(test_Subjects,test_Activities,test_data)
 
 #Merge the datasets
 New_dataset<-rbind(train,test)
 colnames(New_dataset)<-c("subject","activity",Required_data)
 
 # Produce factors for activities and Subjects
  New_dataset$activity<-factor(New_dataset$activity,levels = activity[,1],labels=activity[,2])
                                                                                     
 New_dataset$subject<-as.factor(New_dataset$subject)
 New_dataset_joined<-melt(New_dataset,id=c("subject","activity"))
 New_dataset.mean<-dcast(New_dataset_joined,subject+activity~variable,mean)
 
 #View some few rows of resulting data
 head(New_dataset.mean)
 head(New_dataset$subject)
 write.table(New_dataset.mean,"tidy_dataset.txt",row.names=False,quote=FALSE)
 
 
 
 
