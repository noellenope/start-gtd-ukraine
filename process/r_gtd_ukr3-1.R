library(purrr)
library(stringr)
## working with an array tree:
a <- purrr::array_tree(jsonl)
b <- purrr::array_branch(a)


# Example exploration of data:
#  We can See the 'compound_codes' and 'global_codes' here:
str(a[[1]])

# We can see that it has a structure of 'plus_code' and 'results'.
# Plus code always has a list length of 2.

# We are looking at the results.
# Check the result types:
a[[1]]$results[[1]]

# Look at the results list-names:
names(a[[1]]$results[[1]])
names(a[[2]]$results[[10]])

# These are variable and often redundant data. We want to extract our data
# and rectangle it alongside our main data.

a[[1]]$results[[1]]$formatted_address
str(a[[1]]$results)

# This is a function to detect whether or not this first node is a street
# address:
str_detect(a[[1]]$results[[1]]$types, pattern = "street_address")

# We can lapply through the data to see whether a street address is in the list.
lapply(a[[1]]$results[[11]]$types, 
       function(f) str_detect(string = f, pattern = "street_address"))


# We can sapply or lapply through a list of results as well:

test <- sapply(a[[2]]$results[[1]]$formatted_address,
      function(f) str_extract_all(string = f, pattern = ".*"))

###
###
###
###
###


a[[1]]$results[[1]]$geometry


is.list(a[[1]]$results[[1]]$geometry)

a[[1]]$results
str(a[[1]]$results)



###
###
###

is.numeric(a[[2]]$results[[1]]$geometry[[1]]$lat)

length(a)

length(a[[1]])

length(a[[1]]$results[[9]])


purrr::as_vector()

for (i in 1:length(a)) {
  
  coords <- as.vector(length(a))
  
  for (j in 1:length(a[[i]]$results))
    
    for (k in 1:length(a[[i]]$results[[j]]$geometry$location))
      
     lat <- a[[i]]$results[[j]]$geometry$location$lat 
     lon <- a[[i]]$results[[j]]$geometry$location$lng
     
     coords <- cbind(lat, lon)
     
     print(coords)
    
  }
  
}
  

test
  
    
    



  
## concatenated .json example tree:

## jsonl:
# $ :List of 3
# ..$ plus_code:List of 2
# .. ..$ compound_code: chr "2WWR+MVC Makiivka, Donetsk Oblast, Ukraine"
# .. ..$ global_code  : chr "8GWV2WWR+MVC"
# ..$ results  :List of 8
# .. ..$ :List of 6
# .. ..$ :List of 5
# .. ..$ :List of 5
# .. ..$ :List of 5
# .. ..$ :List of 5
# .. ..$ :List of 5
# .. ..$ :List of 5
# .. ..$ :List of 5
# ..$ status   : chr "OK"

