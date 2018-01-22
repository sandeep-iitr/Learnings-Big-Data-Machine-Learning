# Challenges Faced Recently, updated reversely


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
