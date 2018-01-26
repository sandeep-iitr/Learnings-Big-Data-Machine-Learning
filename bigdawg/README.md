# PolyStore

## 1.Intel Bigdawg
[Installation](http://bigdawg-documentation.readthedocs.io/en/latest/getting-started.html)

This installation is setting up polystore using docker container. 

- Collaborators: Brown Univ, MIT, Etc.
- Variety within data.
- Leave data in the storage engine that matches the data.
- Federated databases: Single query interface: SQL, IBM DB2.
- Parallel databases: Single table over multiple computing elements: SciDB, TeriData (Relational parallel database)
- Polystores: Design to simulate work with disaparate database engines. Support complete functionality of underlying database.

## 2. Bigdawg: big data working working
- Reference implementation of polystore database.
- High performance ingest and analytics.
- Support location transparency vs semantic completeness

## 3. BigDawg: Query & DataModel
- Concept of Islands: Relational, array ...
- User Specifies the Island: 
  - *Relational(Select avg(temp) from device)*
  - *Array(Multiply(A,B))*
  - Cast data between engines
  
- Islands:
  - Have a data model, A language or set of operators, A set of candidate database engines.
  - Islands do intersetions of databases
  - Bigdawg does union of Islands.
  
## 4. Applied to MIMIC II Medical Dataset
[Video](https://www.youtube.com/watch?v=1GjA2mJFBb0)

- Analytics: Realtime : So support for streaming databases in future.
- Prototype for medical data
