
# DATABASE USED - MYSQL
# Version - 5.7.29-0ubuntu0.18.04.1


# query 5 - version 1
# creating and inserting values in table - junkmail_database

create table jobs (instructor varchar(20), subject varchar(20));

insert into jobs values ("Aleph", "Scratch"), ("Aleph", "Java"), ("Aleph", "Processing"), ("Bit", "Python"), ("Bit", "JavaScript"), ("Bit", "Java"), ("CRC", "Python"), ("CRC", "JavaScript"), ("Dat", "Scratch"), ("Dat", "Python"), ("Dat", "JavaScript"), ("Emscr", "Scratch"), ("Emscr", "Processing"), ("Emscr", "JavaScript"), ("Emscr", "Python");


create table offered_classes (classes varchar(20));
insert into offered_classes values ("JavaScript"), ("Scratch"), ("Python");



# EXPLANATION: I have table "jobs" and want to find out which "instructors" teach all the classes that are in the table - "offered_classes" means which are offering. I have used "having" and "group by" for performing the desired output. This is also an example of "Divide" relational operator. Since, we cannot use divide directly in mysql, I have applied some other ways to get the same output with similar semantics behind it.

# In this query, the where clause subquery that is used, is simply giving us all the classes that are being offered. We are comparing this with subject that each instructor can teaches. If the subject clashes with any of the offered classes then that tuple from the "jobs" table will be selected.

# Further we are grouping the values/tuples we got from instructors. It means one instructor who teaches many subjects will be grouped and their values are used for comparing the total no. of classes the instructor can teach (knowing the values should be in offered_classes table discussed above and mentioned in the where clause) with total no. of classes that are being offered (or present in the offered_classes). This check is for eliminating those instructors that can teach some subjects but not all (in offered_classes)


select instructor
from jobs
where subject in (select * from offered_classes)
group by instructor
having count(*) = (select count(*) from offered_classes)
;



