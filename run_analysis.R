# run_analysis.R
# for Coursera - JHU / Getting and Cleaning Data
# instructor - Jeff Leek, PhD
# Please see codebook.md / Readme.md in Github repository for more information

# Prep:   Load files / Libraries

if (!require("plyr")) {
    install.packages("plyr")
}
require("plyr")

# Read raw data from files
features = read.table('./UCI HAR Dataset/features.txt',header=FALSE)[,2]
activity_labels = read.table('./UCI HAR Dataset/activity_labels.txt',header=FALSE)[,2]

X_train = read.table('./UCI HAR Dataset/train/X_train.txt',header=FALSE)
y_train = read.table('./UCI HAR Dataset/train/y_train.txt',header=FALSE)
subject_train = read.table('./UCI HAR Dataset/train/subject_train.txt',header=FALSE)

X_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")

# merge data into 3 logical subsets
x_data <- rbind(X_train, X_test)
y_data <- rbind(y_train, y_test)
subject_data <- rbind(subject_train, subject_test)

# extract mean / std from features
extract_features <- grep("-(mean|std)\\(\\)", features)
x_data <- x_data[, extract_features]

# adjusting and cleaning names 
y_data[,1] <- activity_labels[y_data[,1]]
names(y_data) <- "activity"
names(subject_data) <- "subject"
names(x_data) <- features[extract_features]

#bind all into final dataset
all_data <- cbind(x_data, y_data, subject_data)
all_data <- all_data[c(68, 67, 1:66)]

# new data set based avgs of columns, grouped by subject/activity
tidy_data <- ddply(all_data, .(subject, activity), function(x) colMeans(x[, 3:68]))

# more adjusting and cleaning names
names(tidy_data) <- gsub('-mean', 'Mean', names(tidy_data))
names(tidy_data) <- gsub('-std', 'Std', names(tidy_data))
names(tidy_data)<- gsub('[()-]', '', names(tidy_data))
names(tidy_data) <- gsub('BodyBody', 'Body', names(tidy_data))

# export final tidy data
write.table(tidy_data, "tidy_data.txt", row.name=FALSE)
