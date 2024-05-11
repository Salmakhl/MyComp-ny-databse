Enter password: ******************
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 10
Server version: 8.0.19 MySQL Community Server - GPL

Copyright (c) 2000, 2020, Oracle and/or its affiliates. All rights reserved.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> show databases ;
+--------------------+
| Database           |
+--------------------+
| bdvol              |
| centre_formation   |
| chevaux_ecurie     |
| djallabasoft       |
| hollywood          |
| information_schema |
| isgi               |
| mysql              |
| newschema          |
| performance_schema |
| sakila             |
| stu                |
| sys                |
| test1              |
| test2              |
| test3              |
+--------------------+
16 rows in set (0.00 sec)

mysql> use center_formation ;
ERROR 1049 (42000): Unknown database 'center_formation'
mysql> use centre_formation ;
Database changed
mysql> show tables ;
+----------------------------+
| Tables_in_centre_formation |
+----------------------------+
| catalogue                  |
| etudiant                   |
| formation                  |
| inscription                |
| session                    |
| specialite                 |
+----------------------------+
6 rows in set (0.00 sec)

mysql> desc etudiant ;
+---------------+-------------+------+-----+---------+-------+
| Field         | Type        | Null | Key | Default | Extra |
+---------------+-------------+------+-----+---------+-------+
| numCinEtu     | varchar(10) | NO   | PRI | NULL    |       |
| nomEtu        | varchar(45) | YES  |     | NULL    |       |
| prenomEtu     | varchar(45) | YES  |     | NULL    |       |
| dateNaissance | date        | YES  |     | NULL    |       |
| adressEtu     | varchar(45) | YES  |     | NULL    |       |
| villeEtu      | varchar(45) | YES  |     | NULL    |       |
| niveauEtu     | varchar(45) | YES  |     | NULL    |       |
+---------------+-------------+------+-----+---------+-------+
7 rows in set (0.10 sec)

mysql> select * from etudiant ;
+-----------+----------------+--------------+---------------+--------------------------------------+------------+------------+
| numCinEtu | nomEtu         | prenomEtu    | dateNaissance | adressEtu                            | villeEtu   | niveauEtu  |
+-----------+----------------+--------------+---------------+--------------------------------------+------------+------------+
| AB234567  | Alami          | Ahmad        | 1986-01-01    | rue du port,13                       | tanger     | bac        |
| C0987265  | Souni          | Sanaa        | 1998-04-30    | place de peuple n 2                  | tanger     | niveau bac |
| D2356903  | Idrissi Alami  | Mohamed      | 1996-05-05    | lotisement najah rue n 12 immeuble 3 | rabat      | bac+4      |
| F0827363  | Baoudiaf       | Fatima Zohra | 1997-01-10    | immeuble iftikhar , n 13 ettakaddoum | rabat      | bac+2      |
| G5346789  | Toumi          | Aicha        | 2000-03-12    | N12 immeuble Jaouhara                | casablanca | master     |
| J3578902  | Ben Omar       | Abd Allah    | 1990-06-25    | villa amina n12 bir rami             | kenitra    | phd        |
| Y1234987  | Ouled thami    | Ali          | 1979-12-04    | la ville haute , rue chouhada n 6    | tanger     | bachelor   |
+-----------+----------------+--------------+---------------+--------------------------------------+------------+------------+
7 rows in set (0.38 sec)

mysql> create database mycompany ;
Query OK, 1 row affected (0.26 sec)

mysql> use mycompany;
Database changed
mysql> create table user (
    -> user varchar(20) primary key ,
    -> passeword varchar(20) unique );
Query OK, 0 rows affected (0.96 sec)

mysql> insert into user value
    -> ("User1@localhost","Modep@sse1")
    -> ("User2@localhost","Modep@sse2")
    -> ("User3@localhost","Modep@sse3")
    -> ("User 4@localhost","Modep@sse4");
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '("User2@localhost","Modep@sse2")
("User3@localhost","Modep@sse3")
("User 4@local' at line 3
mysql> insert into user value
    -> ("User1@localhost","Modep@sse1"),
    -> ("User2@localhost","Modep@sse2"),
    -> ("User3@localhost","Modep@sse3"),
    -> ("User 4@localhost","Modep@sse4");
Query OK, 4 rows affected (0.15 sec)
Records: 4  Duplicates: 0  Warnings: 0

mysql> select * from user
    -> WHERE SUBSTRING(user, 7) LIKE '%LOcal%';
+------------------+------------+
| user             | passeword  |
+------------------+------------+
| User1@localhost  | Modep@sse1 |
| User2@localhost  | Modep@sse2 |
| User3@localhost  | Modep@sse3 |
| User 4@localhost | Modep@sse4 |
+------------------+------------+
4 rows in set (0.06 sec)

mysql> GRANT SELECT ON mycompany.* TO 'user1'@'localhost';
ERROR 1410 (42000): You are not allowed to create a user with GRANT
mysql> GRANT SELECT ON mycompany.* TO 'user1@localhost';
ERROR 1410 (42000): You are not allowed to create a user with GRANT
mysql>