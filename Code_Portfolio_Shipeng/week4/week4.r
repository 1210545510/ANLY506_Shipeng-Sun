## week4 code portfolio
## tidyverse package and functions

library(tidyverse)
heights <- read_csv("data/heights.csv")

## parse vector
str(parse_logical(c("TRUE", "FALSE", "NA")))
str(parse_integer(c("1", "2", "3")))
parse_double() and parse_number()
parse_character()
parse_factor()
parse_datetime(), parse_date() and parse_time()

## use problems() to get failures complete set
problems(x)

## get at the underlying representation of a string using charToRaw()
charToRaw("Hadley")

## find the corect encoding
x1 <- "El Ni\xf1o was particularly bad this year"
parse_character(x1, locale = locale(encoding = "Latin1"))
guess_encoding(charToRaw(x1))

## find correct type
guess_parser("2010-10-01")
guess_parser(c("TRUE", "FALSE"))

## read and write csv
write_csv(challenge, "challenge.csv")
read_csv("challenge-2.csv")

## write and read RDS
write_rds(challenge, "challenge.rds")
read_rds("challenge.rds")

## feature package
library(feather)
write_feather(challenge, "challenge.feather")
read_feather("challenge.feather")

