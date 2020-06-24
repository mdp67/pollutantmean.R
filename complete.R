complete <- function(directory, id = 1:332) {
    
    pollutionFiles <- list.files(directory, full.names = TRUE)[id]
    
    idVector <- numeric(length(id))
    obsVector <- numeric(length(id))
    
    for (index in seq_along(pollutionFiles)) {
        fileDF <- read.csv(pollutionFiles[[index]])
        fileDF <- fileDF[complete.cases(fileDF), ]
        idVector[[index]] <- index
        obsVector[[index]] <- nrow(fileDF)
    }
    
    
    result <- data.frame(idVector, obsVector)
    colnames(result) <- c("id", "nobs")
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