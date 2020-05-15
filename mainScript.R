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

complete <- function(directory,id){
  
}