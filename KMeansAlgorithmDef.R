library(ggplot2)
library(ggrepel)
library(readxl)
library(dplyr)

# Import dataset
importData <- function(filename) {
  Data <- read_excel(filename)
}

myPoints <- importData("myDataSet.xlsx")
myPoints

## Step 1: Initialize K Clusters
KCluster = 2

## Step 2: Initialize centroids
# create random centroids from the dataset
centroid <- sample.int(dim(myPoints)[1],KCluster)
centroids <- myPoints[centroid,] 

# Make a plot of the points and the centroids
ggplot()+
  geom_point(aes(Vector1,Vector2), col = "blue", data = myPoints) +
  geom_point(aes(Vector1,Vector2), col = "red", data = centroids, size = 5, shape = 15) +
  labs(
    title = "Scatterplot of points and centroids",
    x = "",
    y ="") +
  theme_classic()

## Step 3: calculate the distance between the datapoints and the centroids via 
# the euclidean distance formula
# euclidean distance function

euclideanDistanceKClusters <- function(myPoints, centroids){
  distance = cbind((myPoints[,1] - centroids[1,1]), (myPoints[,2] - centroids[1,2]))
  distance = distance^2
  eucledianDistance = sqrt(distance)
  return(eucledianDistance)
}




# Function for the K means clustering algorithm

KMeansRolien <- function(myPoints, KClusters, KIterations){
  # create random centroids from the dataset and make a mastrix
  centroid <- sample.int(dim(myPoints)[1],KCluster)
  centroids <- data.matrix(myPoints[centroid,])
  # make a matrix of the dataset
  myPoints <- as.matrix(myPoints)
  # initialize the withing cluster sum of squares
  withinClusterSumSquares <- c()
  
  for(i in 1:KIterations){
    # initialize the euclidean distance
    euclideanDistance <- matrix(0, nrow = nrow(myPoints), ncol = KCluster)
    for(j in 1:KClusters)
    {
      for(i in 1:nrow(myPoints))
      {
        # QUESTION I want to call here my euclideanDistance function, but it doesn't work
        
        
        euclideanDistance[i,j] = sqrt(sum((myPoints[i,1:ncol(myPoints)] - centroids[j,1:ncol(centroids)])^2))
      }
    }
    ## Step 4: assign each datapoint to the nearest centroid
    # select the column index with the most smallest distance of the cluster
    # cluster for each observation: smallest distance to the observation
    cluster <- factor(apply(euclideanDistance, 1, which.min))
    euclideanDistanceCluster <- list()
    for (i in 1:KCluster){
      euclideanDistanceCluster[[i]] <- euclideanDistance[which(cluster == i),i]^2
    }
    # place to save the temporal within cluster sum of squares. 
    withinClusterSumSquaresSave <- unlist(lapply(euclideanDistanceCluster, sum))
    # final place cluster sum of squares
    # minimizing the squared euclidean distances between observation and assigned centroid:
    # is equal to the within cluster sum of squares
    withinClusterSumSquares <- append(withinClusterSumSquaresSave, withinClusterSumSquares)
    
    ## Step 5 Calculate new centroids
    # generate new centroids: mean of all the values of the observations in a cluster
    newCentroids <- myPoints %>%
      as.data.frame() %>%
      cbind(Clusters = cluster) %>%
      group_by(Clusters) %>%
      summarise_all(mean)
    # make a matrix
    centroids <- as.matrix(newCentroids[,-1])
  }
  
  withinClusterSumSquares <- t(array(withinClusterSumSquares, dim = c(KCluster, KIterations)))
  return(list(Cluster = cluster,
              withinClusterSumSquares = withinClusterSumSquares))
}

## Step 6: repeat step 3 till 5: step 6 is done bij the use of the function and the
# KIterations
 
## Initialize Iterations and call function
KIterations = 10


KMeansRolien <- KMeansRolien(myPoints, KCluster, KIterations) 
KMeansRolien

## Plot datapoints and centroids again but now with the clusters
##  QUESTION: This doesn't work: I want to plot the different colors in clusters
ggplot()+
  geom_point(aes(Vector1,Vector2), col = "blue", data = myPoints) +
  geom_text(aes(label = KCluster, color = KMeansRolien$Cluster)) +
  theme_classic()


 



  

