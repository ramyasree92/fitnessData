## Loading this library to use group_by and summarize_all from dplyr
library(dplyr)

## Initializing Global Data variables which are used to construct clean data frame


xdata <<- data.frame(factor())
ydata <<- data.frame(integer())
subdata <<- data.frame(integer())

## reading test and train data. All data is held by xdata, ydata and subdata global variables
# Definition of readData function is in readData-fitness.R file
readData("test")
readData("train")



## Modifying Names to have appropriate Values for activity and person data variables
names(ydata) <- "activity"
names(subdata) <- "PersonID"

#This is the sample code needs to be executed for each element of xdata data which include cleaning and finding mean and 
# Standard deviation
################
#x <- xdata[1, ]
#x <- trimws(x)
#xsplit <- strsplit(as.character(x), split = " ")
#xsplitnum <- sapply(xsplit, as.numeric)

#mean(xsplitnum)
################

## The same Code as above is implemented for all elements of list using sapply and apply to find mean and SD
## at the end of which we have mean and SD data variables

xdata <- sapply(xdata, function(x){trimws(x)})  #This will trim white spaces in data
#There are two spaces between some variables. Replacing that with one space. So that when we split in next step 
#no data with just spaces would be saved

xdata <- sapply(xdata, function(x){gsub("  ", " ", x)}) 
#Breaking complete character string such as "2.2172674e-001 -2.4376970e-002" to "2.2172674e-001" and "-2.4376970e-002"
xdatasplit <- sapply(xdata, function(x) {strsplit(as.character(x), split = " ")})
#Converting characters to numeric values
xdatasplitnum <- sapply(xdatasplit, function(x){sapply(x, as.numeric)})


meanData <- colMeans(xdatasplitnum) # Finding mean of each data point
sdData <- apply(xdatasplitnum, 2, sd) # Finding standard deviation of each data point

#Each element will have a big name as Data before finding mean. Removes name for individual element
meanData <- unname(meanData)
sdData <- unname(sdData)

# Creating a Single DataFrame having PersonID, Activity and Mean and Standard deviation Data
fitnessData <- cbind(subdata, ydata)
fitnessData <- cbind(fitnessData, meanData)
fitnessData <- cbind(fitnessData, sdData)

## Giving appropriate names for Activities
fitnessData$activity[fitnessData$activity == 1] <- "WALKING"
fitnessData$activity[fitnessData$activity == 2] <- "WALKING_UPSTAIRS"
fitnessData$activity[fitnessData$activity == 3] <- "WALKING_DOWNSTAIRS"
fitnessData$activity[fitnessData$activity == 4] <- "SITTING"
fitnessData$activity[fitnessData$activity == 5] <- "STANDING"
fitnessData$activity[fitnessData$activity == 6] <- "LAYING"

#Creating independent tidy grouped data

#Grouping data with PersonID and activity
groupedfitnessData <- group_by(fitnessData, PersonID, activity)

#Selecting PersonID, Activity and meanData
groupedfitnessData <- select(groupedfitnessData, PersonID:meanData)

#Summarizing to get mean for each person's different activity
groupedfitnessData <- summarize_all(groupedfitnessData, .funs = mean)

## Renaming meanData column name of groupedFitnessData to have activityMean value
colnames(groupedfitnessData)[3] <- "activityMean"

## Writing dataframe to txt file

 write.table(groupedfitnessData, file = "groupedfitnessdata.txt", row.names = FALSE, sep = "\t")
