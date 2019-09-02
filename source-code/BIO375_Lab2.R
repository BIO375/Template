### Lab 2. Brief Introduction to RStudio

# Before anything else, verify that your environment is totally clear.
# This is important, because old objects can foul up the works
# Clean up the working environment
rm(list = ls())

# Verify working directory, should be
getwd()

# At the beginning of a script, it is useful to make sure you have
# downloaded and installed all necessary packages

install.packages("tidyverse") 
# Note that this loads the following packages: ggplot2 purrr 
#   tibble dplyr tidyr stringr readr forcats
library("tidyverse")
# Check for updates
tidyverse_update()
