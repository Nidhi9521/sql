CREATE TABLE student(
studentId INTEGER PRIMARY KEY UNIQUE NOT NULL,
name TEXT);

CREATE TABLE studentDetail(
studentDetailId INTEGER PRIMARY KEY NOT NULL UNIQUE,
studentId INTEGER,
standard INTEGER,
gender TEXT,
FOREIGN KEY(studentId) REFERENCES student(studentId))

CREATE TABLE studentPresent(
studentPresentId INTEGER PRIMARY KEY,
studentId INTEGER,
month Text,
present TEXT,
FOREIGN key (studentId) REFERENCES student(studentId)
);

CREATE TABLE studentHours(
studentHoursId INTEGER PRIMARY KEY UNIQUE ,
studentId INTEGER,
datex date,
hours INTEGER,
FOREIGN KEY (studentId) REFERENCES student(studentId))


INSERT into student (studentId,name) VALUES(6,'asd'),
(2,'basd'),
(3,'casd'),
(4,'dasd'),
(5,'easd');

SELECT * from student


INSERT into studentDetail (studentDetailId,studentId,standard,gender) VALUES (7,1,10,'female'),
(2,1,5,'male'),
(3,4,6,'female'),
(4,3,7,'male'),
(5,2,8,'female'),
(6,1,9,'male');

SELECT * from studentDetail

INSERT INTO studentPresent (studentPresentId,studentId,month,present) VALUES (1,1,2,30),
(2,1,2,26),
(3,2,1,30),
(4,3,9,28),
(5,4,4,19),
(6,5,5,25);


insert into studentHours (studentHoursId,studentId,datex,hours)
VALUES
(1,1,'2022-05-06',8),
(2,2,'2022-05-06',10),
(3,3,'2022-05-07',9),
(4,4,'2022-05-08',6),
(5,5,'2022-05-09',5);

SELECT * from studentHours


-- Write queries for the following requirements.
    
    -- -  Display following details for each student:
        
    --     -   Name

    --     -   Standard

    --     -   Sex
SELECT name, standard,gender as sex FROM student 
INNER JOIN studentDetail on student.studentId=studentDetail.studentId;

--  Find SUM of student hours.
SELECT sum(hours) from studentHours 

-- Find Average Present of each student.
SELECT avg(present) from studentPresent 

-- Find Minimum present among all students.
SELECT min(present) from studentPresent 

-- Find Maximum present among all students.
SELECT max(present) from studentPresent 

-- Display fields like Name, Date, Hours from "studenthours" table where Date should be in following format :
SELECT name,datex,hours from student INNER join studentHours on student.studentId=studentHours.studentId



