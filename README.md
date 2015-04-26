# Getting And Cleaning Data Project
This repository hosts the R script, and the documentation for the Getting and Cleaning data course's project.

In order to test the script, load the script, and it will perform the operations of downloanding, unzipping and processing all the zip's files.

##run_analysis.R
The script is expected to download the zip file from the web, and then perform a set of operations, to provide a tidy data set with the expected output.
There are some helper functions in the base code, to read files into data.tables.

## Processing Description
The script performs the following processing, in order to provide the output.
<ul>
<li>1. Download the zip file from the web, and unzip it to a target folder.</li>
<li>2. Reads the test and training and train subject files.</li>
<li>3. Reads the test and training files with the labels.</li>
<li>4. Reads the features files.</li>
<li>5. Join the data sets by rows.</li>
<li>6. Join the data sets by columns.</li>
<li>6. Extract the requested variables for mean and std, by doing a grep of the variables names.</li>
<li>7. Apply the mean function to each vector of values in each subject/activity pair. This is the clean dataset.</li>
<li>8. Write the end result to a disk.</li>
</ul>

## Output
The result is written to the file tidyDataResult.txt
