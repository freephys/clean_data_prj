# try to load necessary 
if (!require("data.table")) {
  install.packages("data.table")
}

if (!require("reshape2")) {
  install.packages("reshape2")
}

require("data.table")


# Load: activity labels
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")[,2]

# Load: data column names
features <- read.table("./UCI HAR Dataset/features.txt")[,2]

# Extract only the measurements on the mean and standard deviation for each measurement.
extract_features <- grepl("mean|std", features)

select_feature <- function(top_directory,dataType,all_feature=features,selected_feature=extract_features,selected_label=activity_labels){
  # load x and y data
  x <- read.table(file.path(".",top_directory,dataType,paste("X_",dataType,".txt",sep = "")))
  y <- read.table(file.path(".",top_directory,dataType,paste("Y_",dataType,".txt",sep = "")))
  subject <- read.table(file.path(".",top_directory,dataType,paste("subject_",dataType,".txt",sep = "")))
  names(x) <- all_feature
  # extract selected features(std and mean) for each measurement
  x <- x[,selected_feature]
  y[,2] <- selected_label[y[,1]]
  names(y) <- c("Activity_ID", "Activity_Label")
  names(subject) <- "subject"
  # cbind data
  data <- cbind(as.data.table(subject),x,y)
  
}

# Load and process train and test data.
test_data <- select_feature(t="UCI HAR Dataset",d = "test")
train_data <- select_feature(t="UCI HAR Dataset",d = "train")

# Merge test and train data
data = rbindlist(list(test_data, train_data))

id_labels   = c("subject", "Activity_ID", "Activity_Label")
data_labels = setdiff(colnames(data), id_labels)
melt_data      = melt(data, id = id_labels, measure.vars = data_labels)

# Apply mean function to dataset using dcast function
tidy_data   = dcast(melt_data, subject + Activity_Label ~ variable, mean)

write.table(tidy_data, file = "./tidy_data.txt",row.name=FALSE)

