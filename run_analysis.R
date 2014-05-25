# Step 1a. Concatenate the training and test data sets by combining rows to create the Data set.
trainData <- read.table("./data/x_train.txt")
testData <- read.table("./data/x_test.txt")
Data <- rbind(trainData, testData)

# Step 1b. Concatenate the training and test activities by combining rows to create the Activity vector.
trainActivity <- read.table("./data/y_train.txt")
testActivity <- read.table("./data/y_test.txt")
Activity <-  rbind(trainActivity, testActivity)

# Step 1c. Concatenate the training and test subjects by combining rows to create the Subject vector.
trainSubject <- read.table("./data/subject_train.txt")
testSubject <- read.table("./data/subject_test.txt")
Subject <-  rbind(trainSubject, testSubject)

# Step 2. Assign variable names to columns of Data using the features vector. 
features <- read.table("./data/features.txt")
names(Data) <- features[, 2]   

# Step 3a. Subset the first tidyData set by combining columns without “BodyBody” in their names.

grep("BodyBody()", features[,2])
tidyData <- Data[c(1:515,555:561)]

# Step 3b. Assign variable names to columns of tidyData using the tidyfeatures vector.

tidyfeatures <- features[c(1:515,555:561),]
names(tidyData) <- tidyfeatures[, 2] 

# Step 4a.  Index columns of tidyData to subset mean columns for each measurement.
meanIndex <- grep("mean()", tidyfeatures[,2])
meanFreqIndex <- grep("meanFreq()", tidyfeatures[,2])
Mean <- tidyData[, c(1:3,41:43,81:83,121:123,161:163,201,214,227,240,253,266:268,345:347,424:426,503)]

# Step 4b.  Index columns of tidyData to subset standard deviation (std) columns for each measurement
stdIndex <- grep("std()", tidyfeatures[,2])
SD <- tidyData[,stdIndex]

# Step 4c. Merge descriptive statistics with subjects and activities by combining Mean and SD subsets.
Mean_SD <- cbind(Mean,SD)
Subject_Activity <- read.table("./data/subject_activity.txt")
Subject_Label <- Subject_Activity[cbind(2:10300),3]
tidy <- cbind(Subject_Label,Mean_SD)

library(reshape2)

> B <- melt(tidy)

Step 5. Calculate averages for each variable by subject and activity.
tidyData <- dcast(B, Subject_Label ~ variable, fun.aggregate=mean) 
write.table(tidyData, "./data/tidyData.txt")
