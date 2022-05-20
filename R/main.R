### Project Programming: The Next Step
### Rolien van de Geer
### Master Brain and Cognitive Sciences
### University of Amsterdam

# Read dataset
DF <- read_excel("myDataSet.xlsx")

## Step 1: Initialize K Clusters
KCluster = 2

## Step 2: Initialize centroids
# create random centroids from the dataset
centroid <- sample.int(dim(DF)[1],KCluster)
centroids <- DF[centroid,]

# Make a plot of the points and the centroids
ggplot() +
  geom_point(aes(Vector1, Vector2), col = "blue", data = DF) +
  geom_point(aes(Vector1, Vector2), col = "red", data = centroids, size = 5, shape = 15) +
  labs(
    title = "Scatterplot of points and centroids",
    x = "x",
    y = "y") +
  theme_classic()
# Function for the K means clustering algorithm
#' Clusters data points into distinct non-overlapping clusters.
#'
#' The function \emph{myKMeans} clusters datapoints into distinct non-over
#' lapping clusters.
#'@export
#'
#'@param centroid Takes random numbers from the datapoints. Gives the created
#'                centroids as integers. Length: 1 to the length of the dataset.
#'@param centroids Makes a matrix of the selected centroids.
#'@param DF This is the dataset with the datapoints.
#'@param withinClusterVariances The within cluster variances. Is equal to the
#'                              squared euclidean distances between the
#'                              datapoits and the assigned centroids.
#'@param euclideanDistance Finds the euclidean distance between the k points
#'                         and the centroids. The following formula is used:
#'                         sqrt(sum(a^2+b^2). The distances are stored as a list.
#'@param cluster Selects the most smallest distance of the column index with
#'               the build-in which.min function and stores is as a factor.
#'@param euclideanDistanceCluster Assigns the euclidean distances to a cluster.
#'@param withinClusterVariances Within cluster variances is equal to squared
#'                              euclidean distances. Gives a matrix with these
#'                              variances.
#'@param newCentroids Generates the new centroids based on the means of all the
#'                    values of the datapoints in a cluster.
#'
#'@return A list with the number of the cluster assigned to the datapoints and a
#'matrix with the within cluster variances.
#'
#'@details For more details on K Means Clustering, see the Wikipedia
#'page \url{https://en.wikipedia.org/wiki/K-means_clustering} for more details.
#'
#'@examples KM <- myKMeans(myPoints, KCluster = 2, KIterations = 10)
#'
#'
#'@export
myKMeans <- function(DF, KClusters, KIterations){
  # create random centroids from the dataset and make a mastrix
  centroid <- sample.int(dim(DF)[1],KCluster)
  centroids <- data.matrix(DF[centroid,])
  # make a matrix of the dataset
  myPoints <- as.matrix(DF)
  # initialize the withing cluster Variances
  withinClusterVariances <- c()
  for(i in 1:KIterations){
    # initialize the euclidean distance
    euclideanDistance <- matrix(0, nrow = nrow(myPoints), ncol = KCluster)
    for(j in 1:KClusters)
    {
      for(i in 1:nrow(myPoints))
      {  ## Step 3: calculate the distance between the datapoints and the centroids via
         # the euclidean distance formula
         # QUESTION I want to call here my euclideanDistance function, but it doesn't work
        euclideanDistance[i,j] = sqrt(sum((myPoints[i,1:ncol(myPoints)] -
                                             centroids[j,1:ncol(centroids)])^2))
      }
    }
    ## Step 4: assign each datapoint to the nearest centroid
    # Selects the most smallest distance of the column index.
    cluster <- factor(apply(euclideanDistance, 1, which.min))
    euclideanDistanceCluster <- list()
    for (i in 1:KCluster){
      euclideanDistanceCluster[[i]] <- euclideanDistance[which(cluster == i),i]^2
    }
    # place to save the temporal within cluster variances.
    withinClusterVariancesSave <- unlist(lapply(euclideanDistanceCluster, sum))
    # final place cluster variances
    # minimizing the squared euclidean distances between observation and assigned centroid:
    # is equal to the within cluster variances
    withinClusterVariances <- append(withinClusterVariances, withinClusterVariancesSave)

    ## Step 5 Calculate new centroids
    # generate new centroids: mean of all the values of the observations in a cluster
    newCentroids <- DF %>%
      as.data.frame() %>%
      cbind(Clusters = cluster) %>%
      group_by(Clusters) %>%
      summarise_all(mean)
    # make a matrix
    centroids <- as.matrix(newCentroids[,-1])
  }

  withinClusterVariances <- t(array(withinClusterVariances, dim = c(KCluster, KIterations)))
  return(list(Cluster = cluster,
              withinClusterVariances = withinClusterVariances))
}

## Step 6: repeat step 3 till 5: step 6 is done bij the use of the function and the
# KIterations

## Initialize Iterations and call function
KIterations <- 7


myKMeans <- myKMeans(DF, KCluster, KIterations)
myKMeans


## Plot datapoints and centroids again but now with the clusters
##  QUESTION: This doesn't work: I want to plot the different colors in clusters
#ggplot() +
#  geom_point(aes(Vector1,Vector2), col = "blue", data = DF) +
#  geom_text(aes(label = KCluster, color = as.factor(cluster)) +
#              theme_classic





## Not forget this:

# if you use other packages you have to import them in the description

# more information: R packages





