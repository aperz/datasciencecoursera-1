Step 1. Concatenate the training and test data sets by combining rows to create the Data set.
	trainData <- read.table("./data/x_train.txt") 		# 7,352 rows and 561 columns
	testData <- read.table("./data/x_test.txt") 		# 2,947 rows and 561 columns
	Data <- rbind(trainData,testData) 			# 10,299 rows and 561 columns

Step 2. Concatenate the training and test activities by combining rows to create the Activity vector.
	trainActivity <- read.table("./data/y_train.txt") 	# 7,352 rows and 1 column
	testActivity<- read.table("./data/y_test.txt") 	# 2,947 rows and 1 column
	Activity <- rbind(trainActivity,testActivity)	 	# 10,299 rows and 1 column

Step 3. Concatenate the training and test subjects by combining rows to create the Subject vector.
	trainSubject <- read.table("./data/subject_train.txt") # 7,352 rows and 1 column
	testSubject <- read.table("./data/subject_test.txt") 	# 2,947 rows and 1 column
	Subject<- rbind(trainSubject,testSubject)	 	# 10,299 rows and 1 column

Step 4. Assign variable names to columns of Data using the features vector. 
	features <-  read.table("./data/features.txt")	# 561 rows and 2 columns
	names(Data) <- features[, 2]				# 561 rows and 1 column 

NOTE: The Data set has 39 columns named “BodyBody” that duplicate columns with “Body” prefixes.

Step 5. Subset the first tidyData set by combining 522 columns without “BodyBody” in their names.	
	> grep("BodyBody()", features[, 2])			#  39 columns
 	[1] 516 517 518 519 520 521 522 523 524 525 526 527 528 529 530 531 532 533 534 535 536 	537 538 539 540 541 542 543 544 545 546 547 [33] 548 549 550 551 552 553 554
	> tidyData <- Data[c(1:515,555:561)] 			# 10,299 rows and 522 columns

Step 6.  Index columns of tidyData to extract means and standard deviations for each measurement.
	Mean <- tidyData[, grep("mean()", features[, 2])] 	# 10,299 rows and 40 columns
	SD <- tidyData[, grep("std()", features[, 2])] 		# 10,299 rows and 30 columns

Step 7. Subset tidyMean set by excluding 10 columns with mean frequency (meanFreq) in their names. 
	> grep("meanFreq()", features[, 2])			#  10 rows
	[1] 294 295 296 373 374 375 452 453 454 513 

	tidyMean <- Mean[c(1:293,297:372,376:451,455:512,514:515,555:561),features[, 2]] 
							 # 10,299 rows and 30 columns

Step 8. Assign value labels to activities using the activity_labels vector.
	 activity_labels <-  read.table("./data/activity_labels.txt")	# 6 rows and 2 columns	
	Activity$v1 <- factor(Activtiy$v1, levels=c(1,2,3,4,5,6), labels=activity_labels))

Step 10. Index rows and columns of tidyData to extract means and standard deviations by Subject and Activity for the measurement variables. Calculate averages for each variable by subject and activity.
For i in 1:30 {
	For j in 1:6 {
		For k in 1:30 {
	averageMean[i,j,k] <- mean(tidyData[grep(Subject[i], Activity[j]), grep("mean()", tidyFeature[, 2])] ;	
	averageSD[i,j,k] <-mean (tidyData[grep(Subject[i], Activity[j]), grep("mean()", tidyFeature[, 2])]
			}
		}		
	}	

Step 11. Merge average measurements by combining columns to create the second tidyData2 set.
	tidyData2 <- cbind(averageMean, averageData) 		# 10,299 rows and 60 columns

