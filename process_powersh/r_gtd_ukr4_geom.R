library(jsonlite)
library(rjson)
library(sf)
library(sp)
library(dplyr)
library(rjson)
library(stringr)


## Set options to eight for maximum geometric accuracy:
options(digits = 8)

## Read the file:
## using 'jsonlite' package!!

ukr_m <- jsonlite::fromJSON(txt = "./data/merge_output/extr_all.json")

## Set the 'gtd_num' variable as factor:
ukr_m$gtd_num <- as.factor(ukr_m$gtd_num)

## Convert to numeric:
ukr_m$lat <- as.numeric(ukr_m$lat)
ukr_m$lon <- as.numeric(ukr_m$lon)

glimpse(ukr_m)


## convert to spatial feature:
ukr_m2 <- st_as_sf(ukr_m, coords = c("lat", "lon"), crs = 4326)


##
## 
##

library(osmdata)
library(ggmap)
library(leaflet)
library(dplyr)


test <- ukr_m %>% 
  filter(gtd_num == 140)

test

print(test$address)

m <- leaflet() %>% 
  addTiles() %>% 
  addMarkers(lng = test$lon, lat = test$lat, popup = test$address)

m

nchar(ukr_m$address)
