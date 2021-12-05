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

sapply(a[[10]]$results[2[]],
      function(f) str_detect(string = f, pattern = "address_component"))





