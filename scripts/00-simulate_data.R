#### Preamble ####
# Purpose: Simulates a dataset of Anime rating, include the score, popularity,
  #and favorites
# Author: Doran Wang
# Date: 26 November 2024
# Contact: doran.wang@mail.utoronto.ca
# License: MIT
# Pre-requisites: The `tidyverse` package must be installed
# Any other information needed? Make sure you are in the `anime_rating` rproj


#### Workspace setup ####
library(tidyverse)
set.seed(509)


#### Simulate data ####
# Number of anime titles
num_titles <- 100

# Generate random anime data
anime_data <- tibble(
  # Title
  title = paste("Anime", 1:num_titles),
  
  # Random scores (between 1 and 10, rounded to one decimal place)
  score = round(runif(num_titles, min = 1, max = 10), 1),
  
  # Random number of users who listed the anime (e.g., between 10,000 and 1,000,000)
  num_list_users = sample(10000:1000000, num_titles, replace = TRUE),
  
  # Random number of favorites (e.g., between 100 and 50,000)
  num_favorites = sample(100:50000, num_titles, replace = TRUE)
) %>%
  # Generate ranks
  mutate(
    rank_score = rank(-score, ties.method = "min"),  # Rank of score (higher score = lower rank)
    popularity = rank(-num_list_users) %>% sample(size = num_titles),  # Higher num_list_users = lower rank (shuffled)
    rank_favorites = rank(-num_favorites) %>% sample(size = num_titles)  # Higher num_favorites = lower rank (shuffled)
  )

#### Save data ####
write_csv(anime_data, "data/00-simulated_data/anime_simulated_data.csv")

