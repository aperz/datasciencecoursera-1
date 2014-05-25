Step 1. Concatenate the training and test data sets by combining rows to create the Data set.

Step 2. Concatenate the training and test activities by combining rows to create the Activity vector.

Step 3. Concatenate the training and test subjects by combining rows to create the Subject vector.

Step 4. Assign variable names to columns of Data using the features vector. 

NOTE: The Data set has 39 columns named “BodyBody” that duplicate columns with “Body” prefixes.

Step 5. Subset the first tidyData set by combining 522 columns without “BodyBody” in their names.	

Step 6.  Index columns of tidyData to extract means and standard deviations for each measurement.

Step 7. Subset tidyMean set by excluding 10 columns with mean frequency (meanFreq) in their names. 

Step 8. Assign value labels to activities using the activity_labels vector.

Step 11. Merge average measurements by combining columns to create the second tidyData2 set.

