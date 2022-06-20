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