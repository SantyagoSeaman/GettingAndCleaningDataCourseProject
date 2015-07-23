library("dplyr")
library("stats")

# Load references
features <- read.table("./features.txt", stringsAsFactors = F)
feature_names <- features[,2]

# Rename features to more understandable view
feature_names <- gsub("\\()", "", feature_names)
feature_names <- gsub("\\)", "", feature_names)
feature_names <- gsub("\\(", ".", feature_names)
feature_names <- gsub("-|,", "_", feature_names)
feature_names <- gsub("^t", "Time", feature_names)
feature_names <- gsub("[.]t", ".Time", feature_names)
feature_names <- gsub("^f", "Frequency", feature_names)
feature_names <- gsub("Acc", "Accelerometer", feature_names)
feature_names <- gsub("Gyro", "Gyroscope", feature_names)
feature_names <- gsub("Mag", "Magnitude", feature_names)
feature_names <- gsub("BodyBody", "Body", feature_names)

activity_labels <- read.table("./activity_labels.txt", col.names=c("activity_id", "activity_name"))

# Load and merge TEST data
test_data <- read.table("./test/X_test.txt", col.names = feature_names)
test_subject_id <- read.table("./test/subject_test.txt", col.names = c("subject"))
test_activity_id <- read.table("./test/y_test.txt", col.names = c("activity"))
merged_test_data <- cbind(test_subject_id , test_activity_id , test_data)

# Load and merge TRAIN data
train_data <- read.table("./train/X_train.txt", col.names = feature_names)
train_subject_id <- read.table("./train/subject_train.txt", col.names = c("subject"))
train_activity_id <- read.table("./train/y_train.txt", col.names = c("activity"))
merged_train_data <- cbind(train_subject_id , train_activity_id , train_data)

# Merge two datasets
all_data <- rbind(merged_train_data, merged_test_data)

# Clean unused data
remove(test_data, test_subject_id, test_activity_id, merged_test_data,
       train_data, train_subject_id, train_activity_id, merged_train_data)

# Get column names list which includes only required
mean_col_idx <- grep("_mean(_|$)", names(all_data), ignore.case=TRUE)
mean_col_names <- names(all_data)[mean_col_idx]

std_col_idx <- grep("_std(_|$)", names(all_data), ignore.case=TRUE)
std_col_names <- names(all_data)[std_col_idx]

# Get only required columns and create dataset with tidy data
tidy_data <- all_data[, c("subject", "activity", mean_col_names, std_col_names)]

# Cast Activity column to factor
tidy_data$activity <- factor(tidy_data[, "activity"],
                             levels = activity_labels[, "activity_id"],
                             labels = activity_labels[, "activity_name"])

# Clean unused data
remove(all_data)

# Create dataset with the average of each variable for each activity and each subject
mean_data <- summarise_each(group_by(tidy_data, subject, activity), funs(mean))

# Write mean_tidy_data_set.txt
write.table(mean_data, "./mean_tidy_data_set.txt", row.name=FALSE)
