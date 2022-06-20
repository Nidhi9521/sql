CREATE TABLE "department" (
	"dId"	INTEGER NOT NULL UNIQUE,
	"dName"	TEXT,
	PRIMARY KEY("dId")
);

INSERT INTO "main"."department" ("dId", "dName")
VALUES (1, 'CE');
INSERT INTO "main"."department" ("dId", "dName")
VALUES (2, 'EC');
INSERT INTO "main"."department" ("dId", "dName")
VALUES (3, 'CSE');
INSERT INTO "main"."department" ("dId", "dName")
VALUES (4, 'Electric');
INSERT INTO "main"."department" ("dId", "dName")
VALUES (5, 'Mech');


CREATE TABLE "department" (
	"dId"	INTEGER NOT NULL UNIQUE,
	"dName"	TEXT,
	PRIMARY KEY("dId")
);


CREATE TABLE "emp" (
	"empId"	INTEGER NOT NULL UNIQUE,
	"fName"	TEXT,
	"lName"	TEXT,
	"email"	TEXT,
	"jId"	INTEGER,
	"salary"	NUMERIC,
	"dId"	INTEGER,
	PRIMARY KEY("empId"),
	FOREIGN KEY("jId") REFERENCES "job"("jId"),
	FOREIGN KEY("dId") REFERENCES "department"("dId")
);

INSERT INTO "main"."job" ("jId", "job_title", "min_salary", "max_salary") VALUES ('AD_ASST', 'Admission Assistant', '3000', '6000');
INSERT INTO "main"."job" ("jId", "job_title", "min_salary", "max_salary") VALUES ('FI_ACCOUNT', 'Account', '4200', '9000');
INSERT INTO "main"."job" ("jId", "job_title", "min_salary", "max_salary") VALUES ('FI_MGR', 'Finance Manager', '8200', '16000');
INSERT INTO "main"."job" ("jId", "job_title", "min_salary", "max_salary") VALUES ('SA_MAN', 'Sales_manager', '4200', '16000');
INSERT INTO "main"."job" ("jId", "job_title", "min_salary", "max_salary") VALUES ('AD_PRES', 'president', '200000', '40000');
INSERT INTO "main"."job" ("jId", "job_title", "min_salary", "max_salary") VALUES ('AD_VP', 'administration Vice President', '15000', '300000');


INSERT INTO "main"."emp" ("empId", "fName", "lName", "email", "jId", "salary", "dId", "comission_pct") VALUES ('1', 'nd', 'gokani', 'nd@gmail.com', 'AD_ASST', '50000', '1', '0.02');
INSERT INTO "main"."emp" ("empId", "fName", "lName", "email", "jId", "salary", "dId", "comission_pct") VALUES ('2', 'fd', 'ln', 'fd@gmail.com', 'FI_ACCOUNT', '50000', '2', '0.15');
INSERT INTO "main"."emp" ("empId", "fName", "lName", "email", "jId", "salary", "dId", "comission_pct") VALUES ('3', 'qw', 'we', 'qw@gmail.com', 'FI_MGR', '50000', '3', '0.05');
INSERT INTO "main"."emp" ("empId", "fName", "lName", "email", "jId", "salary", "dId", "comission_pct") VALUES ('5', 'ghj', 'hj', 'hj@gmail.com', 'FI_MGR', '55000', '3', '0.85');
INSERT INTO "main"."emp" ("empId", "fName", "lName", "email", "jId", "salary", "dId", "comission_pct") VALUES ('4', 'jkl', 'kj', 'jk@gmail.com', 'SA_MAN', '5000', '4', '0.045');

-- Write a SQL statement to change the Email column of Employees table with ‘not available’ for all employees.

update emp set email="not available"

SELECT * from emp

-- Write a SQL statement to change the Email and CommissionPct column of employees table with ‘not available’ and 0.10 for all employees.
update emp set email="not available", comission_pct='0.10'

select * from emp

-- Write a SQL statement to change the Email and CommissionPct column of employees table with ‘not available’ and 0.10 for those employees whose DepartmentID is 110.
update emp set email="not available", comission_pct='0.20' WHERE dId=1

SELECT * from emp

-- Write a SQL statement to change the Email column of employees table with ‘not available’ for those employees whose DepartmentID is 80 and gets a commission is less than 20%
update emp set email="not available" WHERE dId=1 AND comission_pct >=0.2

SELECT * from emp

-- Write a SQL statement to change the Email column of employees table with ‘not available’ for those employees who belongs to the ‘Accouning’ department.
update emp set email="Not available" where dId=(select dId FROM department where dName="Accounting")

SELECT * from emp

-- Write a SQL statement to change salary of employee to 8000 whose ID is 105, if the existing salary is less than 5000.
update emp set salary=8000 where empId=105

SELECT * from emp

-- Write a SQL statement to change job ID of employee which ID is 118, to SH_CLERK if the employee belongs to department, which ID is 30 and the existing job ID does not start with SH.
update emp set jId="SH_CLEK" where empId=3 and dId = 3 AND jId  NOT Like "SH%"

SELECT * from emp


-- Write a SQL statement to increase the salary of employees under the department 40, 90 and 110 according to the company rules that, salary will be increased by 25% for the department 40, 15% for department 90 and 10% for the department 110 and the rest of the departments will remain same.
UPDATE emp set salary
= CASE  
when 2 THEN salary+(salary*0.25)
when 3  then salary+(salary*0.15)
when 4  then salary+(salary*0.10)
ELSE
salary
END
where did in (2,3,4)


-- Write a SQL statement to increase the minimum and maximum salary of PU_CLERK by 2000 as well as the salary for those employees by 20% and commission by 10% .
update job set min_salary=min_salary+2000, max_salary=max_salary+2000 WHERE jId="PU_CLERK"
update emp set salary=salary+(salary*0.2), comission_pct=comission_pct+(comission_pct*0.2) where jId="PU_CLERK"



/* Basic Select Queries: */

/*Get all employee details from the Employee table*/

SELECT * from emp

/*Get FirstName, LastName from Employees table */

SELECT fName,lName FROM emp 


/*Get FirstName from Employees table using alias name “Employee Name” */

SELECT fName as "Employee Name" FROM emp 


/*Get employee details from Employees table whose Employee Name is “Steven” */

SELECT * FROM emp WHERE fName="Steven"


/* Get employee details from Employees table whose Employee Name are “Neena” and “Lex” */

SELECT * FROM emp WHERE fName="Neena" or fName="Lex"


/* Get employee details from Employees table whose Employee name are not “Neena” and “Neena” */

SELECT * FROM emp WHERE fName is Not "Neena"
SELECT * FROM emp WHERE NOT fName = "Neena"


/* Get employee details from Employees table whose Salary between 5000 and 8000*/

SELECT * FROM emp WHERE salary BETWEEN 5000 and 8000


/* Write a query to get the names (FirstName, LastName), Salary, PF of all the Employees (PF is calculated as 12% of salary). */

select fName||" "||lName  as "name", (salary+(salary*0.12)) as "pf_salary" from emp


/*Get employee details from Employees table whose FirstName starts with ‘N’*/

select * from emp where fName like "N%"


/* Write a query to get unique department ID from Employees table*/

SELECT DISTINCT dId FROM emp;


/* Write a query to get all employee details from the employee table order by FirstName, descending.*/

SELECT * FROM emp ORDER by fName DESC;



/* Write a query to get the EmployeeID, names (FirstName, LastName), salary in ascending order of salary. */

SELECT empId, fName||" "||lName as names,salary FROM emp ORDER by salary ASC;



/*Select TOP 2 salary from employee table*/

SELECT * FROM emp ORDER by salary DESC LIMIT 2














