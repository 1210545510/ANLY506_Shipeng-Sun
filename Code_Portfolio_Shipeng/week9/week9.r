## Week 9
## Visualizing distribution
ggplot(data = diamonds) +
  geom_bar(mapping = aes(x = cut))

## count number of observations
diamonds %>% 
  count(cut)

## examine the distribution of a continuous variable
ggplot(data = diamonds) +
  geom_histogram(mapping = aes(x = carat), binwidth = 0.5)

## combine
diamonds %>% 
  count(cut_width(carat, 0.5))

## set width of histogram
smaller <- diamonds %>% 
  filter(carat < 3)

ggplot(data = smaller, mapping = aes(x = carat)) +
  geom_histogram(binwidth = 0.1)

## overlay multiple histograms in the same plot
ggplot(data = smaller, mapping = aes(x = carat, colour = cut)) +
  geom_freqpoly(binwidth = 0.1)

## user coord_vartesian to see unusual values
ggplot(diamonds) + 
  geom_histogram(mapping = aes(x = y), binwidth = 0.5) +
  coord_cartesian(ylim = c(0, 50))

## Missing values
## drop the entire row with the strange value
diamonds2 <- diamonds %>% 
  filter(between(y, 3, 20))

## replace unusual values with NA
diamonds2 <- diamonds %>% 
  mutate(y = ifelse(y < 3 | y > 20, NA, y))

## Using geom boxplot to see distribution
diamonds2 <- diamonds %>% 
  mutate(y = ifelse(y < 3 | y > 20, NA, y))

## use class to see trend
ggplot(data = mpg) +
  geom_boxplot(mapping = aes(x = reorder(class, hwy, FUN = median), y = hwy))

## flip the plot 90 degree
ggplot(data = mpg) +
  geom_boxplot(mapping = aes(x = reorder(class, hwy, FUN = median), y = hwy)) +
  coord_flip()

## To visualise the covariation between categorical variables
ggplot(data = diamonds) +
  geom_count(mapping = aes(x = cut, y = color))

## visualize with geom_tile() and the fill aesthetic
diamonds %>% 
  count(color, cut) %>%  
  ggplot(mapping = aes(x = color, y = cut)) +
  geom_tile(mapping = aes(fill = n))

## draw scatterplot with geom_point() to see distribution
ggplot(data = diamonds) +
  geom_point(mapping = aes(x = carat, y = price))

## Use alpha aesthetic to add transparency
ggplot(data = diamonds) + 
  geom_point(mapping = aes(x = carat, y = price), alpha = 1 / 100)

## use geom_bin2d() and geom_hex() to bin in two dimensions.
ggplot(data = smaller) +
  geom_bin2d(mapping = aes(x = carat, y = price))

# install.packages("hexbin")
ggplot(data = smaller) +
  geom_hex(mapping = aes(x = carat, y = price))

## bin carat and then for each group, display a boxplot
ggplot(data = smaller, mapping = aes(x = carat, y = price)) + 
  geom_boxplot(mapping = aes(group = cut_width(carat, 0.1)))

## display approximately the same number of points in each bin

ggplot(data = smaller, mapping = aes(x = carat, y = price)) + 
  geom_boxplot(mapping = aes(group = cut_number(carat, 20)))

