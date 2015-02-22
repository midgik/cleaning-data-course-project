# Getting Cleaning Data Course Project

## Task

Create one R script called `run_analysis.R` that does the following:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive activity names.
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Implementation

This repository consists of:

- `run_analysis.R` - the script itself
- `CodeBook.md` - code book for the project
- `README.md` - this file
- `tidy.txt` - the resulted tidy dataset

To run the script you will need:

- `UCI HAR Dataset` directory with the original data in the working directory
- the `reshape2` package


### Data cleaning steps

- Read files and appropriately label the data set
- Merge the training and test sets to create one data set
- Read train and test activity lables, merge them into one data set and replace numbers with proper activity names i.e. `1` becomes `WALKING`, etc.
- Read and merge subjects into one data set
- Extract only the measurements on the mean and standart deviation for each measurement and clean variable names
- Use descriptive activity names to name the activities in the data set and convert them to factors
- Create a tidy data set with the average of each variable for each activity and each subject and write it to a text file
