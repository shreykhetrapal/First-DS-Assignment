# calculates the mean of a pollutant (sulfate or nitrate) across a specified list of monitors.
pollutantmean <- function(directory, pollutant, id=1:332){
  
  file_names <- list.files(directory,full.names = TRUE) 
  #print(file_names)
  
  # empty dataframe to conacatenate all the csv files into one
  dat <- data.frame() 
  
  #rbind #dat contains all the values of the requested IDs
  for (i in id){
    dat <- rbind(dat,read.csv(file_names[i])) 
  }
  
  mean(dat[[pollutant]],na.rm = TRUE)
  
}

# reads a directory full of files and reports the number of completely observed cases in each data file. 
complete <- function(directory,id){
  file_names2 <- list.files(directory,full.names = TRUE)
  
  dat2 <- data.frame()
  
  for (i in id){
    dat2 <- rbind(dat2,read.csv(file_names2[i])) 
  }
  
  #creating a 3rd dataframe
  
  
  dat3 <- data.frame() # empty dataframe to store computed values
  
  casesComplete <- complete.cases(dat2) # Logical vector of rows having complete values
  
  completeData <- dat2[casesComplete,] #Note the ',' after [casesComplete, ] it specifies coplete rows all columns
  
  
  for (j in id){
    
    counts <- sum(completeData$ID==j) # If completeData$ID == j :: Will generate a vector of length of complete data with TRUE values only for the correct 'j'
    # Sum function calculates all the true values
    dat3 <- rbind(dat3,c(j,counts)) # this adds rows to the existing dataframe
  }
  
  #naming the columns as per the requirement
  colnames(dat3)<-c('id','nobs')
  dat3
  
}