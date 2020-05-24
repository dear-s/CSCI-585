
# DATABASE USED - MYSQL
# Version - 5.7.29-0ubuntu0.18.04.1


# query 2

# creating and inserting into table - Enrollment
create table Enrollment(sid int, classname varchar(10), grade char(3));
insert into Enrollment values(123, "Processing","A");
insert into Enrollment values(123, "Python", "B"), (123, "Scratch", "B");		
insert into Enrollment values(662, "Java", "B"), (662, "Python", "A"), (662, "JavaScript", "A"), (662, "Scratch", "B"), (345, "Scratch", "A"), (345, "JavaScript", "B"), (345, "Python", "A");
insert into Enrollment values(555, "Python", "B"), (555, "JavaScript", "B");


# solution for the required output

# Explanation: this query is grouping the classes and counting the no. of enrolled students. Also, ordering the output table in reverse order of enrollment and then className.

select classname, count(sid) as total
from Enrollment
group by classname
order by total desc, classname desc;
