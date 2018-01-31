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
  
### What is the right K:
- Some idea by visualizing data.
- By increasing K, initially the cost may decrease, and may increase later
  - but this doesn't workf for all kinds of clusters and datasets.

### K-Means: Allows us to discover classes
- Life, constantly tries to find patterns.
- Motivation of K-Means.
  - If there are labels to be assigned. If there are categories inherent in data, then features must have different distribution.
