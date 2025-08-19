#importing libraries

library(tidyverse)
library(palmerpenguins)
library(lubridate)
rm(list = ls)

#attach tidy
library(tidyverse)
library(palmerpenguins)
library(lubridate) #helps us with dates

#1 data wrangling refresher
#2only include penguins from briscoe and dream island
#remove the year and sex variables
#3 add new column called body_mass_kg with penguin mass converted from grams to kg
#4 rename the island variable to location
penguins %>%


  # # Load necessary libraries
  library(dplyr)

# Assuming you have the 'palmerpenguins' dataset
library(palmerpenguins)
#view the raw data
penguins

# Step 1: Filter penguins from Briscoe and Dream islands
# Step 2: Remove the 'year' and 'sex' variables
# Step 3: Add a new column 'body_mass_kg' (convert grams to kilograms)
# Step 4: Rename the 'island' variable to 'location'

#created a new dataset with a filter for island and dream island. used the pipe which piped to subtract or remove year and sex of the penguin info.

penguins_cleaned <- penguins %>%
  filter(island %in% c("Biscoe", "Dream")) %>%  # Filter for specific islands using the syntax of minus yearr and sex, create a vector of the islands we want
  select(-year, -sex) %>%                      # Remove 'year' and 'sex' columns

  mutate(body_mass_kg = body_mass_g / 1000) %>% # Add 'body_mass_kg' column by mutating the column and coonverting the mass into kg

  #then piped to renamed the island columm to locations
  rename(location = island)                    # Rename 'island' to 'location'

# Viewing the changed dataset with the head function
head(penguins_cleaned)


#find stats for


#creating a summary table of the data and then piping it to .....
#piping to the filter function for species of Adelie then make sure the flipper legnth is not NA.
summary_table <- penguins %>%
  filter(species == "Adelie",!is.n
           a(flipper_length_mm)) %>%

  #next we pipe again for group by based on sex
  group_by(sex) %>%
  #we then summarize function with the mean by means of summarize and create a variable for mean
  summarise(
    mean_flipper = mean(flipper_length_mm),
    #we then also create the standard deveitation by sd function for the flipper length
    sd_flipper = sd(flipper_length_mm),
    sample_size = n()
  )
#call the summary table
summary_table
sample_size

