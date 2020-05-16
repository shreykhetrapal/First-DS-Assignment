corr <- function(directory, threshold = 0){
  
  completes = complete(directory, 1:332) #function from previous script
  completes_above_threshold = subset(completes, nobs > threshold )
  
  ## Initialize empty vector variable
  correlations <- vector()
  
  ## Get a list of filenames
  filenames = list.files(directory,full.names = TRUE)
  
  ## For each .csv file in id
  for(i in completes_above_threshold$id){
    
    filepath=filenames[i]
    
    ## read in each file and store it in data
    data = read.csv(filepath, header = TRUE)
    
    ## Calculate and store the number of completed cases
    completeCases = data[complete.cases(data),]
    count = nrow(completeCases)
    
    ## Calculate and store the count of complete cases
    ## if threshhold is reached
    if( count >= threshold ) {
      correlations = c(correlations, cor(completeCases$nitrate, completeCases$sulfate) )
    }
  }
  correlations
}

cr <- corr("specdata", 150)
head(cr)