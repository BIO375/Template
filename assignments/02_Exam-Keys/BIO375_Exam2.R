### Exam 2 ####

# Clean up the working environment
rm(list = ls())
# Verify working directory, should be ~/Documents/Analyses/lastname_first
getwd()

# Other ABD data
# install.packages("abd", repos="http://R-Forge.R-project.org")
library("abd")

# To perform sign tests, install and load the package DescTools
# install.packages("DescTools")
library("DescTools")

# Load tidyverse
library("tidyverse")
# Check for updates
tidyverse_update()


# Problem 7 ####
mole_rat <- read_csv("datasets/abd/review3/rev3q13MoleRatGenetics.csv")
model01 <- lm( H1F1alphaExpression ~ species, data = mole_rat)
summary.aov(model01)

# Problem 8 ####

# Problem 9 ####
baker <- read_csv("datasets/exams/baker.csv")
baker <- baker %>%
  mutate(diff = After - Before)
ggplot(baker) +
  geom_histogram(aes(diff), binwidth = .1)
ggplot(baker) +
  geom_boxplot(aes(x = "", y = diff))
ggplot(baker)+
  geom_qq(aes(sample = diff))

SignTest(baker$diff, 
         alternative = "greater", mu = 0, conf.level = 0.95)

# Problem 10 ####
algae <- AlgaeCO2

summ_growthrate <- algae %>%
  group_by(treatment) %>% 
  summarise(mean_growthrate = mean(growthrate),
            sd_growthrate = sd(growthrate),
            n_growthrate = n())
ratio <-(max(summ_growthrate$sd_growthrate))/(min(summ_growthrate$sd_growthrate))
ggplot(algae) +
  geom_histogram(aes(growthrate), binwidth = .5)+
  facet_wrap(~treatment)
ggplot(algae) +
  geom_boxplot(aes(x = treatment, y = growthrate))
ggplot(algae)+
  geom_qq(aes(sample = growthrate, color = treatment))
t.test(growthrate ~ treatment, data = algae, var.equal = TRUE, alternative = "two.sided", conf.level = 0.95)
