CREATE TABLE "emp" (
	"eID"	INTEGE NOT NULL,
	"fName"	TEXT,
	"lName"	TEXT,
	"salary"	NUMERIC,
	"hiring date"	date,
	"phnNumber"	NUMERIC,
	"dob"	date,
	PRIMARY KEY("eID")
);

INSERT INTO "main"."emp" ("eID", "fName", "lName", "salary", "hiring date", "phnNumber", "dob") VALUES ('2', 'nnd', 'ddn', '8000', '05/07/2020', '123456789', '01/01/2001');
INSERT INTO "main"."emp" ("eID", "fName", "lName", "salary", "hiring date", "phnNumber", "dob") VALUES ('3', 'nnd', 'ddn', '8000', '2022-06-17', '123456789', '01/01/2001');
INSERT INTO "main"."emp" ("eID", "fName", "lName", "salary", "hiring date", "phnNumber", "dob") VALUES ('4', 'nnnd', 'dddn', '10000', '2022-06-17', '123456789', '01/01/2002');
INSERT INTO "main"."emp" ("eID", "fName", "lName", "salary", "hiring date", "phnNumber", "dob") VALUES ('5', 'nnnnd', 'ddddn', '12000', '2022-06-15', '123456789', '01/05/2002');

-- Write a query that displays the FirstName and the length of the FirstName for all employees whose name starts with the letters ‘A’, ‘J’ or ‘M’. Give each column an appropriate label. Sort the results by the employees’ FirstName

SELECT fName,length(fName) from emp where fName Like('A%') or fName like('J%') or fName like('M%') ORDER BY fName ASC;

-- Write a query to display the FirstName and Salary for all employees. Format the salary to be 10 characters long, left-padded with the $ symbol. Label the column SALARY.

-- Write a query to display the employees with their code, first name, last name and hire date who hired either on seventh day of any month or seventh month in any year.

SELECT eID,fName,lName,hiringDate FROM emp where hiringDate=date(hiringDate,'start of month','+6 days') or
strftime('%m',hiringDate)=strftime('%m','2022-07-21')

-- Write a query to display the length of first name for employees where last name contains character ‘c’ after 2nd position.
SELECT length(fName),fName||" "||lName FROM emp WHERE lName like '__c%';

-- Write a query to extract the last 4 character of PhoneNumber.
SELECT substr(phnNumber,6,10) as Last4DigitPhnNum FROM emp

-- Write a query to update the portion of the PhoneNumber in the employees table, within the phone number the substring ‘124’ will be replaced by ‘999’
update emp set phnNumber=(replace(phnNumber,124,999)) 

-- Write a query to calculate the age in year.
select strftime('%Y','now')-strftime('%Y',dob) as age from emp

-- Write a query to get the distinct Mondays from HireDate in employees tables.
select * from emp where strftime('%w',hiringDate)=strftime('%w','2022-06-13')

-- Write a query to get the FirstName and HireDate from Employees table where HireDate between ‘1987-06-01’ and ‘1987-07-30’
SELECT fName,hiringDate FROM emp where hiringDate BETWEEN '1987-06-01' and '1987-07-30'

-- Write a query to display the current date in the following format. Sample output : 12:00 AM Sep 5, 2014
SELECT strftime('%H : %M %m/%d/%Y','now') 
SELECT 
    CASE WHEN 
        StrFTime('%H', 'now') % 12 = 0 THEN 12
        ELSE StrFTime('%H', 'now') % 12 END 
    || ':' ||
        StrFTime('%M', 'now')
    || ' ' ||
    CASE WHEN
        StrFTime('%H', 'now') > 12 THEN 'PM'
        ELSE 'AM' END   
		||' '||strftime('%m-%d-%Y','now')
    `currentTime`
 
-- Write a query to get the FirstName, LastName who joined in the month of June.
SELECT fName,lName from emp WHERE  strftime('%m',hiringDate) =strftime('%m','2022-06-01');

-- Write a query to get first name, hire date and experience of the employees.
SELECT fName,hiringDate,(strftime('%Y','now')-strftime('%Y',hiringDate) )as experience from emp 

-- Write a query to get first name of employees who joined in 1987.
SELECT fName from emp WHERE  strftime('%Y',hiringDate) =strftime('%Y','1987-06-01');