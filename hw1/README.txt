ENTITIES:
1. Ratings
2. Supplier
3. Student
4. Order
5. Table
6. Part
7. Schedule
8. Flatfee
9. Library
10. Group
11. Instructor
12. Book
13. Project
14. Room
15. Coding class
16. Textbook
17. Coding Language
18. Payroll
19. Box
20. Microcontroller


RELATIONSHIP AND CARDINALITIES:
> Supplier and Order [M:M]
> Order and Part [M:M]
> Part and Box [M:1]
> Table and Group [1:1]
> Instructor and Project [M:M]
> Student and Library [M:1]
> Library and Book [1:M]
> Student and Flatfee [1:1]
> Student and Schedule [1:1]
> Student and Ratings [1:M]
> Group and Project [M:1]
> Project and Microcontroller [1:1]
> Student and Group [M:1]
> Instructor and Payroll [1:M]
> Instructor and Textbook [M:M]
> Instructor and Coding Class [M:M]
> Coding Class and Coding Language [M:M]
> Coding Class and Room [M:M]
> Schedule and Room [M:M]
> Room and Project [1:M]
> Table and Box [1:1]


EXPLANATIONS AND ASSUMPTIONS:


1. For every STUDENT, there exist one schedule as mentioned in the assignment "each student has a schedule". It will tell the details of ROOM where the STUDENT has to go. Thus, in SCHEDULE TABLE, I have added ROOM_ID as a foreign key along with STUDENT_ID. Relationship between STUDENT and SCHEDULE IS 1:1 as described in the diagram.

SCHEDULE IS HAVING M:M relationship with ROOM explaining that a schedule can contain many rooms per student. Similarly, one room can occur in zero or many schedules.

STUDENT also pays a FLATFEE and this relationship will be a weak relationship because Flatfee does not depend on each student.Each student will get a different fee_id along with separate payment_details. Thus, they are forming 1:1 relationship.

STUDENT borrows books from library is shown by an associative entity (bridge) i.e. LIBRARY in which each entry is stored with book_id and student_id. This bridge is responsible for creating two 1:M relationships between STUDENT and LIBRARY and between LIBRARY and BOOK.

Assumption for STUDENT and GROUP: a student can be in only one group and one group can have many(maximum of 4) students. For a group to form, atleast one person is needed.


2. GROUP is forming a 1:1 weak relationship with TABLE and has its primary key 'table_id' as a foreign key.

TABLE is provided with a storage box and each table will get one. Thus, TABLE and BOX are related with 1:1 relationship.

Assumption based on Project and Group relationship: One project is assigned more than one groups whereas a group has only one project. Therefore, GROUP works on PROJECT is related with 1:1 cardinality and PROJECT is given to GROUP entity is having 1:M cardinality.


3. PROJECT entity has a MICROCONTROLLER linked with it where students will run their code and forming a weak relationship with it. It's connectivity is 1:1

A project uses exactly one room (represented by 1:1) but a room can hold zero or more than one projects (represented as 0:M cardinality).


4. PARTs for the projects are ordered from suppliers. Assumption made in the diagram is - an order can be placed for many parts. Many orders has been placed by the suppliers and one supplier can supply/provide many different orders and parts. It has its own primary key ORDER_ID. Also it contains SUPPLIER_ID and PART_ID as foreign keys making the relationships weak. PART and ORDER entity is having M:M cardinality just like ORDER and SUPPLIER.

Assumption for PART and BOX: Parts are contained within a storage box. One box can have many parts but one part can be only in one storage BOX. This is represented by 1:M and 1:1 relationship.


5. INSTRUCTOR "supervises" PROJECT and "teaches" CODING CLASSES. Assuming when an instructor is teaching coding class, he/she cannot supervise a project and vice versa. Thus it depends on both the cases - hence, an instructor can supervise zero or many projects. Zero condition will happen when instructor is teaching a coding class. Similarly, an instructor can teach zero or many coding classes. This condition is represented by 0:M cardinality

Instructor can further specifies or use one or more than one textbook. Similarly, a textbook can be used by one or more than one instructor since more than one course/class can have same textbook. This is forming a 1:M relationship.

INSTRUCTOR is paid on the basis of per_hour_rate and it varies whether he is supervising a project or teaching a class. Thus all these attributes are added in a separate table PAYROLL which will manage how the instructor is getting paid.

Assumption on INSTRUCTOR: one instructor can have zero or more entries in payroll. Initial condition is set to be zero when he has just joined and has not got the first payment yet(0:M cardinality).

Assumption on PAYROLL: One PAYROLL entry is related to only one INSTRUCTOR and each entry is represented for separate instructor pay_id and his work type (whether he is teaching or supervising) - 1:1 cardinality


6. CODING CLASS is linked with ROOM. Coding class contains the PK of ROOM i.e "room_id" as a part of its primary key and hence making it a strong relationship, thus represented by a solid line.
Coding class can be held in any room as per the room availability. Thus, they are related with M:M relationship.

Assumption for CODING CLASS & CODING LANGUAGE: Different CODING CLASSes use different languages. This is represented by CODING LANGUAGE entity and the relationship between them is 1:M


7. Every STUDENT will rate(RATINGS) atleast once [shown by connectivity 1:M]

Thank you!!