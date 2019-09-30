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
# The function pt() calculates the probability of t less than or equal to a sample value.  Note that this is 
# annoyingly the opposite of what a t-table does.  C'est la vie.

# First step, calculate t_sample.  You will need to define what the sample mean, null hypothesis mean, sample standard 
# deviation, and sample size are.  

sample_mean <- 67
null_mean <- 65
sample_sd <- 5
sample_n <- 18
df <- sample_n -1

# Calculate t_sample
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

### Paired t-test ###
# Start with a dataset in tidy format (each variable in its own column, each observation in its own row).  
# Tidy data will be easier to graph, even though it makes the code for calculating differences more complex.
# Additionally, tidy data are necessary for more complex stats, so might as well start like we want to go on

# There are (at least) two ways to perform a paired t-test.  In order to make option B work, your data need
# to be in "untidy format"



