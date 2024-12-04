#### Preamble ####
# Purpose: Model the relationship between anime scores, popularity, and number of favorites
# Author: Doran Wang
# Date: 30 November 2024
# Contact: doran.wang@mail.utoronto.ca
# License: MIT
# Pre-requisites: 
  # - Access the 03-clean_data.R first
  # - The `tidyverse` package must be installed and loaded
  # - The `arrow` package must be installed and loaded
  # - The `rstanarm` package must be installed and loaded
# Any other information needed? [Update if necessary]

#### Workspace setup ####
library(tidyverse)
library(rstanarm)
library(arrow)

#### Read data ####
cleaned_data <- read_parquet("data/02-analysis_data/cleaned_data.parquet")

### Model data ####
anime_model <-
  stan_glm(
    formula = score ~ popularity + num_favorites,
    data = cleaned_data,
    family = gaussian(),
    prior = normal(location = 0, scale = 2.5, autoscale = TRUE),
    prior_intercept = normal(location = 0, scale = 2.5, autoscale = TRUE),
    prior_aux = exponential(rate = 1, autoscale = TRUE),
    seed = 853
  )

#### Save model ####
saveRDS(
  anime_model,
  file = "models/anime_model.rds"
)
