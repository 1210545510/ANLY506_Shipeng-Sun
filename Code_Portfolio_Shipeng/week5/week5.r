## Week5 
## basic dataframe operations

# Create a dataframe of boat sale data called bsale
bsale <- data.frame(name = c("a", "b", "c", "d", "e", "f", "g", "h", "i", "j"),
                    color = c("black", "green", "pink", "blue", "blue", 
                              "green", "green", "yellow", "black", "black"),
                    age = c(143, 53, 356, 23, 647, 24, 532, 43, 66, 86),
                    price = c(53, 87, 54, 66, 264, 32, 532, 58, 99, 132),
                    cost = c(52, 80, 20, 100, 189, 12, 520, 68, 80, 100),
                    stringsAsFactors = FALSE)

## Explore the bsale dataset:
head(bsale)     # Show the first few rows
str(bsale)      # Show the structure of the data
View(bsale)     # Open data in a new window
names(bsale)    # show names of columns
nrow(bsale)     # show numbers of rows

## Calculating statistics from column vectors
mean(bsale$age)       # calculate mean?
table(bsale$color)    # How many boats were there of each color?
max(bsale$price)      # What was the maximum price?

## Adding new columns
bsale$id <- 1:nrow(bsale)
bsale$age.decades <- bsale$age / 10
bsale$profit <- bsale$price - bsale$cost

## What was the mean price of green boats?
with(bsale, mean(price[color == "green"]))

## What were the names of boats older than 100 years?
with(bsale, name[age > 100])

## What percent of black boats had a positive profit?
with(subset(bsale, color == "black"), mean(profit > 0))

## Save only the price and cost columns in a new dataframe
bsale.2 <- bsale[c("price", "cost")]

## Change the names of the columns to "p" and "c"
names(bsale.2) <- c("p", "c")

## Create a dataframe called old.black.bsale containing only data from black boats older than 50 years
old.black.bsale <- subset(bsale, color == "black" & age > 50)

## creating matrices and dataframes
cbind(c(1, 2, 3, 4, 5),
      c("a", "b", "c", "d", "e"))
rbind(a, b, c)
matrix(data = 1:10,
       nrow = 5,
       ncol = 2)
survey <- data.frame("index" = c(1, 2, 3, 4, 5),
                     "sex" = c("m", "m", "m", "f", "f"),
                     "age" = c(99, 46, 23, 54, 23))

## Show the structure of the survey dataframe
str(survey)

## Slicing with [, ]

## Return row 1
df[1, ]
## Return column 5
df[, 5]
## Rows 1:5 and column 2
df[1:5, 2]

## Slicing with logical vectors
ToothGrowth.VC <- ToothGrowth[ToothGrowth$supp == "VC", ]
ToothGrowth.OJ.a <- ToothGrowth[ToothGrowth$supp == "OJ" &
                                  ToothGrowth$dose < 1, ]

## Slicing with subset()
subset(x = ToothGrowth,
       subset = len < 20 &
         supp == "OJ" &
         dose >= 1)

## tidy data example
# Compute rate per 10,000
table1 %>% 
  mutate(rate = cases / population * 10000)

# Compute cases per year
table1 %>% 
  count(year, wt = cases)

# Visualise changes over time
library(ggplot2)
ggplot(table1, aes(year, cases)) + 
  geom_line(aes(group = country), colour = "grey50") + 
  geom_point(aes(colour = country))

## together parameters generate the call to gather()
table4a %>% 
  gather(`1999`, `2000`, key = "year", value = "cases")

## Combine two tables into a single tibble
tidy4a <- table4a %>% 
  gather(`1999`, `2000`, key = "year", value = "cases")
tidy4b <- table4b %>% 
  gather(`1999`, `2000`, key = "year", value = "population")
left_join(tidy4a, tidy4b)

## Spread table
table2 %>%
  spread(key = type, value = count)

## Sepatating and uniting
table3 %>% 
  separate(rate, into = c("cases", "population"))
table5 %>% 
  unite(new, century, year)

## tidy data with multiple functions
who %>%
  gather(key, value, new_sp_m014:newrel_f65, na.rm = TRUE) %>% 
  mutate(key = stringr::str_replace(key, "newrel", "new_rel")) %>%
  separate(key, c("new", "var", "sexage")) %>% 
  select(-new, -iso2, -iso3) %>% 
  separate(sexage, c("sex", "age"), sep = 1)