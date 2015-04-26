# Getting And Cleaning Data Project
This repository hosts the R script, and the documentation for the Getting and Cleaning data course's project.

##run_analysis.R
The script is expected to download the zip file from the web, and then perform a set of operations, to provide a tidy data set with the expected output.
There are some helper functions in the base code, to read files into data.tables.

## Processing Description
The script performs the following processing, in order to provide the output.
1. Download the zip file from the web, and unzip it to a target folder.
2. Reads the test and training and train subject files.
3. Reads the test and training files with the labels.
4. Reads the features files.
5. Join the data sets by rows.
6. Join the data sets by columns.
6. Extract the requested variables for mean and std, by doing a grep of the variables names.
7. Apply the mean function to each vector of values in each subject/activity pair. This is the clean dataset.
8. Write the end result to a disk.

## Output
The result is written to the file tidyDataResult.txt
