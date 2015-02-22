# Read files and appropriately label the data set
features <- read.table("./UCI HAR Dataset/features.txt", stringsAsFactors = FALSE)
train_set <- read.table("./UCI HAR Dataset/train/X_train.txt", col.names = features$V2)
test_set <- read.table("./UCI HAR Dataset/test/X_test.txt", col.names = features$V2)

# Merge the training and test sets to create one data set
set <- rbind(train_set, test_set)

# Read train and test activity lables, merge them into one data set
# and replace numbers with proper activity names i.e. `1` becomes `WALKING`, etc.
train_labels <- read.table("./UCI HAR Dataset/train/y_train.txt", col.names = c("label"))
test_labels <- read.table("./UCI HAR Dataset/test/y_test.txt", col.names = c("label"))

labels <- rbind(train_labels, test_labels)
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt", stringsAsFactors = FALSE)

for (i in 1:nrow(labels)) {
  labels$label[i] <- activity_labels[labels$label[i],"V2"]
}

# Read and merge subjects into one data set
train_subj <- read.table("./UCI HAR Dataset/train/subject_train.txt", col.names = c("subject"))
test_subj <- read.table("./UCI HAR Dataset/test/subject_test.txt", col.names = c("subject"))
subjects <- rbind(train_subj, test_subj)

# Extract only the measurements on the mean and standart deviation
# for each measurement and clean variable names
mean_std_set <- set[,grepl("mean\\(\\)|std\\(\\)", features$V2)]
names(mean_std_set) <- gsub( "\\.", "", tolower(names(mean_std_set)))

# Use descriptive activity names to name the activities in the data set
# and convert them to factors
mean_std_lbl_sbj_set <- cbind(mean_std_set, labels, subjects)
mean_std_lbl_sbj_set$label <- as.factor(mean_std_lbl_sbj_set$label)
mean_std_lbl_sbj_set$subject <- as.factor(mean_std_lbl_sbj_set$subject)

# Create a tidy data set with the average of each variable
# for each activity and each subject and write it to a text file
tidy <- recast(mean_std_lbl_sbj_set, subject + label ~ variable, mean)
write.table(tidy, "tidy.txt", row.names = FALSE)
