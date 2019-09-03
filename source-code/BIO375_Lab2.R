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
data<-read_csv("datasets/demos/2019-09-02_class-data.csv",col_names = TRUE,
               col_types = cols(
  name = col_character() )
)

# Generate summary statistics
summary(data)

# Plot height as a histogram
ggplot(data)+
  geom_histogram(aes(height), binwidth = 10)

# Plot right arm length as a histogram
ggplot(data)+
  geom_histogram(aes(right_arm), binwidth = 5)

# Note that you must have the column name exactly correct.  Try, for example,
# the following code
ggplot(data)+
  geom_histogram(aes(right arm), binwidth = 10)

# Look at the help file for geom_boxpolot
help("geom_boxplot")

# Plot height as a boxplot
ggplot(data)+
  geom_boxplot(aes(x = "", y = height), notch = TRUE, varwidth = TRUE)

# Plot height as a three boxplots, one for each hair color
ggplot(data)+
  geom_boxplot(aes(x = hair_color, y = height), notch = TRUE, varwidth = TRUE)

### Assignment

# Load a larger dataset, lovett.csv, and assign the name data2.
# Dataset found at datasets/quinn/chpt2/lovett.csv
# Enter your code below



# Calculate summary statistics for SO4 and SO4MOD
# Enter your code below



# Calculate variance and standard deviation for SO4 and SO4MOD

# Plot histograms of DOC and Modified DOC with appropriate bin sizes
# To generate a Modified DOC histogram, you will need to execute the following code

data3 -> data2 %>%
  filter(STREAM != Santa_Cruz)



