corr <- function(directory,threshold=0){
  file_names3 <- list.files(directory,full.names = TRUE)

  dat4 <- data.frame()
  
  for (i in 1:332){
    dat4 <- rbind(dat4,read.csv(file_names3[i])) 
  }
  
  completeData2 <- dat4[complete.cases(dat4), ]
  
  dat5 <- data.frame() # making dataframe of ID and numberOfCompleteCases
  
  for (j in 1:332){
    totalcases <- sum(completeData2$ID==j)
    dat5 <- rbind(dat5,c(j,totalcases))
  }
  
  colnames(dat5) <- c('id','total')
  
  newDataID <- dat5[dat5$total>threshold, ] #contains IDs of rows with threshold value greater than required
  
  
  
}