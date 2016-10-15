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
   features<-read.table("C:/UCI HAR Dataset/features.txt"
    features[,2]<-as.character(features[,2])
    #view first few rows of resulting data
    
    head(activity)
    head(features)
    
    #Get the data concerning only mean and standard deviation
    Required<-grep(".*mean.*|.*std.*",features[,2])
   Required_names<-features[Required,2]
 Required_naames=gsub('-mean','Mean',required_names)
 Required_names=gsub('-mean','Mean',required_names)
 Required_names=gsub('-std','Std',required_names)
 Required_names=gsub('[-()]','',required_names)
 
 # Load the Data set on training data
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
 colnames(New_dataset)<-c("subject","activity",Required_names)
 
 # Produce factors for activities and Subjects
  New_dataset$activity<-factor(New_dataset$activity,levels = activity[,1],labels=activity[,2])
                                                                                     
 New_dataset$subject<-as.factor(New_dataset$subject)
 New_dataset_joined<-melt(New_dataset,id=c("subject","activity"))
 New_dataset.mean<-dcast(New_dataset_joined,subject+activity~variable,mean)
 
 #View some few rows of resulting data
 head(New_dataset.mean)
 head(New_dataset$subject)
 write.table(New_dataset.mean,"tidy_dataset.txt",row.names=False,quote=FALSE)
 
 
 
 