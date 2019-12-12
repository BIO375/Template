#### Lab 9: Correlation, Linear Regression #### 

# Clean up the working environment
rm(list = ls())
# Verify working directory, should be ~/Documents/Analyses/lastname_first
getwd()

library("ggfortify")
library("broom")
library("tidyverse")
tidyverse_update()


### Linear Regression ####
# # Peake data 
peake <- read_csv("datasets/quinn/chpt6/peake.csv")

model01 <- lm(SPECIES ~ AREA, data = peake)
autoplot(model01, smooth.colour = NA)

# The normal Q-Q plot is not terrific at the extreme quantiles so we will
# probably transform

ggplot(data = peake)+
  geom_point(aes(x = AREA, y = resid(model01)))

# The residuals look inversely related to area, probably too fan shaped to be acceptable.
# Try log transforming AREA

peake <- peake %>%
  mutate(logArea = log(AREA))
model02<-lm(SPECIES ~ logArea, data = peake)
ggplot(data = peake)+
  geom_point(aes(x = logArea, y= resid(model02)))

# That is much better.  Now we can look at the statistical results!
summary(model02)






