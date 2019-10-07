#### Answers and code for ABD problems (chapter-problem number):12-18,
# 12-20, 12-33, 13-21, 13-30

# Clean up the working environment
rm(list = ls())
# Verify working directory, should be ~/Documents/Analyses/lastname_first
getwd()

# Load tidyverse
library("tidyverse")
# Check for updates
tidyverse_update()

# To perform sign tests, install and load the package DescTools
install.packages("DescTools")
library("DescTools")

### Problem 12-18 ######
eyespan <- read_csv("datasets/abd/chapter12/chap12q18StalkieEyespan.csv")