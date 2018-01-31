# Unsupervized Learning	


## K-Means

- Write xi = (xi1,..xip)
- Let centroids be denoted by m1,m2,m3....mk and the clusters by c1,c2...ck. Then the objective of k-means is:
  - Minimize the distance of the cluster from the centroid.
- Algorithm:
  - Randomly initialize the K cluster.
  - Iterate until convergence:
    - For each data pointm find the closest cluster center (Partitioning step)
    - Replace each centroid by average of data points in its partition.
  - Proposed in 1950's.
  - Most frequently used clustering algorithm.
  
