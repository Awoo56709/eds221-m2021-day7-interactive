#importing libraries


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

  #next we pipe again for group by based on sex

  #we then summarize function with the mean by means of summarize and create a variable for mean

  summary_table <- penguins %>%
  filter(species == "Adelie",!is.na(flipper_length_mm)) %>%
  group_by(sex) %>%
  summarise(    #we then also create the standard deveitation by sd function for the flipper length
    mean_flipper = mean(flipper_length_mm),
    sd_flipper = sd(flipper_length_mm),
    n = n()
  )
#call the summary table
print(summary_table)



# New Join stuff

animals <- data.frame(
  stringsAsFactors = FALSE,
          location = c("lagoon", "bluff", "creek", "oaks", "bluff"),
           species = c("bobcat", "coyote", "fox", "squirrel", "bobcat"),
          maturity = c("adult", "juvenile", "adult", "juvenile", "adult")
)



sites <- data.frame(
  stringsAsFactors = FALSE,
          location = c("beach", "lagoon", "bluff", "oaks"),
    full_site_name = c("Goleta Beach","UCSB Lagoon",
                       "Ellwood Mesa","Fremont Campground"),
      jurisdiction = c("SB City", "UCSB", "SB City", "USFS")
)

#practice with full join
#kkeeps all rows and adds all columns
full_join_example <- full_join(animals, sites)


#left_join
left_join(animals,sites)


#right_join

right_join(animals, sites)


#inner join

inner_join(animals, sites)


#filtering joins

semi_join(animals, sites)

#same as
animals %>%
  filter(location %in% sites$location)



#anti join

anti_join(animals, sites)

#same as

animals %>%
filter(!location %in% sites$location)


anti_join(sites, animals)





#String manipulating

#practice with lubridate

my_date <- "03-13-1998"
lubridate::mdy(my_date) #fixed data to iso 8601

#new format based on the format of the date, you use that function
my_date <- "08-Jun-1974"
lubridate::dmy(my_date)

#another format
my_date <- "19160518"
lubridate::ymd(my_date)

#when it fails.... like a date that doesnt make sense
#the data is not in the right format for the function
lubridate::mdy("1942-08-30")

lubridate::dmy("09/12/84")



#workingh with date times

time <-"2020-08-12 11:18"
time <- ymd_hm(time)
#convert to pdt
with_tz(time, "America/Los_Angeles")

#extract info from the dates

week(time)
year(time)
day(time)
time_length()


start_time <- Sys.time()

end_time <- Sys.time()

end_time - start_time
