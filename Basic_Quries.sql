-- Query 1
Select * From Employees;

-- Query 2
SELECT emp_id, name, salary From Employees;

-- Query 3
SELECT name, salary From Employees Where salary > 60000;

-- Filtering & Sorting
Select name, salary From Employees ORDER BY salary DESC;

-- Find Employees in IT
Select name, salary, dept_id From Employees Where dept_id = 101;

-- Find Employees salary Between 50000 and 65000
Select name, salary From Employees Where salary BETWEEN 50000 AND 65000;

-- Find Employees Whose name starts with 'A'
Select name From Employees Where name LIKE 'A%';

-- Find Employees from IT or Finance
Select name, dept_id, salary From Employees Where dept_id IN (101, 103);

-- Aggregate Queries
-- Count Total Employees
Select COUNT(*) AS Total_Employee From Employees;

-- Salary Statistics Together
Select SUM(salary) AS Total_Salary,
	   AVG(salary) AS Average_Salary,
       MAX(salary) AS Highest_Salary,
       MIN(salary) AS Lowest_Salary
       From Employees;
       
-- Department Salary Analysis
-- JOINS
SELECT
    d.department_name,
    COUNT(e.emp_id) AS Total_Employees,
    SUM(e.salary) AS Total_Salary,
    AVG(e.salary) AS Average_Salary,
    MAX(e.salary) AS Highest_Salary,
    MIN(e.salary) AS Lowest_Salary
FROM Departments d
LEFT JOIN Employees e
    ON d.dept_id = e.dept_id
GROUP BY d.department_name
ORDER BY Average_Salary DESC;

-- Department Filtering With HAVING
SELECT
    d.department_name,
    COUNT(e.emp_id) AS Total_Employees,
    SUM(e.salary) AS Total_Salary,
    AVG(e.salary) AS Average_Salary
FROM Departments d
LEFT JOIN Employees e
    ON d.dept_id = e.dept_id
GROUP BY d.department_name
HAVING SUM(e.salary) > 150000
ORDER BY Total_Salary DESC;

-- Employeee & Department Details
SELECT
    e.emp_id,
    e.name AS Employee_Name,
    e.email,
    e.salary,
    d.department_name,
    d.location AS Department_Location
FROM Employees e
INNER JOIN Departments d
    ON e.dept_id = d.dept_id
ORDER BY e.salary DESC;

-- Employeees Working on Projects
SELECT
    e.emp_id,
    e.name AS Employee_Name,
    p.project_name,
    p.client_name,
    ep.role AS Project_Role,
    ep.assigned_date
FROM Employees e
INNER JOIN Employee_Projects ep
    ON e.emp_id = ep.emp_id
INNER JOIN Projects p
    ON ep.project_id = p.project_id
ORDER BY e.name, p.project_name;

-- Project Employee Count
SELECT
    p.project_id,
    p.project_name,
    p.client_name,
    COUNT(ep.emp_id) AS Total_Employees
FROM Projects p
LEFT JOIN Employee_Projects ep
    ON p.project_id = ep.project_id
GROUP BY
    p.project_id,
    p.project_name,
    p.client_name
ORDER BY Total_Employees DESC;

