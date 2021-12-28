library(sf)
library(sp)
library(jsonlite)
library(rapidjsonr)
library(tibble)
library(repurrrsive)
library(dplyr)
library(tidyr)
library(stringr)
install.packages("listviewer")
library(listviewer)

## Concatenate files into single .json and write the file:

setwd("E:/Home Dev Env/nodejs/reverse-geocode/Responses/")

df_json <- read_json("./GET Reverse Geocode1638656513931.json")
df_list <- fromJSON("./GET Reverse Geocode1638656513931.json")

files <- list.files(path ="./", pattern = ".json", full.names = TRUE, recursive = FALSE)

glimpse(files)

jsonl_2 <- lapply(files, function(f) fromJSON(file = f))
jsonc_2 <- toJSON(jsonl)
write(jsonc, file = "concat.json")

ukraine <- rowid_to_column(ukraine)
concat_json <- read_json(path = "./concat.json")

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

## working with an array tree:
a <- purrr::array_tree(jsonl)
b <- purrr::array_branch(a)


# Example exploration of data:
#  We can See the compound and global_codes here:
str(a[[1]])

# We can see that it has a structure of 'plus_code' and 'results'.
# Plus code always has a list length of 2.

# We are looking at the results.
# Check the result types:
a[[1]]$results[[1]]

# Look at the results list-names:
names(a[[1]]$results[[8]])
names(a[[1]]$results[[1]])



a[[1]]$results[[1]]$formatted_address
str(a[[1]]$results)


str_detect(a[[1]]$results[[1]]$types, pattern = "street_address")

# 
lapply(a[[1]]$results[[1:length]]$types, 
       function(f) str_detect(string = f, pattern = "street_address"))




# Reference:
jsonl <- lapply(files, function(f) fromJSON(file = f))
