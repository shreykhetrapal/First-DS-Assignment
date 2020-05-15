complete <- function(directory,id){
  file_names2 <- list.files(directory,full.names = TRUE)
  
  dat2 <- data.frame()
  
  for (i in id){
    dat2 <- rbind(dat2,read.csv(file_names2[i])) 
  }
  
  #creating a 3rd dataframe
  
  
  dat3 <- data.frame() # empty dataframe to store computed values
  
  casesComplete <- complete.cases(dat2)
  
  completeData <- dat2[casesComplete,] #Note the ',' after [casesComplete, ] it specifies coplete rows all columns
  
  
  for (j in id){
    
    counts <- sum(completeData$ID==j) #
    dat3 <- rbind(dat3,c(j,counts)) #
  }
  
  colnames(dat3)<-c('id','nobs')
  dat3
}