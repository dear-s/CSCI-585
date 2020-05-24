
# DATABASE USED - MYSQL
# Version - 5.7.29-0ubuntu0.18.04.1


# query 5 - version 2
# creating and inserting values in table - junkmail_database

create table jobs (instructor varchar(20), subject varchar(20));

insert into jobs values ("Aleph", "Scratch"), ("Aleph", "Java"), ("Aleph", "Processing"), ("Bit", "Python"), ("Bit", "JavaScript"), ("Bit", "Java"), ("CRC", "Python"), ("CRC", "JavaScript"), ("Dat", "Scratch"), ("Dat", "Python"), ("Dat", "JavaScript"), ("Emscr", "Scratch"), ("Emscr", "Processing"), ("Emscr", "JavaScript"), ("Emscr", "Python");


create table offered_classes (classes varchar(20));
insert into offered_classes values ("JavaScript"), ("Scratch"), ("Python");



# re-writing query 5 using "NOT EXISTS" and nested queries

# EXPLANATION: In this I am correlating queries to compare with the output of certain tables that are formed with nested queries. In the main query, we are comparing jobs table and returning those instructors for which there does not exists a values in the table that we got from the nested query. This query is responsible for giving out the values of those classes that are being offered where the condition "offered classes that are not taught by instructors" does not hold true.

# Here "Not exists" checks the validity of the query, whether a tuple value exist or not for the given condition. Also, combining this with instructor who can teach offered subjects.


select distinct j1.instructor
from jobs as j1
where not exists (select *
				  from offered_classes as o
				  where not exists (select *
									from jobs as j2
									where (j2.instructor = j1.instructor)
									and (j2.subject = o.classes)
								   )
				 )
;



