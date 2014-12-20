# Code Book for UciHarAvg Dataset
Ronald Stalder  
19-12-2014  

### Synopsis

The dataset *Human Activity Recognition Using Smartphones* published [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones#) contains data from the embedded accelerometer and gyroscope, gathered by an experiment where 30 subjects performed 6 different activities each.

From this dataset, from both the *test* and *training* data, extract the features containing the mean and the standard deviation (std) for each type of mesurement and space orientation (X, Y, Z) and calculate the average of each feature grouped by activity and subject.

The resulting dataset *UciHarAvg.txt* contains a matrix in **wide format**, storing the average for each feature in a column, labeled by the name of the feature, and the rows being the group of activity and subject.

&nbsp;  

### Input

The **UCI HAR Dataset** (obtain it from [here](http://archive.ics.uci.edu/ml/machine-learning-databases/00240/)) contains the following files (ignoring the "Inertial Signals" subdirectories):


```
##  [1] "UCI HAR Dataset/activity_labels.txt"    
##  [2] "UCI HAR Dataset/features.txt"           
##  [3] "UCI HAR Dataset/features_info.txt"      
##  [4] "UCI HAR Dataset/README.txt"             
##  [5] "UCI HAR Dataset/test/"                  
##  [6] "UCI HAR Dataset/test/subject_test.txt"  
##  [7] "UCI HAR Dataset/test/X_test.txt"        
##  [8] "UCI HAR Dataset/test/y_test.txt"        
##  [9] "UCI HAR Dataset/train/"                 
## [10] "UCI HAR Dataset/train/subject_train.txt"
## [11] "UCI HAR Dataset/train/X_train.txt"      
## [12] "UCI HAR Dataset/train/y_train.txt"
```
&nbsp;  

- the **test** and **train** subdirectories contain the data separated as a *test dataset* and a *training dataset* optained by separating randomly 30%/70% of the subjects of the experiment.   

- the **subject_... .txt** files contain, for each mesurment (row), the *subject* as an anonimyzed integer value  

- the **y_... .txt** files contain, for each mesurment (row), the *activity code* as an integer value  

- the **X_... .txt** files contain a matrix of mesurments (rows) with a feature vector as columns. Each feature (column) contains a single numeric value, the dataset therfore is in **tidy wide form**.  

- the file **activity_labels.txt** contains a matrix of two columns: the activity code and it's label.  

- the file **features.txt** contains a matrix of two columns: the column number under which the feature's values are stored in the X_ files and it's label, naming the feature. A description of the features is available in **features_info.txt**.  

- nothing is said about the **units** of the mesurements. There are accelerations and angular velocities, but no information about the units in which they were measured.

- all of these files can be read in easily; rows are separated by newlines `x'0A'`, columns by spaces. There are no comment lines and no N/A values. Numeric values follow the `C locale` convention (decimal points are points).

&nbsp;  

##### Feature Description from "features_info.txt"

>    Feature Selection   
>    ===========  
>&nbsp;  
>    The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz.   
>&nbsp;  
>    Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag).   
>&nbsp;  
>    Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals).   
>&nbsp;  
>    These signals were used to estimate variables of the feature vector for each pattern:    
>    '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.  
>&nbsp;  
>    tBodyAcc-XYZ  
>    tGravityAcc-XYZ  
>    tBodyAccJerk-XYZ  
>    tBodyGyro-XYZ  
>    tBodyGyroJerk-XYZ  
>    tBodyAccMag  
>    tGravityAccMag  
>    tBodyAccJerkMag  
>    tBodyGyroMag  
>    tBodyGyroJerkMag  
>    fBodyAcc-XYZ  
>    fBodyAccJerk-XYZ  
>    fBodyGyro-XYZ  
>    fBodyAccMag  
>    fBodyAccJerkMag  
>    fBodyGyroMag  
>    fBodyGyroJerkMag  
>&nbsp;  
>    The set of variables that were estimated from these signals are:   
>&nbsp;  
>    mean(): Mean value  
>    std(): Standard deviation  
>    mad(): Median absolute deviation   
>    max(): Largest value in array  
>    min(): Smallest value in array  
>    sma(): Signal magnitude area  
>    energy(): Energy measure. Sum of the squares divided by the number of values.   
>    iqr(): Interquartile range   
>    entropy(): Signal entropy  
>    arCoeff(): Autorregresion coefficients with Burg order equal to 4  
>    correlation(): correlation coefficient between two signals  
>    maxInds(): index of the frequency component with largest magnitude  
>    meanFreq(): Weighted average of the frequency components to obtain a mean frequency  
>    skewness(): skewness of the frequency domain signal   
>    kurtosis(): kurtosis of the frequency domain signal   
>    bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.  
>    angle(): Angle between to vectors.  
>&nbsp;  
>    Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:  
>&nbsp;  
>    gravityMean  
>    tBodyAccMean  
>    tBodyAccJerkMean  
>    tBodyGyroMean  
>    tBodyGyroJerkMean  
>&nbsp;  
>    The complete list of variables of each feature vector is available in 'features.txt'  


&nbsp;  

### Output

- the dataset **UciHarAvg.txt** contains a matrix: rows are separated by newlines `x'0A'`, columns by spaces. There are no comment lines and no N/A values. Numeric values follow the `C locale` convention (decimal points are points). The first line contains the column headers.  
&nbsp;  
- the dataset is in **tiny data wide format**. Features are stored in columns and only contain data about a single informational unit. Rows contain exactly one value per column.  
&nbsp;  
- the dataset contains the average of the **mean()** and **std()** variables estimated from the following signals ('-XYZ' is used to denote 3-axial signals in the X, Y and Z directions):  
&nbsp;  
<table>
<tbody>
  <tr>
   <td style="text-align:left;"> tBodyAcc-XYZ </td>
  </tr>
  <tr>
   <td style="text-align:left;"> tGravityAcc-XYZ </td>
  </tr>
  <tr>
   <td style="text-align:left;"> tBodyAccJerk-XYZ </td>
  </tr>
  <tr>
   <td style="text-align:left;"> tBodyGyro-XYZ </td>
  </tr>
  <tr>
   <td style="text-align:left;"> tBodyGyroJerk-XYZ </td>
  </tr>
  <tr>
   <td style="text-align:left;"> fBodyAcc-XYZ </td>
  </tr>
  <tr>
   <td style="text-align:left;"> fBodyAccJerk-XYZ </td>
  </tr>
  <tr>
   <td style="text-align:left;"> fBodyGyro-XYZ </td>
  </tr>
</tbody>
</table>

&nbsp;  
- listing of **all the columns in the dataset:**  
&nbsp;  

|Header               |Class   |Observation                                         |
|:--------------------|:-------|:---------------------------------------------------|
|Activity             |string  |Activiy label, matched from Activity Code           |
|Subject              |int     |id of participating subject                         |
|tBodyAcc.mean.X      |numeric |( all these columns contain the average mean()      |
|tBodyAcc.mean.Y      |numeric |  of the corresponding variable from the input data |
|tBodyAcc.mean.Z      |numeric |  for the given Activity and Subject )              |
|tBodyAcc.std.X       |numeric |                                                    |
|tBodyAcc.std.Y       |numeric |                                                    |
|tBodyAcc.std.Z       |numeric |                                                    |
|tGravityAcc.mean.X   |numeric |                                                    |
|tGravityAcc.mean.Y   |numeric |                                                    |
|tGravityAcc.mean.Z   |numeric |                                                    |
|tGravityAcc.std.X    |numeric |                                                    |
|tGravityAcc.std.Y    |numeric |                                                    |
|tGravityAcc.std.Z    |numeric |                                                    |
|tBodyAccJerk.mean.X  |numeric |                                                    |
|tBodyAccJerk.mean.Y  |numeric |                                                    |
|tBodyAccJerk.mean.Z  |numeric |                                                    |
|tBodyAccJerk.std.X   |numeric |                                                    |
|tBodyAccJerk.std.Y   |numeric |                                                    |
|tBodyAccJerk.std.Z   |numeric |                                                    |
|tBodyGyro.mean.X     |numeric |                                                    |
|tBodyGyro.mean.Y     |numeric |                                                    |
|tBodyGyro.mean.Z     |numeric |                                                    |
|tBodyGyro.std.X      |numeric |                                                    |
|tBodyGyro.std.Y      |numeric |                                                    |
|tBodyGyro.std.Z      |numeric |                                                    |
|tBodyGyroJerk.mean.X |numeric |                                                    |
|tBodyGyroJerk.mean.Y |numeric |                                                    |
|tBodyGyroJerk.mean.Z |numeric |                                                    |
|tBodyGyroJerk.std.X  |numeric |                                                    |
|tBodyGyroJerk.std.Y  |numeric |                                                    |
|tBodyGyroJerk.std.Z  |numeric |                                                    |
|fBodyAcc.mean.X      |numeric |                                                    |
|fBodyAcc.mean.Y      |numeric |                                                    |
|fBodyAcc.mean.Z      |numeric |                                                    |
|fBodyAcc.std.X       |numeric |                                                    |
|fBodyAcc.std.Y       |numeric |                                                    |
|fBodyAcc.std.Z       |numeric |                                                    |
|fBodyAccJerk.mean.X  |numeric |                                                    |
|fBodyAccJerk.mean.Y  |numeric |                                                    |
|fBodyAccJerk.mean.Z  |numeric |                                                    |
|fBodyAccJerk.std.X   |numeric |                                                    |
|fBodyAccJerk.std.Y   |numeric |                                                    |
|fBodyAccJerk.std.Z   |numeric |                                                    |
|fBodyGyro.mean.X     |numeric |                                                    |
|fBodyGyro.mean.Y     |numeric |                                                    |
|fBodyGyro.mean.Z     |numeric |                                                    |
|fBodyGyro.std.X      |numeric |                                                    |
|fBodyGyro.std.Y      |numeric |                                                    |
|fBodyGyro.std.Z      |numeric |                                                    |




&nbsp;  

### Data Processing

- read the file **activity_labels.txt** into a table.  

- read the file **features.txt** into a table. Subset the table by features to be retained:  
    - select lines containig `mean()-[XYZ]` or `std()-[XYZ]`, where `[XYZ]` 
      stands for either X, Y or Z. The selected features are documented under "Output".  
    - transform the label into a valid column name, e.g. as understood by `R read.table()`:  
      eliminate parens `()` and substitute dashes by points (your system may have other
      requirements).  
&nbsp;  
- read both the **test** and **train** datasets, then merge them into a single table:  
    - read the activities from **y_... .txt** and substitute the acivity code 
      by it's label, as column "activity". 
    - read the subjects from **subject_... .txt** as the second column "subject" of the table. 
    - read the feature vectors from **X_... .txt** as the further columns of the table:  
            - ignore the columns not contained in the feature table  
            - add column names according to the feature table  
&nbsp;  
- calculate the average of each feature grouped by "Activtiy" and "Subject". The resulting table, **UciHarAvg**, is our output, stored in the file **UciHarAvg.txt**.  

### &nbsp;

