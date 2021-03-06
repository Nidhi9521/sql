-- -   Tables Used:=
    
--     -	student  (studentid, name)

--     -   studentdetail (studentdetailid, studentid, standard, gender)

--     -   studentpresent (studentpresentid, studentid, month, present)

--     -   studenthours (studenthoursid, studentid, datex, hours)

--     -   product (productid, name)

--     -   productprice (productpriceid, productid, code, effdt, price)



-- Q-1 Write a query which will print name of each student, and his or her attendance report for current month. 
-- Fields : Name, Attendance Report for Current Month

-- 	Under "Attendance Report for Current Month" column:
-- 		if 'studentpresent.present' is less than or equal to 7 print "Poor", 
-- 		if 'studentpresent.present' is more than 7 and less than or equals 15 print "Good", 
-- 		if 'studentpresent.present' is more than 15 and less than or equals 20 print "Better", 
-- 		if 'studentpresent.present' is more than 20 print "Best".

SELECT name , studentPresent.present , CASE
WHEN studentPresent.present <= 7 THEN 'poor'
WHEN studentPresent.present < 15 AND studentPresent.present > 7 THEN 'good'
WHEN studentPresent.present < 20 AND studentPresent.present > 15 THEN 'better'
WHEN studentPresent.present > 20 THEN 'Best'
ELSE 'nodate'
END 'report'
FROM student 
INNER join studentPresent  on
student.studentId = studentPresent.studentId
WHERE studentPresent.month = 02

-- Q-2 Write a query to print student name, total number of hours for Jan, Feb, March month. Information for each student should be printed in a single row.

-- 	Fields : Name, Working Hours for Jan, Working Hours for Feb, Working Hours for March

-- 	See following example:
-- 	Name		Working Hours for Jan	Working Hours for Feb	Working Hours for March
-- 	Minesh		80			70			90
-- 	Reena		70			80			90
SELECT s.name, 
        (   SELECT SUM([hours]) 
            FROM studentHours sh1
            WHERE s.studentId = sh1.studentId AND strftime('%m',datex)='01'
        ) as jan,
        (   SELECT SUM([hours]) 
            FROM studentHours sh1
            WHERE s.studentId = sh1.studentId AND strftime('%m',datex)='02'
        ) as feb,
        (   SELECT SUM([hours]) 
            FROM studentHours sh1
            WHERE s.studentId = sh1.studentId AND strftime('%m',datex)='03'
        ) as march

    FROM student s;


-- Q-3 Print information for the student having name like "Mira", "Kabir", "Om", "Manas"
-- 	Fields: Name, Standard
SELECT name,standard from student inner join studentDetail 
on student.studentId=studentDetail.studentId where name in ('A.asd','A.radha')

-- Q-4 Print information for the student having name other than "Mira", "Kabir", "Om", "Manas"
-- 	Fields: Name, Standard
SELECT name,standard from student inner join studentDetail 
on student.studentId=studentDetail.studentId where name in ('A.kabir','A.Mira','A.Om','A.Manas')

-- Q-5 Print information for the student having presence for Jananuary between 20 to 25.
-- 	Fields: Name, Standard, Present
SELECT name,standard,studentPresent.present from student 
inner join studentDetail on student.studentId=studentDetail.studentId
inner join studentPresent on student.studentId=studentPresent.studentId
 where studentPresent.month=2 and studentPresent.present BETWEEN 20 and 25

-- Q-6 Print information for the student having charcter "r" at the third position of their name.
-- 	Fields: Name, Standard
-- 	Eg: It should print information for "Mira", "Gira" etc.
SELECT name,standard from student inner join studentDetail 
on student.studentId=studentDetail.studentId where name like'___r%'


-- Q-7 Print information for the student having "bhai" in their name. 
-- 	Fields: Name, Standard
SELECT name,standard from student inner join studentDetail 
on student.studentId=studentDetail.studentId where name like'%bhai%'


-- Q-8 Print information for the student who do not have any presence in the college.
-- 	Fields: Name, Standard
SELECT * from student 
left join studentPresent on student.studentId= studentPresent.studentId 
where studentPresent.studentPresentId is null;

-- Q-9 Write a query which will print name of each student, and his or her attendance report for current month. 
-- 	Fields : Name, Attendance Report for Current Month

-- 	In "Attendance Report for Current Month" column 
-- 	if student has presence for that month then print "Present"
-- 	else print "Not Present".
SELECT name,case 
when studentPresent.month=1 then 'Present'
Else 'Not Present'
End attendence_report
FROM student INNER join studentPresent on student.studentId=studentPresent.studentId

-- Q-10 Execute following queries and evaluate the output by giving appropriate reason.
-- 	SELECT STRCMP('text', 'text2');
-- 	SELECT STRCMP('text2', 'text');
-- 	SELECT STRCMP('text', 'text');


-- Q-11 Print the student information having average presence (in percentage) for Jan, Feb and March between 60 to 75.
-- 	Fields: Name, Standard, Present
SELECT s.name, 
        (SELECT avg(present) 
            FROM studentPresent sh1
            WHERE s.studentId = sh1.studentId AND month=1 ) as jan,
        (SELECT avg(present) 
            FROM studentPresent sh1
            WHERE s.studentId = sh1.studentId AND month=2) as feb,
        (SELECT avg(present) 
            FROM studentPresent sh1
            WHERE s.studentId = sh1.studentId AND month=3) as march
    FROM student s WHERE jan BETWEEN 15 and 20 



-- Q-12 List information of the product having "Maximum Price" within date range 01-01-2006 to 15-01-2006
SELECT max(price),* FROM product INNER join productPrice on product.productId=productPrice.productId
where productPrice.effectiveDate BETWEEN date('2022-06-15') and date('2022-06-30')