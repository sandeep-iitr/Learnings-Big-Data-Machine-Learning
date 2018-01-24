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
Design goals: 
- User can add a new domain specific feature transformations to the start of a pipeline without specifying modifying rest of the pipeline.
- Users can input rules or labels to perform supervized classification
- Users can write new pipelines: With feature transformation, classification and explanation operators. It requires time.
- default 

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

### 5. Presentation
- Rank statistics specific to the explanation before presentation.
- Static report rendered via Rest API or GUI

### Operating modes
- 1. User interactively explore data by configuring different inputs and selecting different combinations of metrics and attributes.
- 2. Execute one shot queries that can be run programmatically in a single pass over the data.
- 3. Execute streaming queries over infinite stream of data. 

## 4. MicroBase (MDP)Classification
### 4.1 Robust Distribution Estimation
- Traditional approach Z-Score of a point (number of standard deviations away this point lie away from mean): Is not safe, one outlier can affect the mean of the sample and thus can effect the z score. 
- To address this: MDP uses robust statistical estimation: where assumption is most of the data is well behaved but may contain a number of ill behaved points. For univariate data, an alternative to Z-score is to use median and median absolute deviation (MAD) instead of mean and standard deviation. Reason: Median is resistant to outliers. In multivariate too paper uses an approach. Shows in graph that z score is not so robust, and MAD and others are robust.
- There is possibilty of using other more sophisticated detectors (which are discussed in Appendix D).

### 4.2 MDP Streaming Execution

#### Adaptable damped reservoir (ADR)
Solution to retraining problem, as distributions within data streams change over time.
- ADR is novel adaptation of reservoir sampler. 
- MDP maintains an ADR sample of the input to periodically recompute its robust estimator and a second ADR sample of the outlier scores to periodically recompute its quantile threshold. 
- Need to maintain a sample of values, we will add new points with some probabilitity, and insertion of tuple can be decided by both time based and tuple based delay policies.

MDP uses ADR to solve model retraining and quantile estimation problems.

#### Maintaing training inputs
- Retrains model based on content of the ADR.

#### Maintaing percentile thresholds
- Check it again, it is important




