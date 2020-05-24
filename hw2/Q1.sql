
# DATABASE USED - MYSQL
# Version - 5.7.29-0ubuntu0.18.04.1


# query 1 - solution

# assumptions and explanation: Assuming that a group can book a room for only 1 hour at a time. I am only accepting the values that have a gap of 1 hour and end time will always be greater than the start time.

# If the difference between the timings [endTime - startTime] is not one, then with the use of triggers, the query is throwing an error.

# Since it's only for a day [not for multiple days], I have made [roomNum,startTime] as a primary key. It will make sure no group has selected the same timing block for the same room and thus, no complications will occur following this system.

# I have introduced two trigger functions:
# 1. Validating the difference between startTime and endTime (based on assumption and alteration/re-designing)
# 2. Checking whether startTime is less than endTime (general condition) 

# Constraint I have put in the system: Insert only 1 hour timing block


# creating a table "ProjectRoomBookings"
create table ProjectRoomBookings (roomNum integer not null,
								   startTime integer not null,
								   endTime integer not null,
								   groupName char(10) not null,
								   primary key(roomNum, startTime))
;


# making trigger for query 1
# validation considered here: start time < end time [condition]
delimiter $$

create trigger validation_start_end_time
	before insert on ProjectRoomBookings for each row
	begin
		if new.endTime < new.startTime
		then
			signal sqlstate '45000'
			set message_text = "end time cannot be less than start time";
		end if;
	end;
$$
delimiter ;



# second condition [checking with triggers]: 1 hour constraint
delimiter $$
create trigger second_condition
	before insert on ProjectRoomBookings for each row
	begin
		if new.endTime- new.startTime != 1
		then
			signal sqlstate '45000'
				set message_text = "insert 1 hour timing block only";
		end if;
	end;
$$
delimiter ;


# inserting some demo values in the table after introducing constraints via triggers
insert into ProjectRoomBookings values (301, 11, 10, 'Group1');
insert into ProjectRoomBookings values (301, 10, 11, 'Group2');
insert into ProjectRoomBookings values (301, 16, 14, 'Group3');
insert into ProjectRoomBookings values (301, 12, 14, 'Group4');
insert into ProjectRoomBookings values (301, 11, 12, 'Group5');
insert into ProjectRoomBookings values (302, 10, 11, 'Group6');
insert into ProjectRoomBookings values (302, 11, 12, 'Group7');


# Ouput table explanation:

# Group1 -> cannot be added because startTime > endTime
# Group2 -> added as it satisfies all the conditions and hence, able to reserve a room (301 for 10 to 11)
# Group3 -> cannot be added because startTime > endTime
# Group4 -> cannot be added because timing block exceeds the 1 hour limit
# Group5 -> added as it satisfies all the conditions and hence, able to reserve a room (301 for 11 to 12)
# Group6 -> added as it satisfies all the conditions and hence, able to reserve a room (302 for 10 to 11)
# Group7 -> added as it satisfies all the conditions and hence, able to reserve a room (302 for 11 to 12)


# printing table
select * from ProjectRoomBookings;

