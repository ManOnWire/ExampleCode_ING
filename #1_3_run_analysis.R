# Set Working Directory
setwd(dir)

## THIS APPLIES WHEN THE DATASET MUST BE DOWNLOADED.
## Since the submission form reads " The code should have a file run_analysis.R
## in the main directory that can be run as long as the Samsung data is in your
## working directory." We'll assume that won't be neccesary and that the Dataset.txt
## file is present in the working directory.
#
# If Data directory does not exist; create it.
# if (!file.exists("Data")) {
#         dir.create("Data")
# }
#
# Put URL pointing towards the dataset into a variable.
# url_to_dataset <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
#
# Download the dataset to the Data directory inside the working directory.
# download.file(url_to_dataset, destfile = "./Data/Dataset.zip", method = "curl")

## UNZIPPING THE FILE PROBABLY WONT BE NEEDED EITHER.
# Unzip the downloaded file (and replace it (by default)).
# unzip("./Data/Dataset.zip", exdir = "./Data/")

# Inside the Data directory the UCI HAR Dataset directory has been created.
# Within it there is the test data, aswell as the training data. This data consists
# of files with 561 variables (and a couple of thousand observarions). Also there are
# files with the subjects for each observation (test and training) and the activity label
# for each observation (test and training).
# Subject and activity data should be combined with the actual measurements by means
# of the cbind() command. First the individual files must be loaded into R:
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt", sep = "")
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt", sep = "")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt", sep = "")

# Adding y_test to X_test:
X_test_y <- cbind(y_test, X_test)
# Adding subject_test to that:
X_test_y_subject <- cbind(subject_test, X_test_y)

# Change name of the resulting object:
test_dataset <- X_test_y_subject

# Remove intermediate objects:
rm(subject_test, X_test, y_test, X_test_y, X_test_y_subject)

# Similar for the training data:
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt", sep = "")
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt", sep = "")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt", sep = "")

# Adding y_test to X_test:
X_train_y <- cbind(y_train, X_train)
# Adding subject_test to that:
X_train_y_subject <- cbind(subject_train, X_train_y)

# Change name of the resulting object:
train_dataset <- X_train_y_subject

# Remove intermediate objects:
rm(subject_train, X_train, y_train, X_train_y, X_train_y_subject)

# The colums / variables in the test / train dataset have no names at
# the moment, but they should be named: subject, activity, 561 features (by name).
# The list of features can be found in a file called 'features.txt'.
# Let's import that data to an R object:
features <- read.table("./UCI HAR Dataset/features.txt", sep = "")
# This results in a dataframe, but we want a character vector:
features <- as.character(features$V2)

# Before adding the names to the variables, let's first combine the test and
# train dataset into one:
complete_dataset <- rbind(test_dataset, train_dataset)

# Now add the names to the object:
names(complete_dataset) <- c("subject", "activity", features)

# Replace the values for activity with something meaningful using the information
# in the activity_labels.txt file:
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")
# The activity_labels object was created for reference only — can be removed after the
# replacement is complete.

# Replacement commands:
complete_dataset$activity <- gsub("1", "WALKING", complete_dataset$activity)
complete_dataset$activity <- gsub("2", "WALKING_UPSTAIRS", complete_dataset$activity)
complete_dataset$activity <- gsub("3", "WALKING_DOWNSTAIRS", complete_dataset$activity)
complete_dataset$activity <- gsub("4", "SITTING", complete_dataset$activity)
complete_dataset$activity <- gsub("5", "STANDING", complete_dataset$activity)
complete_dataset$activity <- gsub("6", "LAYING", complete_dataset$activity)

# Remove activity_labels:
rm(activity_labels)

# Remove separate test and train datasets:
rm(test_dataset, train_dataset)

# We only need the mean() and the std() variables, so we have to filter them out of the
# names. Maybe we have to include the additional Mean-vectors aswell?
# In that case we should use:
filtered_dataset <- complete_dataset[,grepl("^subject$|^activity$|-mean\\(\\)|-std\\(\\)|Mean", names(complete_dataset))]
# Watch out! You have to escape the parenthesis!!!
# This reduces the number of variables to 75
# or less than 15% of the original size.

# Clean up; remove complete dataset:
rm(complete_dataset)

# Now we need to create a new dataset containing "the average of
# each variable for each activity and each subject". This means we have to
# use the melt() function (part of the reshape2 package).
install.packages("reshape2")
library(reshape2)
molten_dataset <- melt(filtered_dataset, id = c("subject", "activity"))
# This produces a narrow dataset. With the following command we can
# create (reshape) this dataset into what we want:
means_dataset <- dcast(molten_dataset, subject + activity ~variable, mean)

# Some more clean up; remove filtered and molten datasets:
rm(filtered_dataset, molten_dataset)

# The means_dataset now needs to be exported with the write.table() function:
write.table(means_dataset, file = "./Data/Means_Dataset.txt", row.names = FALSE)

