# CodeBook
The script performs the following operations on the original data source.

<ul>
<li>1. Download the zip file from the web, and unzip it to a target folder.</li>
<li>2. Reads the subject_train.txt and subject_test.txt files.</li>
<li>3. Reads the files containing the labels, for the training and test data sets.</li>
<li>4. Reads the training and test data sets (X_train.txt and X_test.txt).</li>
<li>5. Join the subject datasets by rows, using the rbind function, and set a meaningful name for the column name.</li>
<li>6. Join the the labels data sets by rows, using the rbind function.</li>
<li>7. Join the the activities data sets by rows, using the rbind function.</li>
<li>8. For all the above resulting objects, join them by columns.</li>
<li>9. Sort the resulting table, by subject and activity name.</li>
<li>10. Read the features file, and perform a grep on the columns names, in order to extract the requested variable, containing mean and std, and merged it with 
the previous data table.</li>
<li>11. Read the activities file, set a meaningful name on the columns, and merged it with the existing data table.</li>
<li>12. Calculate the average of each variable for each activity and each subject.</li>
<li>13. Write a table with the results, presenting the rows for each subject, and the columns with the average per activity.</li>
</ul>



##Variables Description
<ul>
<li>1. dtSubjectTrain, dtSubjectTest, dtTrainingLabels, dtTestLabels, dtTraininigSet, dtTestSet contain the information from the source files.</li>
<li>2. dtSubject contains the merged data from dtSubjectTrain, dtSubjectTest.</li>
<li>3. dtLabels contains the merged data from dtTrainingLabels, dtTest.</li>
<li>4. dtSet contains the merged data from dtTraininigSet, dtTestSet.</li>
<li>5. dtSubject contains the joined data by columns, from dtSubject, dtLabels.</li>
<li>6. dtJoined contains the joined data by dtSubject, dtSet.</li>
<li>6. dtFeatures contains the requested variable from the file features; just the variables related to mean and std.</li>
<li>7. dtActivities contains the activities information, in order to merge them in the data set.</li>
<li>8. tidyData contains the final result, for the requested output.</li>
</ul>

