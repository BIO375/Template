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

# To simplify summary statistics, install and load the package summarytools
install.packages("summarytools")
library("summarytools")

### Problem 12-18 ######
eyespan <- read_csv("datasets/abd/chapter12/chap12q18StalkieEyespan.csv")

# a.
# Do the data meet the assumption of normality?  Check with plots.
ggplot(eyespan) +
  geom_histogram(aes(eyeSpan), binwidth = .1)+
  facet_wrap(~food)
ggplot(eyespan) +
  geom_boxplot(aes(x = food, y = eyeSpan))
ggplot(eyespan)+
  geom_qq(aes(sample = eyeSpan, color = food))
# Yes, the data are symmetrical (top & bottom whisker equal for each box) 
# and mostly linear q-q plots.

# Do the data meet the assumption of homogeneous variance?  Check ratio.
(eyespan_ratio <- 0.0812/0.00558) 
# No, the groups do not have equal variance.  Use Welch's t-test.

# b.
t.test(eyeSpan ~ food, data = eyespan, alternative = "two.sided",
       conf.level = 0.95)
# Eye spans in male stalk-eyed flies raised on a corn diet were larger 
# than eye spans of flies raised on a cotton diet (Welch's t-test,
# two-sided: t = 8.35, df = 26.57, P < 0.0001).

### Problem 12-20 ######
# Data are paired, n = 12
# Is assumption of normality met?
fish <- read_csv("datasets/abd/chapter12/chap12q20ElectricFish.csv")
summ_fish<-descr(fish)
fish <- mutate(fish, diff = speciesUpstream - speciesDownstream)
# Because n = 12, just do boxplot and q-q
ggplot(fish) +
  geom_boxplot(aes(x = "", y = diff))
ggplot(fish)+
  geom_qq(aes(sample = diff))
# Maybe a bit of right skew when you look at location of median line 
# within the box, but not terrible skew when you consider the length of
# top and bottom whiskers. Proceed with parametric  paired t-test

# Research question was "whether presence of tributaries affected local
# number fish species" so do a two-sided test.
t.test(fish$speciesUpstream, fish$speciesDownstream, 
       alternative = "two.sided", paired = TRUE, conf.level = 0.95)

# a.
# Mean difference: Upstream of tributaries had on average 1.83 fewer 
# fish species than downstream of tributaries (95% CI of difference:
# -3.95<mu<-0.280).

# b.
# There was no effect of tributary presence on the species richness of 
# electric fish (t = -1.910, df = 11, p = 0.083).









