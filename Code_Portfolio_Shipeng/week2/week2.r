## Import data
library(readr)
example1 <- read_csv("data/hourly_44201_2014.csv", 
                     col_types = "ccccinnccccccncnncccccc")

## check rows and columns
nrow(example1)
ncol(example1)

## check data
str(example1)

## check top/bot data
head(example1[, c(6:7,10)])
tail(example1[, c(6:7, 10)])
table(example1$status)

## dplyr package and functions like filter, select, arrange and so on
library(dplyr)
filter(ozone, Time.Local == "13:14") %>% 
  +         select(State.Name, County.Name, Date.Local, 
                   +                Time.Local, Sample.Measurement)


## check summary and quantile
summary(ozone$Sample.Measurement)
quantile(ozone$Sample.Measurement, seq(0, 1, 0.1))
