# Learnings

## Some of the things I do in free time

## MySQL- Refreshing again, back to basics!!

Root Password:  mysqlpass 
(But you don't know my machine !!)

## Softwares:
- MySql Workbench: https://dev.mysql.com/downloads/workbench/
- MySQL Shell: https://dev.mysql.com/downloads/shell/

## Connecting to MySQL
    mysqlsh -u root -h localhost
    \sql
    
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
       
 
 ## Playing with Data
    
        
      
