# GetData-Course-Project
# ======================

library(data.table)

#### getting the data
#### ----------------

# if not yet done: download and unzip the data file

url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
downdir <- "downloaded_data/"
zipFile <- paste0(downdir,"UCI HAR Dataset.zip")
datadir <- paste0(downdir, "UCI HAR Dataset/")

if ( !file.exists(zipFile)  ) {
    download.file(url,zipFile,method="curl")
    unzip(zipFile, exdir=downdir, setTimes=TRUE)
}
print(paste(zipFile, "was downloaded on:", file.info(zipFile)$mtime))

#### prepare for X_data column extracting and labeling
#### -------------------------------------------------

# read the features.txt file into a data.table
FEATURES <- as.data.table(read.table(
                paste0(datadir, "features.txt"),
                sep=" ",
                col.names=c("Feature","Label"),
                stringsAsFactors=FALSE
           ))
# class column used in read-colClasses: set all to NULL
FEATURES <- FEATURES[, colClass:="NULL"]
# use regex to set features ending by "mean()" or "std()" to class="numeric"
FEATURES <- FEATURES[grepl("(mean|std)\\()-[XYZ]$", Label), colClass:="numeric"]

# make sure the labels are valid col.names
# remove the parens in Label, as they give invalid col.names
FEATURES <- FEATURES[colClass=="numeric", Label:=sub("\\()", "", Label)]
# change the dashes - to dots .
FEATURES <- FEATURES[colClass=="numeric", Label:=gsub("\\-", ".", Label)]


ACTIVITIES <- as.data.table(read.table(
  paste0(datadir, "activity_labels.txt"),
  sep=" ",
  col.names=c("Act","Activity"),
  stringsAsFactors=FALSE
))
setkey(ACTIVITIES, Act)



#### define function read_data(type)
#### -------------------------------

read_data <- function(type){
    # directory for data files
    type_dir <- paste0(datadir, type)
    if ( !file.exists(type_dir)) {
        msg <- paste("the", type_dir, "directory does not exist !!")
        stop(msg)
    }
    # define filenames
    fileX <- paste0(type_dir, "/X_", type, ".txt")
    fileY <- paste0(type_dir, "/y_", type, ".txt")
    fileS <- paste0(type_dir, "/subject_", type, ".txt")
    # read the files, put them into DT
    DT <- as.data.table(read.table(
      fileX,
      colClasses = as.vector(FEATURES[ ,colClass]), # only wanted cols, others are NULL
      col.names = as.vector(FEATURES[ ,Label])      # feature labes as col names
    ))
    Y <- as.data.table(read.table(fileY, col.names=c("Act")))
    setkey(Y, Act)
    Y <- Y[ACTIVITIES]  # joins in the labels as col "Activity"
    S <- as.data.table(read.table(fileS, col.names=c("Subject")))
    # put the columns from Y and S into DT
    DT <- DT[ ,`:=`(Activity=Y[ ,Activity], Subject=S[ ,Subject])]
    # return DT
    return(DT)
}

#### read and merge the test and train datasets
#### ------------------------------------------

TEST <- read_data("test")
TRAIN <- read_data("train")
DATA <- rbindlist(list(TEST,TRAIN))
#rm(TEST, TRAIN, features)  # free memory

colOrder <- c("Activity", "Subject", as.vector(FEATURES[colClass=="numeric", Label]))
setcolorder(DATA, colOrder)
setkeyv(DATA, c("Activity", "Subject"))

#### calculate the averages and write the file to be submitted
#### ---------------------------------------------------------




