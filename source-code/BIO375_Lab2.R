### Lab 2. Brief Introduction to RStudio

# Before anything else, verify that your environment is totally clear.
# This is important, because old objects can foul up the works
# Clean up the working environment
rm(list = ls())

# Verify working directory, should be ~/Documents/Analyses/lastname_first
getwd()

# At the beginning of a script, it is useful to make sure you have
# downloaded and installed all necessary packages

install.packages("tidyverse") 
# Note that this loads the following packages: ggplot2 purrr 
#   tibble dplyr tidyr stringr readr forcats
library("tidyverse")
# Check for updates
tidyverse_update()

# Create an object called x
x <- 3*4

# View x in the Console
x

# Read in the data file
read_csv("datasets/demos/2019-08-28_class-data.csv", )
