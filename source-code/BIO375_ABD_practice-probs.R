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
