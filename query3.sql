SELECT fName, lName,dep_name,emp.dep_id
FROM emp LEFT OUTER JOIN department  
ON emp.dep_id = department.dep_id;  

CREATE TABLE "employees" (
	"eId"	INTEGER NOT NULL,
	"fName"	TEXT NOT NULL,
	"lName"	TEXT NOT NULL,
	"salary"	NUMERIC NOT NULL,
	"joindate"	date NOT NULL,
	"depName"	TEXT NOT NULL,
	"mId"	INTEGER,
	PRIMARY KEY("eId" AUTOINCREMENT)
)


CREATE TABLE "incentive" (
	"eId"	INTEGER,
	"incdate"	date NOT NULL,
	"incamount"	NUMERIC NOT NULL,
	FOREIGN KEY("eId") REFERENCES "employees"("eId")
)

CREATE TABLE "manager" (
	"mId"	INTEGER,
	"mName"	TEXT,
	PRIMARY KEY("mId" AUTOINCREMENT)
)


INSERT INTO "main"."employees" ("eId", "fName", "lName", "salary", "joindate", "depName", "mId") VALUES ('1', 'abc', 'abc', '5000', '2022-05-12', 'mobile', '2');
INSERT INTO "main"."employees" ("eId", "fName", "lName", "salary", "joindate", "depName", "mId") VALUES ('2', 'bcd', 'bcd', '8000', '2020-01-09', 'mobile', '1');
INSERT INTO "main"."employees" ("eId", "fName", "lName", "salary", "joindate", "depName", "mId") VALUES ('3', 'efg', 'efg', '20000', '2016-04-11', 'php', '4');
INSERT INTO "main"."employees" ("eId", "fName", "lName", "salary", "joindate", "depName", "mId") VALUES ('4', 'hji', 'hji', '16000', '2006-09-11', 'mobile', '3');
INSERT INTO "main"."employees" ("eId", "fName", "lName", "salary", "joindate", "depName", "mId") VALUES ('5', 'jkl', 'jkl', '15000', '2018-10-24', 'node', '1');

INSERT INTO "main"."incentive" ("eId", "incdate", "incamount") VALUES ('1', '2022-05-11', '5000');
INSERT INTO "main"."incentive" ("eId", "incdate", "incamount") VALUES ('3', '2021-05-04', '7000');
INSERT INTO "main"."incentive" ("eId", "incdate", "incamount") VALUES ('2', '2022-05-20', '4000');

INSERT INTO "main"."manager" ("mId", "mName") VALUES ('1', 'asd');
INSERT INTO "main"."manager" ("mId", "mName") VALUES ('2', 'poi');
INSERT INTO "main"."manager" ("mId", "mName") VALUES ('3', 'lkjh');
INSERT INTO "main"."manager" ("mId", "mName") VALUES ('4', 'hjk');


-- Get difference between JOINING_DATE and INCENTIVE_DATE from employee and incentives table
SELECT fName,incdate,joindate from employees
INNER JOIN incentive on employees.eId=incentive.eId

-- Select first_name, incentive amount from employee and incentives table for those employees who have incentives and incentive amount greater than 3000
SELECT fName,incdate from employees
INNER JOIN incentive on employees.eId=incentive.eId and incamount>3000

-- Select first_name, incentive amount from employee and incentives table for all employees even if they didn’t get incentives.
SELECT fName,incdate from employees
LEFT JOIN incentive on employees.eId=incentive.eId 

-- Select EmployeeName, ManagerName from the employee table.
SELECT fName,mName from employees
INNER JOIN manager on employees.mId=manager.mId

-- Select first_name, incentive amount from employee and incentives table for all employees even if they didn’t get incentives and set incentive amount as 0 for those employees who didn’t get incentives.
SELECT fName,  ifnull(incamount, 0) from employees A
LEft  JOIN incentive B  on
A.eId = B.eId