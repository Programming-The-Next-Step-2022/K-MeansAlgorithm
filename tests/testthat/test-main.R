library('myKMeans')
library('testthat')


test_that("myKMeans euclidean distance", {
  myKMeans <- myKMeans(DF[1], KCluster = 2, KIterations = 2)
  #euclideanDistance[i,j] = sqrt(sum((DF[1, ] - centroids[1,])^2))
  expect_true(euclideanDistance == 4.472136)
})

### Question: I am struggling with the tests
test_that("myKMeans assigns datapoints to the KClusters", {
  KClusters <- 5
  expect_true(all(myKMeans$Cluster<5))
})

# Test if each datapoint is assigned to a single cluster
test_that("myKMeans assigns each datapoint to a single cluster", {

})

# Test if (one) of the clusters isn't empty

test_that("in myKmeans none of the clusters is empty", {

})
