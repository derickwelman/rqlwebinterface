# rqlwebinterface
RQL translator interface

##Instalation notes
To install the interface, take the following steps:
- Install a PostgreSQL server
- make sure that you have the proper privileges to the database management system
- Execute the database dump on Postgre, located on following folder

> rqlwebinterface/pt/sql/database-dump.sql

- Copy the entire *rqlwebinterface* folder into to your apache service root directory
- Config the file *connection.php* with your host and port information, but keep the rest of informations

> rqlwebinterface/pt/connection.php

- Enjoy the interface and translation

##Compilar and translator
To see the compiler repository please visit [derickwelman/RQL2SQL](https://github.com/derickwelman/RQL2SQL).