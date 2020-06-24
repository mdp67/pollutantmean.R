
pollutantmean <- function(directory = "./specdata", pollutant, id = 1:332) {
    
    pollutionFiles <- list.files(directory, full.names = TRUE)[id]
    pollutionData <- lapply(pollutionFiles,function(x) read.csv(x)[[pollutant]])
    combinedData <- unlist(pollutionData)
    mean(combinedData, na.rm = TRUE)
}

