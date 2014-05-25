Step 1. Concatenate the training and test data sets by combining rows to create the Data set.

Step 2. Concatenate the training and test activities by combining rows to create the Activity vector.

Step 3. Concatenate the training and test subjects by combining rows to create the Subject vector.

Step 4. Assign variable names to columns of Data using the features vector. 

NOTE: Data has 39 columns with “BodyBody” names that duplicate columns with “Body."

Step 5. Subset the Data set by combining 522 = 561 - 39 columns without “BodyBody” in their names.	

Step 6. Index 60 columns of tidy Data to extract mean and standard deviation (std) for each of 30 measurements.

NOTE: Subset has 30 mean (and 30 std) columns excluding 10 columns with mean frequency (meanFreq) names. 

Step 8. Assign value labels to activities using the activity_labels vector.

Step 11. Calculate average measurements by melting and casting columns to create the tidyData set.

