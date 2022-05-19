### K-MeansAlgorithm
## Project for the course Programming: The Next Step
## Rolien 
## Master Brain and Cognitive Sciences - UvA

## Project description
This project contains a package in R, that allows data to be classified into clusters with k-means clustering.
# K-means clustering
K-means clustering is an unsupervised learning algorithm, which clusters data into different groups. K defines the number of predefined clusters. Each observation belongs to the cluster with the nearest mean. These means are also called cluster centers or cluster centroid. Each cluster is thus associated with a centroid. The aim of the K-means algorithm is to group data points into disctinct non-overlapping subgroups.

# K-means algorithm steps

**Step 1**
Select the number K to decide the number of clusters.

**Step 2**
Select random K points or centroids. These points are the initial centroids.

**Step 3**
Find the euclidean distance between the k points and the centroids. The following formula is used: sqrt(sum(a^2+b^2).
 
**Step 4**
Find the nearset centroid for each datapoint. This is done by selecting the column index with the smallest distance with the which.min function.

**Step 5**
Update the centroid location. In this step we calculate new centroids: by calculating the mean of all the values of the datapoints in a cluster.

**Step 6**
Repeat steps 3 till 5 till the centroids don't change anymore. 

## Required packages
readxl
dplyr
ggplot2



