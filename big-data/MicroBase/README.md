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


