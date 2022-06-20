SELECT fName,RANK () OVER ( 
		ORDER BY fName 
	) ValRank
	FROM emp

SELECT row_number() OVER (
	ORDER by fName
	) val,fName FROM emp

SELECT DENSE_RANK () OVER (
	ORDER by fName
	) val,fName FROM emp



-- Table Name: 
CREATE TABLE "department" (
	"dep_id"	INTEGER NOT NULL,
	"dep_name"	TEXT,
	PRIMARY KEY("dep_id")
);

CREATE TABLE "emp" (
	"eID"	INTEGE NOT NULL,
	"fName"	TEXT,
	"lName"	TEXT,
	"salary"	NUMERIC,
	"hiring date"	date,
	"phnNumber"	NUMERIC,
	"dob"	date,
	"dep_id"	INTEGER,
	PRIMARY KEY("eID")
	FOREIGN KEY("dep_id") REFERENCES "department"("dep_id")
);

INSERT INTO "main"."emp" ("eID", "fName", "lName", "salary", "hiring date", "phnNumber", "dob", "dep_id") VALUES ('1', 'abc', 'bcd', '5500', '2021/06/19', '123456789', '2001/05/01', '2');
INSERT INTO "main"."emp" ("eID", "fName", "lName", "salary", "hiring date", "phnNumber", "dob", "dep_id") VALUES ('2', 'bac', 'cbd', '5000', '2021/02/19', '123456789', '2001/08/01', '3');
INSERT INTO "main"."emp" ("eID", "fName", "lName", "salary", "hiring date", "phnNumber", "dob", "dep_id") VALUES ('3', 'qbac', 'qcbd', '7000', '2021/02/14', '123456789', '2000/04/01', '1');
INSERT INTO "main"."emp" ("eID", "fName", "lName", "salary", "hiring date", "phnNumber", "dob", "dep_id") VALUES ('4', 'wqbac', 'qwcbd', '8000', '2021/02/14', '123456789', '2002/02/01', '4');
INSERT INTO "main"."emp" ("eID", "fName", "lName", "salary", "hiring date", "phnNumber", "dob", "dep_id") VALUES ('5', 'zwqbac', 'qwcbd', '8000', '2021/02/14', '123456789', '2002/02/01', '2');

-- Employee Write a query to rank employees based on their salary for a month 
SELECT rank() over(
	ORDER by salary
)rank,fName,lName,salary FROM emp

-- Select 4th Highest salary from employee table using ranking function 
SELECT * from (SELECT rank() over(
	ORDER by salary
)SalaryRank,fName,lName,salary FROM emp) WHERE SalaryRank=4

-- Get department, total salary with respect to a department from employee table.
SELECT dep_id,sum(salary) FROM emp GROUP BY dep_id

-- Get department, total salary with respect to a department from employee table order by total salary descending 
SELECT dep_id,sum(salary) FROM emp GROUP BY dep_id ORDER by salary DESC

-- Get department wise maximum salary from employee table order by salary ascending 
SELECT dep_id,max(salary) FROM emp GROUP BY dep_id ORDER by salary ASC

-- Get department wise minimum salary from employee table order by salary ascending 
SELECT dep_id,min(salary) FROM emp GROUP BY dep_id ORDER by salary ASC

-- Select department, total salary with respect to a department from employee table where total salary greater than 50000 order by TotalSalary descending
SELECT dep_id,sum(salary) FROM emp WHERE salary>5000 GROUP BY dep_id ORDER by salary DESC

