-- Write a SQL statement to create a table named countries including columns CountryId, CountryName and RegionId and make sure that no countries except Italy, India and China will be entered in the table. and combination of columns CountryId and RegionId will be unique.
CREATE TABLE "countries" (
	"country_id"	INTEGER NOT NULL UNIQUE,
	"country_name"	TEXT CHECK("country_name" IN ('italy', 'india', 'china')),
	"region_id"	INTEGER UNIQUE,
	PRIMARY KEY("country_id")
);

-- Write a SQL statement to create a table named JobHistory including columns EmployeeId, StartDate, End_Eate, Job_Id and Department_Id and make sure that the value against column EndDate will be entered at the time of insertion to the format like ‘–/–/—-‘.
CREATE TABLE "JobHistory" (
	"EmployeeId"	INTEGER NOT NULL,
	"StartDate"	date,
	"EndDate"	date CHECK("EndDate" LIKE "__/__/____"),
	"Job_Id"	INTEGER NOT NULL,
	"Department_Id"	INTEGER NOT NULL,
	PRIMARY KEY("EmployeeId")
);


-- Write a SQL statement to create a table named jobs including columns JobId, JobTitle, MinSalary and MaxSalary, and make sure that, the default value for JobTitle is blank and MinSalary is 8000 and MaxSalary is NULL will be entered automatically at the time of insertion if no value assigned for the specified columns.
CREATE TABLE "jobs" (
	"job_id"	INTEGER NOT NULL UNIQUE,
	"job_title"	TEXT NOT NULL,
	"min_salary"	INTEGER DEFAULT 8000,
	"max_salary"	INTEGER DEFAULT NULL,
	PRIMARY KEY("job_id")
);

-- Write a SQL statement to create a table employees including columns Employee_Id, FirstName, LastName, Email, PhoneNumber, Hire_Date, Job_Id, Salary, Commission, Manager_Id and Department_Id and make sure that,
-- the Employee_Id column does not contain any duplicate value at the time of insertion, and the foreign key column DepartmentId, reference by the column DepartmentId of Departments table, 
-- can contain only those values which are exists in the Department table and another foreign key column JobId, referenced by the column JobId of jobs table, can contain only those values which are exists in the jobs table.
CREATE TABLE "department" (
	"dep_id"	INTEGER NOT NULL,
	"dep_name"	TEXT,
	PRIMARY KEY("dep_id")
);


CREATE TABLE "employee" (
	"emp_id"	INTEGER NOT NULL UNIQUE,
	"fName"	TEXT,
	"lName"	TEXT,
	"email"	TEXT,
	"phn_number"	NUMERIC,
	"hire_date"	DATE,
	"job_id"	INTEGER,
	"salary"	INTEGER,
	"comission"	NUMERIC,
	"manager_id"	INTEGER,
	"dep_id"	INTEGER,
	FOREIGN KEY("job_id") REFERENCES "jobs"("job_id"),
	FOREIGN KEY("dep_id") REFERENCES "department"("dep_id")
);



-- Alter statement Write a SQL statement to add a foreign key constraint named fk_job_id on JobId column of JobHistory table referencing to the primary key JobId of jobs table. Write a SQL statement to drop the existing foreign key fk_job_id from JobHistory table on JobId column which is referencing to the JobId of jobs table. Write a SQL statement to add a new column named location to the JobHistory table.
PRAGMA foreign_keys = ON;

ALTER TABLE JobHistory
ADD CONSTRAINT fk_job_id
FOREIGN KEY job_id
REFERENCES jobs.job_id
on UPDATE RESTRICT
on DELETE CASCADE


-- You have been hired to create a relational database to support a car sales business. You need to store information on the business’s employees, inventory, and completed sales. You also need to account for the fact that each salesperson receives a different percentage of their sales in commission. What tables and columns would you create in your relational database, and how would you link the tables?
CREATE TABLE "emp" (
	"eId"	INTEGER,
	"eName"	TEXT NOT NULL,
	"hireDate"	date,
	"commission"	NUMERIC,
	PRIMARY KEY("eId" AUTOINCREMENT)
)
CREATE TABLE "inventory" (
	"iId"	INTEGER,
	"Name"	TEXT NOT NULL,
	"price"	NUMERIC NOT NULL,
	PRIMARY KEY("iId" AUTOINCREMENT)
)
CREATE TABLE "sales" (
	"sID"	INTEGER,
	"empId"	INTEGER,
	"iId"	INTEGER,
	"salePrice"	NUMERIC,
	PRIMARY KEY("sID" AUTOINCREMENT),
	FOREIGN KEY("empId") REFERENCES "emp"("eId"),
	FOREIGN KEY("iId") REFERENCES "inventory"("iId")
)
