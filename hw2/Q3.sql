
# DATABASE USED - MYSQL
# Version - 5.7.29-0ubuntu0.18.04.1


# query 3

# creating and inserting values in table - student_project
create table student_project (pid char(4), step int, status char(2));

insert into student_project values ("P100", 0, "C"), ("P100", 1, "W"), ("P100", 2, "W"), ("P201", 0, "C"), ("P201", 1, "C"), ("P333", 0, "W"), ("P333", 1, "W"), ("P333", 2, "W"), ("P333", 3, "W");



# first attempt
select s1.pid
from student_project s1
where s1.step = 0 and s1.status = "C" and s1.pid in (select s.pid
		from student_project s
		where s.step = 1 and s.status = "W")
;


# another alternative
select s1.pid
from student_project s1
where s1.step = 0 and s1.status = 'C' and 
not exists(select * from student_project p2 where p2.pid = s1.pid and p2.step = 1 and p2.status != 'W');

