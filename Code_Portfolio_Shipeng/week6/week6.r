## Week6
## Compute the mean, trimmed mean and median
state <- read.csv(file="/Users/andrewbruce1/book/state.csv")
mean(state[["Population"]])
mean(state[["Population"]], trim=0.1)
median(state[["Population"]])


## calculate weighted mean and weighted median
weighted.mean(state[["Murder.Rate"]], w=state[["Population"]])
library("matrixStats")
weightedMedian(state[["Murder.Rate"]], w=state[["Population"]]
               
## calculate quantile
quantile(state[["Murder.Rate"]], p=c(.05, .25, .5, .75, .95))

## draw boxplot
boxplot(state[["Population"]]/1000000, ylab="Population (millions)")

## Show frequency table
breaks <- seq(from=min(state[["Population"]]),
              to=max(state[["Population"]]), length=11)
pop_freq <- cut(state[["Population"]], breaks=breaks,
                right=TRUE, include.lowest = TRUE)
table(pop_freq)

## draw density plot
hist(state[["Murder.Rate"]], freq=FALSE)
lines(density(state[["Murder.Rate"]]), lwd=3, col="blue")

## draw bar plot
barplot(as.matrix(dfw)/6, cex.axis=.5)

## draw corrplot 
etfs <- sp500_px[row.names(sp500_px)>"2012-07-01",
                 sp500_sym[sp500_sym$sector=="etf", 'symbol']]
library(corrplot)
corrplot(cor(etfs), method = "ellipse")

## draw scatterplot
plot(telecom$T, telecom$VZ, xlab="T", ylab="VZ")

## draw finished square feet plot
ggplot(kc_tax0, (aes(x=SqFtTotLiving, y=TaxAssessedValue))) +
  stat_binhex(colour="white") +
  theme_bw() +
  scale_fill_gradient(low="white", high="black") +
  labs(x="Finished Square Feet", y="Tax Assessed Value")

## draw geom density plot
ggplot(kc_tax0, aes(SqFtTotLiving, TaxAssessedValue)) +
  theme_bw() +
  geom_point( alpha=0.1) +
  geom_density2d(colour="white") +
  labs(x="Finished Square Feet", y="Tax Assessed Value")

## draw geom violin
ggplot(data=airline_stats, aes(airline, pct_carrier_delay)) +
  ylim(0, 50) +
  geom_violin() +
  labs(x="", y="Daily % of Delayed Flights")

## visualize multiple variables
ggplot(subset(kc_tax0, ZipCode %in% c(98188, 98105, 98108, 98126)),
       aes(x=SqFtTotLiving, y=TaxAssessedValue)) +
  stat_binhex(colour="white") +
  theme_bw() +
  scale_fill_gradient( low="white", high="blue") +
  labs(x="Finished Square Feet", y="Tax Assessed Value") +
  facet_wrap("ZipCode")
