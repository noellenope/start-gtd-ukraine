require(rjson)
library(rjson)

## Concatenate files into single .json and write the file:

## list the files to an object with the number of .json objects:
files <- list.files(path ="./data/ukr_gtd_json/", pattern = ".json", full.names = TRUE, recursive = FALSE)

## apply the 'fromJSON' function over them:
jsonl_2 <- lapply(files, function(f) rjson::fromJSON(file = f))

## send back 'toJSON':
jsonc_2 <- rjson::toJSON(jsonl_2)

## Write the 'jsonc_2' file:
write(jsonc_2, file = "./data/merge_output/extr_all2.json")