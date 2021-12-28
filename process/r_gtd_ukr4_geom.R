library(jsonlite)
library(rjson)
library(sf)
library(sp)
library(dplyr)


options(digits = 8)

ukr_m <- fromJSON(txt = "./data/merge_output/extr_all.json")
ukr_m$gtd_num <- as.factor(ukr_m$gtd_num)

ukr_m$lat <- as.numeric(ukr_m$lat)
ukr_m$lon <- as.numeric(ukr_m$lon)

ukr_m <- unique(ukr_m)

##
## somehow transferred to SFC...?
##



