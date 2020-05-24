
# DATABASE USED - MYSQL
# Version - 5.7.29-0ubuntu0.18.04.1


# query 5 - version 3
# creating and inserting values in table - junkmail_database

create table jobs (instructor varchar(20), subject varchar(20));

insert into jobs values ("Aleph", "Scratch"), ("Aleph", "Java"), ("Aleph", "Processing"), ("Bit", "Python"), ("Bit", "JavaScript"), ("Bit", "Java"), ("CRC", "Python"), ("CRC", "JavaScript"), ("Dat", "Scratch"), ("Dat", "Python"), ("Dat", "JavaScript"), ("Emscr", "Scratch"), ("Emscr", "Processing"), ("Emscr", "JavaScript"), ("Emscr", "Python");


create table offered_classes (classes varchar(20));
insert into offered_classes values ("JavaScript"), ("Scratch"), ("Python");


# EXPLANATION: Here, I have applied Left outer join on the given two tables. This shows that instructor must be able to teach all the classes that are mentioned in the offered_classes i.e. being offered. If there exist a value for which instructor is not able to teach, then those will simply create NULL at that place in the joined table.

# After performing the left outer join with comparing the common values of subjects instructor can teach and classes that are being offered, the total number of matching values are compared and put as a constraint after grouping the query with instructors.


select j1.instructor
from jobs as j1
left outer join offered_classes as o1
on j1.subject = o1.classes
group by j1.instructor
having count(j1.subject) >= (select count(classes) from offered_classes)
and count(o1.classes) >= (select count(classes) from offered_classes)
;


