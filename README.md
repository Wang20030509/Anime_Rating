# Exploring the Relationship Between Anime Scores, Popularity, and Favorites: A Correlation Analysis

## Overview

This repository explores the relationship between anime scores, popularity, and favorites by leveraging data obtained from the MyAnimeList API. The dataset was created by extracting ranking data through the API and transforming it into a comprehensive new dataset. Using this data, I conducted an analysis to investigate how popularity and favorites influence anime scores.

The primary hypothesis is that popularity has a stronger impact on anime scores—higher popularity is expected to correlate with higher scores. Additionally, I predict that a higher number of favorites also contributes to an increase in scores. The analysis aims to provide insights into these relationships and quantify their respective influences.


## File Structure

The repo is structured as:

-   `data/raw_data` contains the raw data as obtained from MyAnimeList (MAL) API.
-   `data/analysis_data` contains the cleaned dataset that was constructed.
-   `model` contains fitted models. 
-   `other` contains relevant literature, details about LLM chat interactions, and sketches.
-   `paper` contains the files used to generate the paper, including the Quarto document and reference bibliography file, as well as the PDF of the paper. 
-   `scripts` contains the R scripts used to simulate, download and clean data.


## Statement on LLM usage

Aspects of the code and paper were written with the help of ChatGPT. Some of the data interpretation, introduction, and discussion were also written using ChatGPT. The entire chat history is available in `others/llms/usage.txt`
