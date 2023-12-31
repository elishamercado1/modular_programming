library(tidyr)
library(dplyr)
library(stringr)
library(readr)

## Code to be improved to complete exercise 1


#' Read population data and reformat column names
load_formatted_frame <- function(path_to_data) {
  # Load the population density data 2019
  formatted_path <- file.path(path_to_data)
  dataframe <- readr::read_csv(formatted_path)
  
  # Clean the column names, following snake_case convention
  colnames(dataframe) <- tolower(colnames(dataframe))
  colnames(dataframe) <- stringr::str_replace_all(colnames(dataframe), pattern = " ", replacement = "_")
  
  return(dataframe)
}

#
# Adapt the function below to achieve the task set in exercise 1
# Remove the ____'s and fill them with appropriate variables
#


access_country_code <- function(data) {
  cleaned_data <- data |> 
    separate(col = country_and_parent_code,
             into = c("country_code", "parent_code"), sep = "_") |> 
    select(everything(), -parent_code)
  
  return(cleaned_data)
}


# Loading both data frames
population_density <- load_formatted_frame("population_density_2019.csv")
locations <- load_formatted_frame("locations.csv")


# 
# Check your function works as expected with the code below
#

pop_density_single_code <- access_country_code(population_density)
print(pop_density_single_code$country_code)
