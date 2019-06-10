## Week10
## k-means clustering method
fa <- c(5,2,1,4)
fb <- c(5,5,4,2)
fm <- matrix(c(fa,fb), byrow=T, nrow=2)
dist(fm, method = "Manhattan")
dist(fm, method = "euclidean")

## kmeans with center
dataFrame <- data.frame(x, y)
kmeansObj <- kmeans(dataFrame, centers = 3)
names(kmeansObj)

## show cluster
kmeansObj$cluster

## make image plot using k-means clusters
par(mfrow = c(1, 2))
image(t(dataMatrix)[, nrow(dataMatrix):1], yaxt = "n", main = "Original Data")
image(t(dataMatrix)[, order(kmeansObj$cluster)], yaxt = "n", main = "Clustered Data")
