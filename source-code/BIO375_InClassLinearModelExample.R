#### Quick for class on ANOVA 
# Clean up the working environment
rm(list = ls())
# Verify working directory, should be ~/Documents/Analyses/lastname_first
getwd()

# Load tidyverse
library("tidyverse")
# Check for updates
tidyverse_update()

flowers <- read_csv("datasets/r4all/FlowerColourVisits.csv")

# untidy_flowers <- flowers %>%
#   spread(colour, number.of.visits, )

summ_number.of.visits <- flowers %>%
  group_by(colour) %>% 
  summarise(mean_number.of.visits = mean(number.of.visits),
            sd_number.of.visits = sd(number.of.visits),
            n_number.of.visits = n())

# Calculate the ratio between the standard deviations as a loose test of homoscedasticity
ratio <-(max(summ_number.of.visits$sd_number.of.visits))/(min(summ_number.of.visits$sd_number.of.visits))

# Look at histograms, box plots, q-q plots
ggplot(flowers) +
  geom_histogram(aes(number.of.visits), binwidth = 10)+
  facet_wrap(~colour)

ggplot(flowers) +
  geom_boxplot(aes(x = colour, y = number.of.visits))

ggplot(flowers)+
  geom_qq(aes(sample = number.of.visits, color = colour))

model01<-lm (number.of.visits ~ colour, data = flowers)
summary.aov(model01)
summary(model01)

# Plot residuals ####
library(ggplot2)
ggplot(model01) + 
  geom_point(aes(x=.fitted, y=.resid))
