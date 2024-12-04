#### Preamble ####
# Purpose: Downloads and saves the data from MyAnimeList by using API
# Author: Doran Wang
# Date: 26 November 2024
# Contact: doran.wang@mail.utoronto.ca
# License: MIT
# Pre-requisites: 
  # - Create an account in MyAnimeList(MAL), then apply the client accessing 
    #the MAL API.
  # - The `tidyverse` package must be installed and loaded
  # - The `arrow` package must be installed and loaded
  # - The `httr` package must be installed and loaded
  # - The `jsonlite` package must be installed and loaded

# Any other information needed? 
  # For not being disclosed, I set the client ID in .Renviron. Method: 
  # 1. install and load package "usethis". 2. run "edit_r_environ()" in console.
  # or For convenience, you can paste your client ID down below by uncomment the
  # line of setting CLIENT_ID.



#### Workspace setup ####
library(httr)
library(jsonlite)
library(tidyverse)
library(arrow)


### API setup ###
# Your MyAnimeList Client ID
# CLIENT_ID <- "YOUR_CLIENT_ID"

# API URL
url <- "https://api.myanimelist.net/v2/anime/ranking?ranking_type=favorite&limit=200&fields=title,mean,popularity,num_list_users,rank,num_scoring_users"

# Make the GET request
response <- GET(
  url,
  add_headers(`X-MAL-CLIENT-ID` = CLIENT_ID)
)

# Check if the request was successful
if (http_status(response)$category == "Success") {
  # Parse the JSON response
  anime_data <- fromJSON(content(response, "text"))
  
  # Print the parsed response
  print(anime_data)
} else {
  # Print error message
  print(paste("Error:", http_status(response)$message))
}



#### Create data ####
anime_data <- anime_data$data$node



#### Save data ####
write_parquet(anime_data, "data/01-raw_data/anime_data.parquet")


         
