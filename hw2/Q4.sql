
# DATABASE USED - MYSQL
# Version - 5.7.29-0ubuntu0.18.04.1


# query 4
# creating and inserting values in table - junkmail_database

create table junkmail_database (name varchar(20), address varchar(10), id int, samefam int);

insert into junkmail_database values ('Alice', 'A', 10, NULL), ('Bob', 'B', 15, NULL), ('Carmen', 'C', 22, NULL), ('Diego', 'A', 9, 10), ('Ella', 'B', 3, 15), ('Farkhad', 'D', 11, NULL);


# select * from junkmail_database;


# deleting the names that have 'NULL' for SameFam and another family member in the database
delete from junkmail_database
where junkmail_database.id in (select j1.samefam
from (select * from junkmail_database) j1, (select * from junkmail_database) j2
where j1.samefam = j2.id and j1.sameFam is not null and j2.sameFam is null);


# printing out the final table
select * from junkmail_database;

