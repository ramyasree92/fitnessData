fitnessData and groupedfitnessData are the data frame variables which has Clean data and Summarized data respectively

fitnessData dataframe has variables as PersonID, activity, meanData, sdData

PersonID- This is the ID of the person performing the activity (1-30)
activity- Activity performed by Person (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)
meanData- mean of data present in each line of X_train.txt/X_test.txt  
sdData- Standard deviation of data present in each line of X_train.txt/X_test.txt files

groupedfitnessData dataframe has variables as PersonID, activity, activityMean

PersonID- This is the ID of the person performing the activity (1-30)
activity- Activity performed by Person (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)
activityMean- this is the mean of grouped data based on personID and activity. So this will have mean data of each person for his individual activity



