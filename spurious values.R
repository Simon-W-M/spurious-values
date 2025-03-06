###############################
# testing for spurious values #
###############################
library(dplyr)

# little issue I had trying to identify dodgy results from my analysis
# in this I meanit was a mix of NaN, NA and Inf
# started building tests for each one and then came across a little base R 
# function that did it all in one go

df <-data.frame(
  stringsAsFactors = FALSE,
              data = c(0, 1, NaN, NA, Inf)
)

# double check the class of the column
class(df$data)

# as you can seem if we ant todo anycalculations on this column
# it will send us into  world of annoyance
summary(data)

# so lets check for the NA
df <- df |>
  mutate(is_na = is.na(data))

# and the NaN
df <- df |>
  mutate(is_nan = is.nan(data))

# and the infinite
df <- df |>
  mutate(is_infinite = is.infinite(data))

# so lets spin that one around and check for finites
df <- df |>
  mutate(is_finite = is.finite(data))

# worth noting that 0 is a finite number

# also a quick demo if you have characters
df <-data.frame(
  stringsAsFactors = FALSE,
  data = c(0, 1, 'a', NaN, NA, Inf)
)

df <- df |>
  mutate(is_na = is.na(data))

df <- df |>
  mutate(is_nan = is.nan(data))

df <- df |>
  mutate(is_infinite = is.infinite(data))

df <- df |>
  mutate(is_finite = is.finite(data))

# basically only NA coe through in character tyes
# all the others get converted and treated as a string

# R will always try to coerece to the most reasonable data type

# if we use the as.numeric function it does a pretty good gob at 
# converting back into original format

df <- df |>
  mutate(data_converted = as.numeric(data),
         is_na = is.na(data_converted),
         is_nan = is.nan(data_converted),
         is_infinite = is.infinite(data_converted),
         is_finite = is.finite(data_converted))

# note: it does give a warning when converting a pure string into
#       a numeric and converts to NA