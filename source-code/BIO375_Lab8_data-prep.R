# Cleaning some Tilman data for Lab 8

# Package ID: knb-lter-cdr.273.9 Cataloging System:https://pasta.edirepository.org.
# Data set title: Plant aboveground biomass data: Biodiversity II:  Effects of Plant Biodiversity on Population and Ecosystem Processes.
# Data set creator:  David Tilman -  
# Metadata Provider:    - Cedar Creek LTER 
# Contact:  Dan Bahauddin - Information Manager Cedar Creek Ecosystem Science Reserve  - webmaster@cedarcreek.umn.edu
# Stylesheet v1.3 for metadata conversion into program: John H. Porter, Univ. Virginia, jporter@Virginia.edu 
#
#install package tidyverse if not already installed
if(!require(tidyverse)){ install.packages("tidyverse") }  
library("tidyverse") 

bdII_abovegr_biomass <- read_csv("datasets/demos/bdII_abovegr-biomass.csv", 
                                 col_types = cols(Date = col_skip(), Note = col_skip(), 
                                                   Plot = col_character(), 
                                                  Substrip = col_skip()))

bdef <- bdII_abovegr_biomass %>%
  rename(biomass = "Biomass (g/m2)") %>%
  filter(Year == 2000) %>%
  select(Plot, NumSp, biomass) %>%
  group_by(NumSp, Plot) %>%
  summarise(sum(biomass)) %>%
  filter(NumSp != 0) %>%
  rename(biomass = "sum(biomass)")

write_csv(bdef, "datasets/demos/bdef.csv")



