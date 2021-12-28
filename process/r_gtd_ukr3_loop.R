library(dplyr)
library(purrr)
library(stringr)
library(tibble)
library(jsonlite)


##
## Loop for retrieving specific results from 
## .json file converted to R list-object:
##


## Set global options to keep as many decimals as is
## needed for accurate Geographic readings:

options(digits=8)


## for every item in 1:length of 'a' (full, unorganized 
## Google Maps API Reverse Geocode result:
##
## (tested from RAW .json obtained by Manual Postman HTTP GET Request)
##

for (i in 1:length(a)) {
  
  ## CRITICAL!
  ## This sets integer 'i' in 'storage.df' - it gives the factor label of which
  ## object in the parsed .json file. 
  
  storage.df <- i

  
  ## If the status is NOT "OK", skip onto the next:
  
  if (a[[i]]$status != "OK") { 
     
    next }
  
  ## for integers 'j' in the object `a[[i]]$results` 
  
  for (j in 1:length(a[[i]]$results)) {
    
    ## for integers 'k' in the object a[[i]]$results[[j]]$formatted_address
    ## 'k' == 1.
    
    for (k in 1:length(a[[i]]$results[[j]]$formatted_address)) {
        
      ## paste the 'formatted_address' field in the reslut array
      ## and place it in object `address`
      
      address <- paste(a[[i]]$results[[j]]$formatted_address[[k]])
      
      ## Extract the latitude and longitude of 'k' and pass to
      ## temporary variables storing values that are passed along
      ## integer 'k'.
      
      lat[k] <- a[[i]]$results[[j]]$geometry$location$lat 
      lon[k] <- a[[i]]$results[[j]]$geometry$location$lng
      
      ## create a list of lat and lon:
      
      coords <- c(lat[k], lon[k])
      
      ## row bind this list:
      
      test <- rbind(coords, address)
      
      ## paste the integer [i] into the bottom [2,2] place in the 
      ## object 'test'.
      
      test[2,2] <- paste(storage.df)
      
      ## store object 'test' as matrix.data.frame in 'obj'
      
      obj <- as.array(test)
      
      str(obj)
      
      ## for integer 'm' in 1:length(test)
      
      for (m in 1:length(test)) {
            
            ## make 'obj2' a list
            obj2 <- list
  
            ## set the dimensions of 'obj2' from 'obj'
            obj2 <- dim(obj)
            
            ## replicate the return of 'obj' into 'obj2'
            obj2 <- rep(obj)
            
            ## CRIT: This section was is, honestly, as a waste of some memory?
            ##
            ## Seriously though, this part returns obj3 as a derivative of the
            ## 'obj2' created from the results of the loop.
            ##
            ## 
            
            obj3 <- list()
            
            obj3$lat <- obj2[[1]][1]
            obj3$address <- obj2[[2]][1]
            obj3$lon <- obj2[[3]][1]
            obj3$gtd_num <- obj2[[4]][1]
            
            obj3$lat <- as.numeric(obj3$lat)
            obj3$lon <- as.numeric(obj3$lon)
            
            ## write 'obj3' as a .json array:
            json1 <- jsonlite::toJSON(obj3)
            
            ## write 'json1' as .json file; sequence the file names along the integers
            ## 'i' and 'j'. 
            
            
            ## This is SOMEHOW BROKEN but the results are in aggregated.json OR extr_all.json
            write(json1, file = paste("E:/test",i,j,".json"))
            
            ## Integers 'i' and 'j' in the file names may now be used to organize the aggregate
            ## results in a way that streamlines extraction of most accurate points and total information
            ## within a single object in the next step.
            
      }
      
    }
        
  }
        
}
  



###
###
###