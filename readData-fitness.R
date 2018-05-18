##Function to read train and testdata based on parameters passed to it and append to the global data variables.
## Global data variables will have both test and train data sets

## This function is invoked twice from run_analysis. It will append test and train data sets

##Working directory is set to have train and test data folders in current working directory
readData <- function(dataName){
  if(dataName =="test" | dataName == "train"){
    setwd("C:\\Users\\rparuchu.ORADEV\\Documents\\Data Science Tools Assignment\\UCI HAR Dataset\\")
    filedatax <- read.csv(paste(dataName, "\\X_", dataName,".txt", sep = ""), sep = "\n", header = FALSE)
    filedatay <- read.csv(paste(dataName, "\\y_", dataName,".txt", sep = ""), header = FALSE, sep = "\n")
    
    filedatasub <- read.csv(paste(dataName, "\\subject_", dataName,".txt", sep = ""), header = FALSE, sep = "\n")
    #assign(xdata, rbind(xdata, filedatax), envir = .GlobalEnv)
    #assign(ydata, rbind(ydata, filedatay), envir = .GlobalEnv)
    #assign(subdata, rbind(subdata, filedatasub), envir = .GlobalEnv)
    xdata <<- rbind(xdata, filedatax)
    ydata <<- rbind(ydata, filedatay)
    subdata <<- rbind(subdata, filedatasub)
  }
  else{
    return("Please Pass Correct Filenames")
  }
}