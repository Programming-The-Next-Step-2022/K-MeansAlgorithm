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
Select random K points or centroids. These points don't have to be inputs from the dataset, but can be randomly selected points. These are the initial centroids.

**Step 3**
Find the euclidean distance between the k points and the centroids. The function distance from the philentropy library is used for this calculation. (#or maybe code that function from scratch). 
 
**Step 4**
Find the nearset centroid for each datapoint. 

**Step 5**
Update the centroid location

**Step 6**
Repeat steps 3 till 5 till the centroids don't change anymore. 

## Required packages
readxl
dplyr
ggplot2



