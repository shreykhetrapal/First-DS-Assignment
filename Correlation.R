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
  
  finaldata <- data.frame()
  finalvector <- data.frame()
  
  for (k in 1:nrow(newDataID)){
    
    a <- newDataID$id[k]==completeData2$ID
    
    finaldata<-rbind(finaldata,completeData2[a,c(2,3)])
    
    corelationvalue <- cor(finaldata$sulfate,finaldata$nitrate)
    
    finalvector <- rbind(finalvector,corelationvalue)
  }
   
  
  finalvector
  
}