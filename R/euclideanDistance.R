# euclidean distance function


##



euclideanDistanceKClusters <- function(myPoints, centroids){
  distance = cbind((myPoints[,1] - centroids[1,1]), (myPoints[,2] - centroids[1,2]))
  distance = distance^2
  eucledianDistance = sqrt(distance)
  return(eucledianDistance)
}

#check of het werkt
#ED <- euclideanDistanceKClusters(myPoints[1,], centroids[1,])


#myPoints[1,]
#centroids[1,]


#euclideanDistance = sqrt(sum((myPoints[1,] - centroids[1,])^2))
#euclideanDistance

