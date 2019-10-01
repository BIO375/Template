### Lab 5. t-distribution and t-tests

# Clean up the working environment
rm(list = ls())
# Verify working directory, should be ~/Documents/Analyses/lastname_first
getwd()

# Load tidyverse
library("tidyverse")
# Check for updates
tidyverse_update()

# Read in data file, generic version
#<name-you-assign><-read_csv("path-to-file", col_names = TRUE)

### One sample t-test ###
# Option 1
# The function pt() calculates the probability of t less than or equal to a sample value.  Note that this is 
# annoyingly the opposite of what a t-table does.  C'est la vie.

# First step, calculate t_sample.  You will need to define what the sample mean, null hypothesis mean, sample 
# standard deviation, and sample size are.  
null_mean <- 0

# If you are given the values for the sample mean, sd, and n, you can simply define each value as an object 
# in the environment
sample_mean <- 39.3
sample_sd <- 30.7
sample_n <- 31
df <- sample_n -1

# If you are given raw data, read in the data file and define each summary statistic with a simple equation
# Note: you can't use summarise here because it will create a table instead of named objects.

# Read in data
range_shift <- read_csv("datasets/abd/chapter11/chap11q01RangeShiftsWithClimateChange.csv")

# Identify your response variable using the form dataset$variable_name
y<-range_shift$elevationalRangeShift

# Calculate summary statistics
sample_mean <-mean(y)
sample_sd <- sd(y)
sample_n <- as.numeric(length(y))
df <- sample_n -1

# Whether you are given the values for mean/sd/n or calculate them, your next step is calculating t_sample
t_sample <- (sample_mean - null_mean)/(sample_sd/sqrt(sample_n))

# The value I call "negative tail" is the exact probability of obtaining t less than or equal to your t-sample
# If you are testing an alternate hypotheses of "sample mean is less than a certain number" then this is your
# p-value
negative_tail <- pt(t_sample, df)

# If you are testing an alternate hypothesis of "sample mean is greater than a certain number" then you have
# to calculate 1 - negative_tail.
positive_tail <- 1 - negative_tail

# For a two-sided test, the exact probability of obtaining t equal to t_sample or more extreme is calculated
# as:
two_tailed <- 2*(1-pt(abs(t_sample), df))

# Option 2
# One-sample t-test can be calculate using t.test. 
# The mu argument gives the value stated in the null hypothesis.

# The code below ASSUMES that you have read in the data file
# Now you have to specify which dataset the values are coming from using the form dataset$variable_name.

# Two-sided
t.test(range_shift$elevationalRangeShift, 
       alternative = "two.sided", mu = 0, conf.level = 0.95)

# One-sided, HA that sample mean is greater than null mean
t.test(range_shift$elevationalRangeShift, 
       alternative = "greater", mu = 0, conf.level = 0.95)

# One-sided, HA that sample mean is less than null mean
t.test(range_shift$elevationalRangeShift, 
       alternative = "less", mu = 0, conf.level = 0.95)


### Paired t-test ###
# Start with a dataset in untidy format (groups not defined by a categorical variable, two observations (or 
# more) in each row.  Later you will use this untidy dataset to perform the statistical test.
untidy_blackbird <- read_csv("datasets/abd/chapter12/chap12e2BlackbirdTestosterone.csv")

# Begin by exploring the data with histograms, boxplots, and q-q plots
# Since the assumptions of normality apply to differences, use mutate() to add a column called diff.
# Note that here diff = After - Before

untidy_blackbird <- mutate(untidy_blackbird, diff = afterImplant - beforeImplant)


ggplot(tidy_blackbird) +
  geom_histogram(aes(antibody), binwidth = 2)+
  facet_wrap(~ZONE)


# Two-sided
# There are (at least) two methods for paired t-tests.  The first is a one sample t-test on the differences, 
# using the function pt().
# The second uses the function t.test().  Unlike using t.test() for a one sample t-test, a two sample t-test
# specifies each group (i.e., before and after), does not take the argument mu = , and takes the argument 
# paired = TRUE.

# Note that the confidence intervals are for the mean difference.
t.test(untidy_blackbird$afterImplant, untidy_blackbird$beforeImplant, 
       alternative = "two.sided", paired = TRUE, conf.level = 0.95)

# One-sided, HA that afterImplant is greater than beforeImplant
t.test(untidy_blackbird$afterImplant, untidy_blackbird$beforeImplant, 
       alternative = "greater", paired = TRUE, conf.level = 0.95)

# One-sided, HA that afterImplant is less than beforeImplant
t.test(untidy_blackbird$afterImplant, untidy_blackbird$beforeImplant, 
       alternative = "less", paired = TRUE, conf.level = 0.95)


  
# There are (at least) two ways to perform a paired t-test.  In order to make option B work, your data need
# to be in "untidy format"



