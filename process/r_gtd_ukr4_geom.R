library(jsonlite)
library(rjson)
library(sf)
library(sp)
library(dplyr)

## Set options to eight for maximum geometric accuracy:
options(digits = 8)

## Read the file:
ukr_m <- fromJSON(txt = "./data/merge_output/extr_all.json")

## Set the 'gtd_num' variable as factor:
ukr_m$gtd_num <- as.factor(ukr_m$gtd_num)

## Convert to numeric:
ukr_m$lat <- as.numeric(ukr_m$lat)
ukr_m$lon <- as.numeric(ukr_m$lon)


## convert to spatial feature:
ukr_m2 <- st_as_sf(ukr_m, coords = c("lat", "lon"), crs = 4326)