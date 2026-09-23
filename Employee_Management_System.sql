CREATE DATABASE employee_management;
USE employee_management;

CREATE TABLE Departments(
	dept_id INT PRIMARY KEY,
    department_name VARCHAR(50) NOT NULL UNIQUE,
    location VARCHAR(50) NOT NULL
    );
    
CREATE TABLE Employees (
	emp_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone VARCHAR(15) UNIQUE,
    salary DECIMAL(10,2) CHECK (salary > 0),
    hire_date DATE NOT NULL,
    dept_id INT,
    
    FOREIGN KEY (dept_id) REFERENCES Departments(dept_id)
    );
    
CREATE TABLE Projects (
	project_id INT PRIMARY KEY,
    project_name VARCHAR(100) NOT NULL UNIQUE,
    client_name VARCHAR(100) NOT NULL,
    budget DECIMAL(12,2) CHECK (budget > 0),
    start_date DATE NOT NULL,
    end_date DATE
    );
    
CREATE TABLE Employee_projects (
	emp_id INT,
    project_id INT,
    role VARCHAR(50) NOT NULL,
    assigned_date DATE NOT NULL,
    
    PRIMARY KEY (emp_id, project_id),
    
    FOREIGN KEY (emp_id) REFERENCES Employees(emp_id),
    FOREIGN KEY (project_id) REFERENCES Projects(project_id)
    );
    
SHOW TABLES;
DESCRIBE Departments;
DESCRIBE Employees;
DESCRIBE Projects;
DESCRIBE Employee_Projects;

INSERT INTO Departments(dept_id, department_name, location)
VALUES
	(101, 'IT', 'Banglore'),
    (102, 'Huamn Resource', 'Hyderabad'),
    (103, 'Finance', 'Mumbaui'),
    (104, 'Marketing', 'Delhi'),
    (105, 'Sales', 'Pune');
    
Select * From Departments;

INSERT INTO Employees
    (emp_id, name, email, phone, salary, hire_date, dept_id)
VALUES
    (1, 'Rahul Sharma', 'rahul.sharma@email.com', '9876500001', 55000.00, '2024-01-15', 101),
    (2, 'Amit Kumar', 'amit.kumar@email.com', '9876500002', 65000.00, '2023-06-20', 101),
    (3, 'Priya Singh', 'priya.singh@email.com', '9876500003', 48000.00, '2024-03-10', 102),
    (4, 'Raj Patel', 'raj.patel@email.com', '9876500004', 75000.00, '2022-11-05', 101),
    (5, 'Sneha Das', 'sneha.das@email.com', '9876500005', 58000.00, '2023-08-12', 103),
    (6, 'Karan Mehta', 'karan.mehta@email.com', '9876500006', 62000.00, '2022-05-18', 102),
    (7, 'Neha Verma', 'neha.verma@email.com', '9876500007', 58000.00, '2024-02-22', 103),
    (8, 'Arjun Rao', 'arjun.rao@email.com', '9876500008', 52000.00, '2024-07-01', 104),
    (9, 'Pooja Nair', 'pooja.nair@email.com', '9876500009', 47000.00, '2023-09-25', 105),
    (10, 'Vikram Joshi', 'vikram.joshi@email.com', '9876500010', 68000.00, '2022-12-15', 105),
    (11, 'Ananya Roy', 'ananya.roy@email.com', NULL, 60000.00, '2024-05-30', 104),
    (12, 'Rohit Sen', 'rohit.sen@email.com', '9876500012', 45000.00, '2025-01-10', 102);
    
Select * From Employees;

INSERT INTO Projects
    (project_id, project_name, client_name, budget, start_date, end_date)
VALUES
    (201, 'Banking Portal', 'ABC Bank', 500000.00, '2024-01-10', '2024-12-31'),
    (202, 'HR Management System', 'XYZ Corporation', 350000.00, '2024-03-15', '2025-02-28'),
    (203, 'E-Commerce Platform', 'ShopEasy', 750000.00, '2024-06-01', NULL),
    (204, 'Customer Analytics', 'DataCorp', 450000.00, '2024-08-20', '2025-06-30'),
    (205, 'Mobile Banking App', 'ABC Bank', 600000.00, '2025-01-15', NULL),
    (206, 'Sales Dashboard', 'GlobalSales Ltd', 300000.00, '2025-02-10', NULL);

Select * From Projects;

INSERT INTO Employee_Projects
    (emp_id, project_id, role, assigned_date)
VALUES
    (1, 201, 'Backend Developer', '2024-01-15'),
    (2, 201, 'Senior Developer', '2024-01-15'),
    (4, 201, 'Project Lead', '2024-01-12'),

    (3, 202, 'HR Analyst', '2024-03-20'),
    (6, 202, 'Backend Developer', '2024-03-20'),

    (2, 203, 'Technical Lead', '2024-06-05'),
    (5, 203, 'Finance Analyst', '2024-06-10'),
    (7, 203, 'Business Analyst', '2024-06-10'),

    (8, 204, 'Frontend Developer', '2024-08-25'),
    (11, 204, 'Data Analyst', '2024-08-25'),

    (4, 205, 'Project Lead', '2025-01-20'),
    (6, 205, 'Backend Developer', '2025-01-20'),
    (10, 205, 'Sales Analyst', '2025-01-25'),

    (9, 206, 'Sales Executive', '2025-02-15'),
    (10, 206, 'Sales Lead', '2025-02-15');
    
Select * From Employee_Projects;

