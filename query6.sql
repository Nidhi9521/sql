-- Note: Refer existing employee Table Select employee details from employee table if data exists in incentive table? 
-- Find Salary of the employee whose salary is more than Roy Salary Create a view to select FirstName,LastName,Salary,JoiningDate,IncentiveDate and IncentiveAmount

CREATE VIEW royGrt as
SELECT fName,lName,salary,joindate,incdate,incamount FROM employees 
INNER JOIN incentive on employees.eId=incentive.eId 
WHERE salary>(SELECT salary FROM employees WHERE fName='Roy')

SELECT * from royGrt

-- Create a view to select Select first_name, incentive amount from employee and incentives table for those employees who have incentives and incentive amount greater than 3000
CREATE VIEW incGrt as
SELECT fName,incamount FROM employees 
INNER JOIN incentive on employees.eId=incentive.eId 
WHERE incamount>3000

SELECT * from incGrt

-- (Note refer tables from sql supported files) 
-- Create a View to Find the names (first_name, last_name), job, department number, and department name of the employees who work in London 
CREATE VIEW workAt as
SELECT fName||" "||lName as names, job_id,employee.dep_id,dep_name FROM employee 
INNER JOIN department on employee.emp_id=department.dep_id
WHERE employee.c_id=(SELECT country_id from countries where country_name='London')

SELECT * from workAt

-- Create a View to get the department name and number of employees in the department. 
CREATE VIEW depData as
SELECT department.dep_name,count(*) FROM employee 
INNER JOIN department on employee.dep_id=department.dep_id
GROUP by dep_name

SELECT * from depData

-- Find the employee ID, job title, number of days between ending date and starting date for all jobs in department 90 from job history.
SELECT EmployeeId,JobHistory.Job_Id,job_title,
	(JULIANDAY(EndDate)-JULIANDAY(StartDate)) AS date_difference 
	FROM JobHistory 
	INNER JOIN jobs on JobHistory.Job_Id=jobs.job_id
	WHERE JobHistory.Job_Id=1
	

-- Write a View to display the department name, manager name, and city. 
CREATE VIEW empMan as
SELECT e.depName,e.fName,e.city,m.fName
FROM employees e INNER join employees m on e.eId=m.mId

SELECT * FROM empMan

-- Create a View to display department name, name (first_name, last_name), hire date, salary of 
-- the manager for all managers whose experience is more than 15 years.
CREATE VIEW manExp as
SELECT e.depName,e.fName||" "||e.lName,e.joindate,e.salary,(julianday('now')-julianday(e.joindate))/365 as exp
FROM employees e INNER join employees m on e.eId=m.mId
WHERE (julianday('now')-julianday(e.joindate))/365>15

SELECT * FROM manExp