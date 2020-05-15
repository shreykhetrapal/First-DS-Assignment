pollutantmean <- function(directory, pollutant, id=1:332){
  
  file_names <- list.files(directory,full.names = TRUE) 
  print(file_names)
  # empty dataframe to conacatenate all the csv files into one
  dat <- data.frame() 
  for (i in id){
    dat <- rbind(dat,read.csv(file_names[i])) #rbind #dat contains all the values of the requested IDs
  }
  
}