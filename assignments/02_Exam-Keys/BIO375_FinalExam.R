### Final Exam 2019 ###
rm(list = ls())

library("DescTools")
library("ggfortify")
library("multcomp")
library("nlme")
library("broom")
library("ggmosaic")
library("epitools")
library("tidyverse")
tidyverse_update()

### Scenario 1 ####
insulation <- read_csv("datasets/final/insulation.csv")
model01 <- lm(heat_loss ~ leanness, data = insulation)
autoplot(model01)
ggplot(data = insulation)+
  geom_point(aes(x = leanness, y = resid(model01)))
summary(model01)
ggplot(data = insulation, aes(x = leanness, y = heat_loss)) +
  geom_point() +
  geom_smooth(method = "lm", level=0.95) +
  theme_bw()+
  labs( x = "Leanness Index", y = "Heat Loss")

### Scenario 2 ####
caffeine <- read_csv("datasets/final/caffeine.csv", col_types = cols(
  group = col_factor() ))
ggplot(caffeine) +
  geom_histogram(aes(half_life), binwidth = 2)+
  facet_wrap(~group)
ggplot(caffeine)+
  geom_qq(aes(sample = half_life, color = group))
ggplot(caffeine) +
  geom_boxplot(aes(x = group, y = half_life))

#multiple planned comparisons
model02 <- lm(half_life~group, data = caffeine)

planned <- glht(model02, linfct = 
                  mcp(group = c("male - norm_prog = 0",
                                "norm_prog - high_prog = 0")))
confint(planned)
summary(planned)

### Scenario 3 ####
davis <- read_csv("datasets/final/davis.csv")
model03 <-chisq.test(x = davis$observed, p = davis$expected_p)
model03
model03$expected

