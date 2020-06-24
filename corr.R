source("complete.R")
corr <- function(directory, threshold = 0) {
    
    #get the names of all the files in the directore
    pollutionFiles <- list.files(directory, full.names = TRUE)
    
    #count them in order to sequence through them all
    numFiles <- length(pollutionFiles)
    
    #create a vector to contain the correlations that is as long as the number of files
    vecOfCorrelations <- vector(mode="numeric", length=numFiles)
    
    #this index will be updated if the number of files is above the threshold and a number is added to the vector
    locationIndex <- 1
    
    #loop through each file
    for (index in 1:numFiles) {
        #use previously created "complete.R" to get the complete number of observations in the (index) file
        completeDF <- complete(directory, index)
        
        #complete returns a data frame with columns of "id" and "nobs" we only want the nobs
        #pull the number of observations (nobs) from the data frame, only 1 row (index) returned from complete
        numCompleteRows <- completeDF[["nobs"]]
        
        #only run if the number of completed rows is above the aurgument threshold
        if (numCompleteRows > threshold) {
            #use the pollution name from the list.files and read the csv data
            fileDF <- read.csv(pollutionFiles[[index]])
            
            #over write fileDF with complete cases from fileDF
            fileDF <- fileDF[complete.cases(fileDF), ]
            
            #read the sulfate and nitrate values into vectors - complete cases so the length should be equal
            sulfateVector <- fileDF[ ,"sulfate"]
            nitrateVector <- fileDF[ ,"nitrate"]
            
            #cor computes the coorelation between the two equal lenght vectors
            cor <- cor(sulfateVector, nitrateVector)
            
            #add this correlation to previously created vector
            vecOfCorrelations[locationIndex] <- cor
            
            #increment the index 
            locationIndex <- locationIndex + 1
        }
    }
    
    #trim the vector of correclations down to elimated 0's at the end of the vector
    vecOfCorrelations <- vecOfCorrelations[1:locationIndex-1]
}

cr <- corr("specdata", 900)