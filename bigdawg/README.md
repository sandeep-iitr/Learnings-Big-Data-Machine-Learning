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
- Installation sets up a demo on MIMIC II database
  - curl -X POST -d "bdrel(select * from mimic2v26.d_patients limit 4;)" http://localhost:8080/bigdawg/query/
  
## 5. Query Interface

- curl -X POST -d "<query-goes-here>" http://localhost:8080/bigdawg/query/
- curl -X POST -d "bdrel(select * from mimic2v26.d_patients limit 4;)" http://localhost:8080/bigdawg/query/
- curl -X POST -d "bdarray(filter(myarray,dim1>150))" http://localhost:8080/bigdawg/query/
- curl -X POST -d "bdtext({ 'op' : 'scan', 'table' : 'mimic_logs', 'range' : { 'start' : ['r_0001','',''], 'end' : ['r_0015','','']} });" http://localhost:8080/bigdawg/query/

- Join data across two postgres instances
  - bdrel(select * from mimic2v26.additives,mimic2v26.admissions where mimic2v26.additives.subject_id=mimic2v26.admissions.subject_id limit 10)
- Moves data from scidb to postgres: bdcast: tell to move data.
  - bdrel(select * from bdcast( bdarray(filter(myarray,dim1>150)), tab6, '(i bigint, dim1 real, dim2 real)', relational))





