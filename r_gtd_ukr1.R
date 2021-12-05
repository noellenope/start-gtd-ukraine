library(dplyr)
library(tidyr)

##
data <- read.csv("./data/globalterrorismdb_0221dist.csv")
data <- rename(data, "eventid" = ï..eventid)

## concatenate lat and lon into a single column readable by Google Geocode API:
data$latlng <- str_c(data$latitude, data$longitude, sep = ",") 

## extract only Ukraine coordinates:
ukraine <- data %>% 
  filter(country == 214)

## setwd to /data:
setwd("./data")

## write .csv for reverse geocoding and analysis:
write.csv(ukraine, file = "ukraine_gtd.csv")