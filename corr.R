source("complete.R")
corr <- function(directory, threshold = 0) {
    
    pollutionFiles <- list.files(directory, full.names = TRUE)
    numFiles <- length(pollutionFiles)
    vecOfCorrelations <- vector(mode="numeric", length=numFiles)
    
    locationIndex <- 1
    for (index in 1:numFiles) {
        completeDF <- complete(directory, index)
        numCompleteRows <- completeDF[["nobs"]]
        
        if (numCompleteRows > threshold) {
            fileDF <- read.csv(pollutionFiles[[index]])
            fileDF <- fileDF[complete.cases(fileDF), ]
            sulfateVector <- fileDF[ ,"sulfate"]
            nitrateVector <- fileDF[ ,"nitrate"]
            cor <- cor(sulfateVector, nitrateVector)
            vecOfCorrelations[locationIndex] <- cor
            locationIndex <- locationIndex + 1
        }
    }
    vecOfCorrelations <- vecOfCorrelations[1:locationIndex-1]
}

cr <- corr("specdata", 900)