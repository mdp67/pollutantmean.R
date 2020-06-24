
pollutantmean <- function(directory = "./specdata", pollutant, id = 1:332) {
    
    #get the names of all the files the correspond to the "id" argument (files sorted 001.csv, 002.csv...)
    pollutionFiles <- list.files(directory, full.names = TRUE)[id]
    
    #lapply is a looping function so it creates a list of lists, each sub list is all the numeric readings from the file
    pollutionData <- lapply(pollutionFiles,function(x) read.csv(x)[[pollutant]])
    
    #combines all the lists into a single vector
    combinedData <- unlist(pollutionData)
    
    #removes the NAs and finds the mean of the readins for the polution readings
    mean(combinedData, na.rm = TRUE)
}

