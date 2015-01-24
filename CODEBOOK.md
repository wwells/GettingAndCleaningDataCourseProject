## Original Data

For detailed description of the original dataset, please see README.txt and
features_info.txt in the original raw zipped dataset.

## Raw data Filtering

The all_data dataset extracts only those instrument measurements we are concerned with in this course project:   Mean and STD.   

## Tidy Data Updates

To further faciltiate readability, the following updates were also made to the column names using 
names(x).   

### Primary IDs

*  y_data <- "activity"
*  subject_data <- "subject"

NOTE:  for ease of of scanning the data, these columns were rearranged to come 
first in the tidy_data set.

### Variable Name Updates

*  -mean <- Mean
*  -std <- Std
*  removed parentheses
*  BodyBody <- Body

As a result, a field like "tBodyAcc-mean()-X" becomes "tBodyAccMeanX"