# Learnings

## Some of the things I do in free time

## MySQL- Refreshing again, back to basics!!
    
   

## Softwares:
- MySQL Community Server: https://dev.mysql.com/downloads/mysql/
- MySql Workbench: https://dev.mysql.com/downloads/workbench/
- MySQL Shell: https://dev.mysql.com/downloads/shell/

## Starting MySQL Server
 
    sudo  /usr/local/mysql/support-files/mysql.server start 
   
## Connecting to MySQL
    mysqlsh -u root -h localhost
    \sql
   
    #In case above connecting failed, and you don't know password
    # may be it was bad day!!
    
    #Stop MySQL server, if already runnung
    sudo  /usr/local/mysql/support-files/mysql.server stop 
    
    #Starting with MySql no-password for login
    sudo  /usr/local/mysql/support-files/mysql.server start  --skip-grant-tables
    
    # Follow below steps in command line
    cd /usr/local/mysql/bin
    sudo ./mysql
    FLUSH PRIVILEGES;
    ALTER USER 'root'@'localhost' IDENTIFIED BY 'mysqlpass';
    
    
    # OR follow an easy way
     mysqld --init-file /Users/administrator/Research/trainings/learnings/github/mySQL/mysql-init
     
    
   
## MySQL learning: System and database set up    
  - Alter user command: change password
    
        ALTER USER 'root'@'localhost' IDENTIFIED BY 'mysqlpass';
  
  - Creating a Database
  
        CREATE DATABASE TREE_DB;
        Show databases;
   
  - Creating a table
        
        use tree_db;
        show tables;
        CREATE TABLE tree (ID INT PRIMARY KEY, P_ID INT); 
        show tables;
        describe tree;
 
  - Inserting data into table
     
     Loading data from .txt file, with items in the same order as the columns, and each cell value
     separated by a tab. For empty or null values use \N. 
     For example for a table of values
       
        ID   P_ID
        1   2
        3   2
        6   8
        9   8  
        2   5
        8   5
        5   NULL
        
    We can use a txt file containing
       
        
        1   2
        3   2
        6   8
        9   8  
        2   5
        8   5
        5   \N
        
    Loading data command from Sample Text file in my case on my Desktop:
             
        load data local INFILE '/Users/sandeep/Desktop/My Research/Learning/MySQL/input1.txt' INTO TABLE tree;
        select * from tree;
    
    
    Deleting data in the table
     
        delete from tree where id>0;

## Playing with Data
    
- This is a binary tree data structure which has root 5, two inner nodes: 2,8 and four leaf nodes: 1,3,6,9

       #Printing id of all the non-leaf nodes
       SELECT id FROM tree WHERE id in (SELECT p_id  FROM tree);
       #outputs: 2,5,8
       
       # Printing id of the root
       SELECT id FROM tree WHERE P_id is null;
       #output: 5
       
## Nested Query: Print all lead nodes

       #Printing id of all the leaf nodes, note the null condition is important
       SELECT id FROM tree WHERE id not  in (SELECT p_id  FROM tree where p_id is not null);
  
## If Statement in MySQL
Print all the Leaf and Non-Leaf nodes with designated types
        
         SELECT TREE.ID,
         IF(id not  in (SELECT p_id  FROM tree where p_id is not null),"LEAF","NON-LEAF") 
         AS TYPE 
         FROM tree;
      
## Case Statement for LEAF and NON-Leaf Nodes
        
         SELECT id,
         CASE
         WHEN id  in (SELECT p_id  FROM tree) THEN "NON-LEAF"
         WHEN id not in (SELECT p_id  FROM tree where p_id is not null) THEN "LEAF"
         END
         FROM tree; 
         
         
         #Inner, leaf and root
         
         # leaf nodes: id's which are parent to no other nodes
         # root node: has p_id as null
         # Otherwise the node is inner
         
         SELECT id,
         CASE
         WHEN id not in (SELECT p_id  FROM tree where p_id is not null) THEN "LEAF"
         When p_id is null THEN "ROOT"
         else "INNER"
         END
         FROM tree; 
         
