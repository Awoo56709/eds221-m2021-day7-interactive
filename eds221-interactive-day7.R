#importing libraries

library(tidyverse)
library(palmerpenguins)
library(lubridate)

bird_observations <- read_csv(here::here("data", "knb-lter-cap_256_9", "52_pp52_birds_1.csv"))
sites <- read_csv(here::here("data", "knb-lter-cap_256_9", "52_pp52_sites_1.csv"))
surveys <- read_csv(here::here("data", "knb-lter-cap_256_9", "52_pp52_surveys_1.csv"))
taxalist <- read_csv(here::here("data", "knb-lter-cap_256_9", "52_pp52_taxalist_1.csv"))

birds_subset <- bird_observations |>
  filter(species_id %in% c("BHCO", "RWBL")) |>
  filter(site_id %in% c("LI-W", "NU-C"))
