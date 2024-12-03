#### Preamble ####
# Purpose: Tests the structure and validity of the simulated Anime Rating dataset.
# Author: Doran Wang
# Date: 26 November 2024
# Contact: doran.wang@mail.utoronto.ca
# License: MIT
# Pre-requisites: 
  # - The `tidyverse` package must be installed and loaded
  # - 00-simulate_data.R must have been run
# Any other information needed? Make sure you are in the `anime_rating` rproj


#### Workspace setup ####
library(tidyverse)

anime_data <- read_csv("data/00-simulated_data/anime_simulated_data.csv")

# Test if the data was successfully loaded
if (exists("anime_data")) {
  message("Test Passed: The dataset was successfully loaded.")
} else {
  stop("Test Failed: The dataset could not be loaded.")
}

#### Test data ####

# Check if the dataset has 100 rows
if (nrow(anime_data) == 100) {
  message("Test Passed: The dataset has 100 rows.")
} else {
  stop("Test Failed: The dataset does not have 100 rows.")
}

# Check if the dataset has 7 columns
if (ncol(anime_data) == 7) {
  message("Test Passed: The dataset has 7 columns.")
} else {
  stop("Test Failed: The dataset does not have 7 columns.")
}

# Check if the 'title' column contains only unique values
if (n_distinct(anime_data$title) == nrow(anime_data)) {
  message("Test Passed: All values in 'title' are unique.")
} else {
  stop("Test Failed: The 'title' column contains duplicate values.")
}

# Check if the 'score' column has values between 1 and 10
if (all(anime_data$score >= 1 & anime_data$score <= 10)) {
  message("Test Passed: The 'score' column contains values between 1 and 10.")
} else {
  stop("Test Failed: The 'score' column contains values outside the range of 1 to 10.")
}

# Check if the 'rank_score' column is the correct ranking of 'score'
if (all(rank(-anime_data$score, ties.method = "min") == anime_data$rank_score)) {
  message("Test Passed: The 'rank_score' column correctly ranks the 'score' column.")
} else {
  stop("Test Failed: The 'rank_score' column does not correctly rank the 'score' column.")
}

# Check if the 'popularity' column ranks 'num_list_users' but is shuffled
if (all(sort(anime_data$popularity) == 1:nrow(anime_data))) {
  message("Test Passed: The 'popularity' column contains valid rank values.")
} else {
  stop("Test Failed: The 'popularity' column contains invalid rank values.")
}

# Check if the 'rank_favorites' column ranks 'num_favorites' but is shuffled
if (all(sort(anime_data$rank_favorites) == 1:nrow(anime_data))) {
  message("Test Passed: The 'rank_favorites' column contains valid rank values.")
} else {
  stop("Test Failed: The 'rank_favorites' column contains invalid rank values.")
}

# Check if there are any missing values in the dataset
if (all(!is.na(anime_data))) {
  message("Test Passed: The dataset contains no missing values.")
} else {
  stop("Test Failed: The dataset contains missing values.")
}

# Check if there are no empty strings in 'title' column
if (all(anime_data$title != "")) {
  message("Test Passed: There are no empty strings in the 'title' column.")
} else {
  stop("Test Failed: The 'title' column contains empty strings.")
}

# Check if 'num_list_users' and 'num_favorites' are positive integers
if (all(anime_data$num_list_users > 0 & anime_data$num_favorites > 0)) {
  message("Test Passed: Both 'num_list_users' and 'num_favorites' are positive integers.")
} else {
  stop("Test Failed: 'num_list_users' or 'num_favorites' contains non-positive values.")
}
