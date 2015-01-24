Getting and Cleaning Data - Course Project
==========================================

This repository is for the final course project for JHU professor Dr. Jeff Leek's Coursera class:  
"Getting and Cleaning Data".    The primary goal of the course project is to take 'messy' data and make it 'tidy'
using the run_analysis.R script.   

## Data

The dataset being used is: Human Activity Recognition Using Smartphones

A full description is available at the site where the data was obtained:

[http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

The Raw Data can be found at:

[https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

## Files

In order to run the run_analysis.R script, download the dataset above, unzip it, and run the script from the directory directly above the unzipped "UCI HAR Dataset" folder.  

CodeBook.md describes the variables, the data, and any transformations or work that was performed to clean up the data.

run_analysis.R contains the code required to output a single clean, tidy_data.txt file. 

## run_analysis.R

Roughly, the run_analysis.R script does the following:

* Checks for plyr package, installs if not there.
* Loads raw data into R
* Merges the data into 3 logical subsets
* Extracts mean / std from the "features.txt" file
* Initial header name cleaning
* Bind all into a single data set
* Create new tidy data set with avgs of columns grouped by subject / activity fields
* Final header name cleaning
* Export final dataset as "tidy_data.txt"
