#### Preamble ####
# Purpose: Cleans the raw data
# Author: Doran Wang
# Date: 26 November 2024
# Contact: doran.wang@mail.utoronto.ca
# License: MIT
# Pre-requisites: 
  # - Access the 02-download_data.R first
  # - The `tidyverse` package must be installed and loaded
  # - The `arrow` package must be installed and loaded
# Any other information needed? install the package `arrow`

#### Workspace setup ####
library(tidyverse)
library(arrow)

#### Clean data ####
raw_data <- read_parquet("../Anime_Rating/data/01-raw_data/anime_data.parquet")

num_favorites <- c(230821,229949,215928, 192667, 176851, 176089, 114513, 110665,
                   109387, 92800, 92031, 91959, 90265, 86868, 84622, 81500, 79930,
                   77161, 76525, 75221, 70931, 69642, 69027, 65103, 63768, 59973,
                   59777, 57613, 57185, 56722, 55,665, 53748, 52657, 50904,50454,
                   50242, 49712, 49147, 49088, 48928, 48026, 47912, 47841, 46890,
                   46067, 45355, 40702, 40448, 39821, 39658)
cleaned_data <-
  raw_data |>
  janitor::clean_names() |>
  select(title,mean,rank, popularity, num_list_users,num_scoring_users) |>
  mutate(num_favorites = num_favorites[1:nrow(cleaned_data)], 
          rank_favorites = seq_along(title)) |>
  rename(score = mean
         ) |> 
  tidyr::drop_na()

#### Save data ####
write_parquet(cleaned_data, "data/02-analysis_data/cleaned_data.parquet")
