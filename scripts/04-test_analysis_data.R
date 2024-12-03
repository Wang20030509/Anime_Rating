#### Preamble ####
# Purpose: Tests the structure and validity of the cleaned Anime Rating dataset.
# Author: Doran Wang
# Date: 26 November 2024
# Contact: doran.wang@mail.utoronto.ca
# License: MIT
# Pre-requisites:
  # - The `tidyverse` and `arrow` packages must be installed and loaded
  # - 03-simulate_data.R must have been run
# Any other information needed? Make sure you are in the `anime_rating` rproj


#### Workspace setup ####
library(tidyverse)
library(arrow)

# Load the cleaned data
cleaned_data <- read_parquet("data/02-analysis_data/cleaned_data.parquet")

# Test if the data was successfully loaded
if (exists("cleaned_data")) {
  message("Test Passed: The dataset was successfully loaded.")
} else {
  stop("Test Failed: The dataset could not be loaded.")
}

#### Test data ####

# Check if the dataset has the correct number of rows (replace 50 with actual row count if known)
expected_rows <- 50  # Update this based on your expectations
if (nrow(cleaned_data) == expected_rows) {
  message("Test Passed: The dataset has ", expected_rows, " rows.")
} else {
  stop("Test Failed: The dataset does not have ", expected_rows, " rows.")
}

# Check if the dataset has the expected number of columns (replace 8 with actual column count if known)
expected_columns <- 8  # Update this based on your expectations
if (ncol(cleaned_data) == expected_columns) {
  message("Test Passed: The dataset has ", expected_columns, " columns.")
} else {
  stop("Test Failed: The dataset does not have ", expected_columns, " columns.")
}

# Check if all values in specific columns are unique (e.g., "title")
if (n_distinct(cleaned_data$title) == nrow(cleaned_data)) {
  message("Test Passed: All values in 'title' are unique.")
} else {
  stop("Test Failed: The 'title' column contains duplicate values.")
}

# Check if numeric columns have valid ranges (e.g., "score" is between 1 and 10)
if (all(cleaned_data$score >= 1 & cleaned_data$score <= 10)) {
  message("Test Passed: 'score' values are between 1 and 10.")
} else {
  stop("Test Failed: 'score' values are out of range.")
}

# Check if ranking columns (e.g., "rank", "popularity", "rank_favorites") have valid ranks
expected_ranks <- 1:nrow(cleaned_data)  # Replace with the actual rank range
if (all(sort(cleaned_data$rank) >= expected_ranks)) {
  message("Test Passed: 'rank' column contains valid ranks.")
} else {
  stop("Test Failed: 'rank' column contains invalid ranks.")
}

if (all(sort(cleaned_data$popularity) >= expected_ranks)) {
  message("Test Passed: 'popularity' column contains valid ranks.")
} else {
  stop("Test Failed: 'popularity' column contains invalid ranks.")
}

if (all(sort(cleaned_data$rank_favorites) == expected_ranks)) {
  message("Test Passed: 'rank_favorites' column contains valid ranks.")
} else {
  stop("Test Failed: 'rank_favorites' column contains invalid ranks.")
}

# Check if there are no missing values in the dataset
if (all(!is.na(cleaned_data))) {
  message("Test Passed: The dataset contains no missing values.")
} else {
  stop("Test Failed: The dataset contains missing values.")
}

# Check if numeric columns are non-negative (e.g., "num_list_users", "num_favorites")
if (all(cleaned_data$num_list_users >= 0)) {
  message("Test Passed: 'num_list_users' values are non-negative.")
} else {
  stop("Test Failed: 'num_list_users' contains negative values.")
}

if (all(cleaned_data$num_favorites >= 0)) {
  message("Test Passed: 'num_favorites' values are non-negative.")
} else {
  stop("Test Failed: 'num_favorites' contains negative values.")
}

# Check if 'title' column is character type
if (is.character(cleaned_data$title)) {
  message("Test Passed: 'title' is of type character.")
} else {
  stop("Test Failed: 'title' is not of type character.")
}
