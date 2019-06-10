## week11
## simulate data
set.seed(19)
x <- rnorm(30)
y <- rnorm(30)
plot(x, y, col = rep(1:3, each = 10), pch = 19)
legend("bottomright", legend = paste("Group", 1:3), col = 1:3, pch = 19, bty = "n")

## using image() function 
par(mfrow = c(1, 2))
image(volcano, col = heat.colors(10), main = "heat.colors()")
image(volcano, col = topo.colors(10), main = "topo.colors()")

## use colorRamp to mix
pal <- colorRamp(c("red", "blue"))

## use colorRampPalette() function
pal <- colorRampPalette(c("red", "yellow"))

## use rgb() function
rgb(0, 0, 234, maxColorValue = 255)

## use RColorBrewer library
library(RColorBrewer)
display.brewer.all()

## smoothScatter() function
set.seed(1)
x <- rnorm(10000)
y <- rnorm(10000)
smoothScatter(x, y)


