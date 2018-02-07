# Challenges Faced Recently, updated reversely, mostly collection good papers and works

## 6. [Apache Sqoop](http://sqoop.apache.org/)
- First Stable Release: 2015. Top level Apache project

Ingest data from RDBMS (MySQL, Oracle etc) into HDFS. It is a commandline tool. Output in HDFS is a set of files containing a copy of the imported table or datasets. 

- Like batch type of data ingestion rather than the streaming/push sources. 

**[commands and definitions](http://sqoop.apache.org/docs/1.4.7/SqoopUserGuide.html#_connecting_to_a_database_server)**


## 5. Macrobase: Prioritizing Attention in Fast Data/ A Search Engine for Fast Data Streams
[A good video at Data Eng Conf](http://www.dataengconf.com/macrobase-a-search-engine-for-fast-data-streams)
- Motivation: User attention is limited. A lot of collected data is not used. Roughly only 6% of data is used by big companies.
- Developed a system, which can do basic transformation, classification and explanation over fast streams of data. Goal is to do this very very fast and show explanation to user.
- Did simple optimizations to improve performance:
  - To do PCA (Sample the data, as data is structured and repeatitive), 
  - Kernel density estimation (used only for classification) so use here error bounds, prune out all the unnecessary computation. 
  - Time Series Smoothing: challenge is what should be smoothing parameter. See high level trend. 
  
  - Published in: [SIGMOD 2017](http://www.bailis.org/papers/macrobase-sigmod2017.pdf), also presented at [CIDR 2017](http://cidrdb.org/cidr2017/slides/p103-bailis-cidr17-slides.pdf), and presented at [DataEngConf 2017](http://www.dataengconf.com/macrobase-a-search-engine-for-fast-data-streams)
  - Language used is Java, subset of operators are being transfered in C++, SQL support in future in C++. Future is in Python wrapper around it.
  - Internally data is in mini batches of windows. Configured accorinding to application specific needs.

## 4. [Don't optimize my query, optimize by data](http://www.dataengconf.com/dont-optimize-my-queries-optimize-my-data)
Talk on Apache Calcite. Query Optimizer, but it can do much more!!
- Apache Calcite: Is a top level apache project. 
  - Relational Algebra: explains the original query is same what we are finally executing. 
  - Calcite is more of like a library, that is used to built a database system. It can too run as standalone engine. Does nice job of doing federated queries. Can do queries on csv files, mongodb, cassandra. etc.
  - Main purpose is to power the optimizers of Hive, Streaming SQL in Apache Flink, Apache Beam. 
  - Talked about materialized view: It is a separate object holding data, which is result of the query. It is not a window anymore on the base table, and a refresh has to take place periodically which reflect changes in the base table. The updates on materialized view have a lag.

## 3. INGESTBASE: A Declarative Data Ingestion System, Arxiv, Jan, 2017
[Paper](https://arxiv.org/pdf/1701.06093v1.pdf)

Declarative language to do ingestion logic on data and preprocessing, as data is ingested in the system. 


## 2. AdaptDB: Adaptive Partitioning for Distributed Joins by Samuel Madden, VLDB 2017
[Paper](http://jindal-web.appspot.com/papers/p589-lu.pdf)

Partitioning datasets across a cluster and incrementally refining data partitioning as queries are run. AdaptDB introduces a novel hyper-join that avoids expensive data shuffling by identifying storage blocks of the joining tables that overlap on the join attribute, and only joining those blocks. Hyper-join performs well when each block in one table overlaps with few blocks in the other table, since that will minimize the number of blocks that have to be accessed.

## 1. Snorkel: Dark Data and Machine Learning: by Christopher Ré VLDB 2017
[Paper](http://www.vldb.org/pvldb/vol11/p269-ratner.pdf), [Talk](https://www.youtube.com/watch?v=yu15Nf5eJEE), [Web](http://snorkel.readthedocs.io/en/master/)
- Deploying ML still require a PhD.
  - User struggle to write good feature.
  - Production of dataset is very difficult
  - Label all the training data.
  - Training Data is the New New OIL.
- Goal of Project: Create training data heuristically.
  - Past: Create structured data from unstructured text data. Takes a lot of time to do this.
- Background 
  - CS210 [Video: Christopher Re Deep Dive](https://www.youtube.com/watch?v=vNwAlR--Krk)
  - [Video: Introduction to Snorkel](https://www.youtube.com/watch?v=pXoiYSQHf2I&feature=youtu.be)
  - [Snorkel Workshop on Github](https://github.com/HazyResearch/snorkel/tree/master/tutorials/workshop)
  - [Peter Bailis: MacroBase, Prioritizing Attention in Fast Data Streams | Talks at Google](https://www.youtube.com/watch?v=XhTJEU_l8rw)
