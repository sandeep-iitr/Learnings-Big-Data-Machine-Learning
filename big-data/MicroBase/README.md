# Paper in SIGMOD 2017

## Novelties
- A new reservoir sampler and Heavy-hitters sketch specialized for fast data
- Maximize the utility of each result being shown.
- A search engine to help identify the most relevant data and trends.

## Today
- A range of scalable analysis pipelines can be developed to compute over fast data
- However, the actual implementation is upto application developer.
- Requirements: 
  - Determine few results to return to user
  - Executing quickly to keep up with immense data volumes.
  - Adapting to changes within the data stream itself
  
 - Challenge:
   - Require expertise in domain, statistics, ML and data flow processing.
   - Such a combination is rare.
   
 ## MacroBase Core Challenges and Contributions
 - Several Algorithmic advances as core research challenges
 - Novel stream sampler: Adaptable Damped Reservoir, which performs sampling over arbitrarily sized exponentially damped wondows.
 - Adopts work from previous paper on exponentially weighted sketching and streaming data structures\[27,76\] to track correlations between attribute value pairs, improving responsiveness and accuracy in explanation
 
 
## Sample usecases
- Mobile applications monitoring
- Datacenter operation monitoring
- Industrial monitoring

## 3.1 Core Concepts
Priorize attention using fast classification and explanation
- Classification: Classify individual data point
- Explanation: Group and aggregate multiple data points. Each result can represent many individual classification outputs, further prioritizing attention. 

A small number of optimized, composable operators that can execute across domains.

## 3.2 System Architecture
### Query pipelines
- Query specifies: A set of input data sources. as well as logical query plan or pipeline of streaming operators. A high level syntax is there to specify different stages of query processing pipeline.

### 1. Ingestion
- Initial ingestion should perfrom any necessary stream ordering and joins.
- Data contains metrices (values like trip time, battery drain) and attributes( user ID and device ID). Abonormal events are detected using metrices and attributes are used to explain behavior. In this paper the target is metrices with real values and attributes are categorical. **Today selecting attributes, metrices and a pipeline is a user-initiated process, paper in section 8 seek to automate this!!**

### 2. Feature-Transformation
Domain specific transformations like: windowing, autocorrelation, Statistical Operations: frequency analysis, normalization and dimensionality reduction. 
- This helps to encode domain specific analysis without modifying later stages.
- The base type of stream is unchanged: (Point --> Point)

### 3. Classification
- Training and evaluation of classifiers is done on the matrices in incoming data stream.
- A range of models is supported: rule based models (L-2 is greater than a fixed constant), unsupervized models: perform density based classification into outliers and inliers.
- Each classifier returns a stream of labeled Point outputs (Point --> (label,Point))

### 4. Explanation
- Generates explanation rather than returning all the labelled data points.
- Default pipeline returns explanation in the form of attribute-value combination, that are common in outlier points but not common in inliers
- Each explanation operator return a stream of these aggregates ((label,point)-->Explanation)
- Emits explanation at user request or at a periodic granularity. 

