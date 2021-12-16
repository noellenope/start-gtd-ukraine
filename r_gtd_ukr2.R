library(sf)
library(sp)
library(jsonlite)
library(rapidjsonr)
library(tibble)
library(repurrrsive)
library(dplyr)
library(tidyr)
library(stringr)
library(rjson)
install.packages("listviewer")
library(listviewer)


response_dir <- setwd("E:/Home Dev Env/nodejs/reverse-geocode/Responses/")
project_dir <- setwd("E:/Home Dev Env/R-DevEnv/start-gtd-ukraine/")



# Examples of data style of single responses from Google API:
df_json <- read_json("./GET Reverse Geocode1638656513931.json")
df_list <- fromJSON("./GET Reverse Geocode1638656513931.json")

# Concatenate files into single .json and write the file:
response_dir
files <- list.files(path ="./", pattern = ".json", full.names = TRUE, recursive = FALSE)

jsonl <- lapply(files, function(f) fromJSON(file = f))
jsonc <- toJSON(jsonl)

project_dir
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

