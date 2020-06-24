complete <- function(directory, id = 1:332) {
    
    #get get the names of the files in the directory
    pollutionFiles <- list.files(directory, full.names = TRUE)[id]
    
    #id is a vector, get the length of it and create vectors for the id and number of observations
    idVector <- numeric(length(id))
    obsVector <- numeric(length(id))
    
    #loop using seq_allong for each of the polution file names
    for (index in seq_along(pollutionFiles)) {
        #read the csv data for the file at the given index
        fileDF <- read.csv(pollutionFiles[[index]])
        
        #overwrite the data file so it only includes the complete cases it held
        fileDF <- fileDF[complete.cases(fileDF), ]
        
        #add the index number into the idVector at the index coorelating to the current index, not the "id" aurgument
        idVector[[index]] <- index
        
        #counts the number of rows that have complete data in this file and adds the count to the obsVector
        obsVector[[index]] <- nrow(fileDF)
    }
    
    #create a data frame by combining the two vectors
    result <- data.frame(idVector, obsVector)
    
    #add columnames to the data frame
    colnames(result) <- c("id", "nobs")
    
    #ruturn the dataframe
    result
    
}

complete("specdata", c(1,2,13))














# allDataList <- list()
# for (i in id) {
#     print(i)
#     if (nchar(i) == 1) {
#         filePrefix <- paste("00", i, sep = "")
#     } else if (nchar(i) == 2) {
#         filePrefix <- paste("0", i, sep = "")
#     } else {
#         filePrefix <- i
#     }
#     dirString = paste("./", directory, "/", filePrefix, ".csv", sep = "")    
#     dat <- read.csv(dirString)
#     dataNoNA <- na.omit(dat)
#     count <- NULL
#     count <- nrow(dataNoNA)
#     allDataList <- c("id" = i,"nobs" = count)
#     
#     #list.append(c("id" = i,"nobs" = count))
# }