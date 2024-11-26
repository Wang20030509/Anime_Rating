#### Preamble ####
# Purpose: Cleans the raw plane data recorded by two observers..... [...UPDATE THIS...]
# Author: Rohan Alexander [...UPDATE THIS...]
# Date: 6 April 2023 [...UPDATE THIS...]
# Contact: rohan.alexander@utoronto.ca [...UPDATE THIS...]
# License: MIT
# Pre-requisites: [...UPDATE THIS...]
# Any other information needed? [...UPDATE THIS...]

#### Workspace setup ####
library(tidyverse)
library(arrow)

#### Clean data ####
raw_data <- read_parquet("../Anime_Rating/data/01-raw_data/anime_data.parquet")

cleaned_data <-
  raw_data |>
  janitor::clean_names() |>
  select(mean, popularity, num_list_users, rank) |>
  rename(score = mean
         ) |> 
  tidyr::drop_na()

#### Save data ####
write_parquet(cleaned_data, "data/02-analysis_data/cleaned_data.parquet")
