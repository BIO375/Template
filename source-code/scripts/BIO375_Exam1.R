### Exam 1, Fall 2019

# Young et al. 2004
library(tidyverse)

# Read in file and get rid of NA on line 105
data01 <- read_csv("datasets/abd/chapter12/chap12e3HornedLizards.csv")
data01 <- data01 %>%
  slice(-105)


# Summary statistics
summ_young <- data01 %>%
  group_by(Survival) %>% 
  summarise(n = n(),
            mean = mean(squamosalHornLength),
            median = median(squamosalHornLength),
            IQR = IQR(squamosalHornLength),
            var = var(squamosalHornLength),
            sd = sd(squamosalHornLength),
            se = sd(squamosalHornLength)/sqrt(length(squamosalHornLength)))

# Bar plot with SE 
ggplot(summ_young, aes (x = Survival, y = mean)) +
  geom_bar(stat = "identity") +
  geom_errorbar(aes(ymin = mean - se, ymax = mean + se, width = 0.2)) +
  scale_y_continuous(expand = c(0,0)) +
  scale_fill_grey() +
  labs( x = "Survival", y = "Horn Length (mm)") +
  theme_classic()

# Bar plot with SD
ggplot(summ_young, aes (x = Survival, y = mean)) +
  geom_bar(stat = "identity") +
  geom_errorbar(aes(ymin = mean - sd, ymax = mean + sd, width = 0.2)) +
  scale_y_continuous(expand = c(0,0)) +
  scale_fill_grey() +
  labs( x = "Survival", y = "Horn Length (mm)") +
  theme_classic()
