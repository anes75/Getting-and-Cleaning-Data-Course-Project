# set working directory in the current file's place
setwd(dirname(rstudioapi::getSourceEditorContext()$path))

# read features and activity labels data
features <- read.table('data/features.txt')
activities <- read.table('data/activity_labels.txt')

# read X data from train and test directories
X_train <- read.table('data/train/X_train.txt')
X_test <- read.table('data/test/X_test.txt')
# and join them
X_joined <- rbind(X_train, X_test)
# give names from features data
colnames(X_joined) <- features[,2]

# read y data from train and test directories
y_train <- read.table('data/train/y_train.txt')
y_test <- read.table('data/test/y_test.txt')
# and join them
y_joined <- rbind(y_train, y_test)
# merge with activities labels
y_joined <- merge(y_joined,activities)
# convert to data frame
y_joined <- as.data.frame(y_joined[,2])
# name column
colnames(y_joined) <- 'Activity'

# read subject data from train and test directories
subject_train <- read.table('data/train/subject_train.txt')
subject_test <- read.table('data/test/subject_test.txt')
# join them
subject_joined <- rbind(subject_train, subject_test)
# name column
colnames(subject_joined) <- 'SubjectID'

# join X, y and subject data
all_joined <- cbind(X_joined,y_joined,subject_joined)
# create a logic vector indicating what columns has 'mean', 'std' in their names
mean_and_std_columns <- (grepl('mean',colnames(all_joined)) 
| grepl('std',colnames(all_joined))
| grepl('Activity',colnames(all_joined))
| grepl('SubjectID',colnames(all_joined))
)
# extract data from columns with 'mean', 'std'... data
mean_and_std_data <- all_joined[,mean_and_std_columns]
attach(mean_and_std_data)
# aggregate data on subject and activity
dataSet2 <- aggregate(. ~SubjectID + Activity, mean_and_std_data, FUN = mean)
detach(mean_and_std_data)
# save file
write.table(dataSet2, "result/dataSet2.txt", row.name=FALSE)
