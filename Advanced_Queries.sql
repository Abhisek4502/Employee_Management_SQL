-- Find all Employees who are not assigned to any project.
Select 
	e.emp_id, e.name AS Employee_Name, e.dept_id 
		From Employees e 
		LEFT JOIN Employee_Projects 
        ON e.emp_id= ep.emp_id 
			Where ep.emp_id IS NULL;

-- Find the number of employees in each department
Select
	d.department_name, COUNT(e.emp_id) AS Number_Of_Employees
		From Departments d
		LEFT JOIN Employees e
        ON d.dept_id = e.dept_id
        GROUP BY d.department_name
        ORDER BY Number_Of_Employees DESC;
        
-- Display each employees name, salary and a salary category based on their salary
Select
	name AS Employee_Name, salary,
    CASE
		WHEN salary >= 65000 THEN 'High'
        WHEN salary >= 50000 THEN 'Medium'
        ELSE 'Low'
	END AS Salary_Category
    From Employees
    ORDER BY salary DESC;
    
-- Find the number of employees in each group
SELECT
    CASE
        WHEN salary >= 65000 THEN 'High'
        WHEN salary >= 50000 THEN 'Medium'
        ELSE 'Low'
    END AS Salary_Category,
    COUNT(*) AS Total_Employees
FROM Employees
GROUP BY
    CASE
        WHEN salary >= 65000 THEN 'High'
        WHEN salary >= 50000 THEN 'Medium'
        ELSE 'Low'
	END
ORDER BY Total_Employees DESC;

-- Display every project with its prject name and end date
SELECT
    project_name,
    COALESCE(
        DATE_FORMAT(end_date, '%Y-%m-%d'),
        'Ongoing'
	)AS Project_Status
FROM Projects;

-- Find all Unique Clients Whose Projects are stored the databease
SELECT DISTINCT
	client_name
    From Employees
    ORDER BY client_name;
    
-- Find all employees who hired in 2024
SELECT
	name AS Employee_Name,
    hire_date,
    YEAR(hire_date) AS Joining_Year
    From Employees
    Where YEAR(hire_date) = 2024
    ORDER BY hire_date;
    
-- Display each Employees employee_name, name in upper case, name in lower case, total number of character in the name
SELECT
	name AS Employee_Name,
    UPPER(name) AS UpperCase_Name,
    LOWER(name) AS LowerCase_Name,
    LENGTH(name) AS Name_Length
    From Employees;
    
-- Find all Employees whose salary is greater then the average salaryy of all employees
SELECT
	name AS Employee_name,
    salary,
    dept_id
    From Employees
    Where salary > ( SELECT AVG(salary) From Employees)
    ORDER BY salary DESC;
    
-- Find employees whose salary is greater than the average salary of their own department
SELECT
	e.name AS Employee_Name,
    d.department_name,
    e.salary,
    (
		SELECT AVG(e2.salary)
        FROM Employees e2
        Where e2.dept_id = e.dept_id
	) AS Department_Average_Salary
FROM Employees e
INNER JOIN Departments d 
	ON e.dept_id = d.dept_id
WHERE e.salary > (
	SELECT AVG(e2.salary)
    FROM Employees e2
    Where e2.dept_id = e.dept_id
    )
ORDER BY e.salary DESC;

-- Find all employees who worl in departments whose location is either banglore or mumbai
SELECT
    e.name AS Employee_Name,
    d.department_name,
    d.location,
    e.salary
FROM Employees e
INNER JOIN Departments d
    ON e.dept_id = d.dept_id
WHERE e.dept_id IN (
    SELECT dept_id
    FROM Departments
    WHERE location IN ('Bangalore', 'Mumbai')
)
ORDER BY e.name;

-- Find all departments where at least one employee earns more than 65,000
SELECT d.department_name
FROM Departments d
WHERE EXISTS (
    SELECT 1
    FROM Employees e
    WHERE e.dept_id = d.dept_id
      AND e.salary > 65000
);

-- Using a CTE, find departments whose average salary is greater than 55000
WITH Department_Salary AS (
    SELECT
        d.department_name,
        AVG(e.salary) AS Average_Salary
    FROM Departments d
    INNER JOIN Employees e
        ON d.dept_id = e.dept_id
    GROUP BY d.department_name
)
SELECT
    department_name,
    Average_Salary
FROM Department_Salary
WHERE Average_Salary > 55000
ORDER BY Average_Salary DESC;

-- Rank employees based on their salary from highest to lowest
SELECT
    name AS Employee_Name,
    salary,
    RANK() OVER (ORDER BY salary DESC) AS Salary_Rank
FROM Employees
ORDER BY Salary_Rank;

-- Create a reusable view called employee_details that displays Employee id, employee name, department name, salary, department location
CREATE VIEW Employee_Details AS
SELECT
    e.emp_id,
    e.name AS Employee_Name,
    d.department_name,
    e.salary,
    d.location AS Department_Location
FROM Employees e
INNER JOIN Departments d
    ON e.dept_id = d.dept_id;
    
Select * from Employee_Details;

-- Temporarily increase an employee's salary by 5,000, verify the change, and then ROLLBACK the transaction so the original salary is restored
START TRANSACTION;

UPDATE Employees
SET salary = salary + 5000
WHERE emp_id = 1;

SELECT emp_id, name, salary
FROM Employees
WHERE emp_id = 1;

ROLLBACK;

-- Create a department level report showing department name, number of employees, total salary, average salary, highest salary, salary status
-- Salary status should be 
-- average salary >= 60000 -> High
-- average salary >= 50000 -> Medium
-- otherwise -> Low

SELECT
    d.department_name,
    COUNT(e.emp_id) AS Total_Employees,
    SUM(e.salary) AS Total_Salary,
    AVG(e.salary) AS Average_Salary,
    MAX(e.salary) AS Highest_Salary,
    CASE
        WHEN AVG(e.salary) >= 60000 THEN 'High'
        WHEN AVG(e.salary) >= 50000 THEN 'Medium'
        ELSE 'Low'
    END AS Salary_Status
FROM Departments d
INNER JOIN Employees e
    ON d.dept_id = e.dept_id
GROUP BY d.department_name
HAVING COUNT(e.emp_id) >= 2
ORDER BY Average_Salary DESC;

-- Indexing(Create an index on the dept_id column of the Employees table to improve searches and joins involving departments)
CREATE INDEX idx_employee_department
ON Employees(dept_id);
