# Employee Management System — MySQL

## 📌 Project Overview

The Employee Management System is a relational database project built using MySQL to manage employees, departments, projects, salaries, and employee-project assignments.

The project demonstrates practical SQL and DBMS concepts including database design, constraints, CRUD operations, joins, aggregate functions, subqueries, CTEs, window functions, views, transactions, and indexing.

## 🛠️ Technologies Used

- MySQL
- SQL
- MySQL Workbench

## 🎯 Project Objectives

- Design a normalized relational database
- Manage employee and department information
- Manage company projects and employee assignments
- Perform salary and department analysis
- Practice real-world SQL queries
- Demonstrate SQL and DBMS concepts used in technical interviews

## 🗄️ Database Structure

The database contains four main tables:

### 1. Departments

Stores department information.

- Department ID
- Department Name
- Location

### 2. Employees

Stores employee information.

- Employee ID
- Name
- Email
- Phone
- Salary
- Hire Date
- Department ID

### 3. Projects

Stores project information.

- Project ID
- Project Name
- Client Name
- Budget
- Start Date
- End Date

### 4. Employee_Projects

Manages the many-to-many relationship between employees and projects.

- Employee ID
- Project ID
- Role
- Assigned Date

## 🔗 Database Relationships

- One department can have many employees.
- One employee belongs to one department.
- One employee can work on multiple projects.
- One project can have multiple employees.
- `Employee_Projects` acts as the junction table between Employees and Projects.

## 📚 SQL Concepts Covered

- Database and table creation
- Primary Keys
- Foreign Keys
- Composite Primary Keys
- UNIQUE constraints
- NOT NULL constraints
- CHECK constraints
- INSERT operations
- SELECT queries
- WHERE conditions
- ORDER BY
- DISTINCT
- BETWEEN
- LIKE
- IN
- Aggregate Functions
- GROUP BY
- HAVING
- INNER JOIN
- LEFT JOIN
- CASE
- NULL handling
- COALESCE
- Date Functions
- String Functions
- Subqueries
- Correlated Subqueries
- EXISTS
- CTEs
- Window Functions
- Views
- Transactions
- Indexing

## 📂 Project Files

| File | Description |
|---|---|
| `Employee_Management_System.sql` | Database, tables, constraints and sample data |
| `Basic_Queries.sql` | Basic and intermediate SQL queries |
| `Advanced_Queries.sql` | Advanced and interview-focused SQL queries |
| `README.md` | Project documentation |

## ▶️ How to Run

1. Install MySQL and MySQL Workbench.
2. Open MySQL Workbench.
3. Run `Employee_Management_System.sql`.
4. Execute `Basic_Queries.sql`.
5. Execute `Advanced_Queries.sql`.
6. Review the query results.

## 📊 Key Features

- Employee and department management
- Project management
- Employee-project assignment tracking
- Salary analysis
- Department-level reporting
- Advanced SQL data analysis
- Transaction management
- Database indexing

## 👨‍💻 Author

**Abhisek Swain**

B.Tech — Computer Science and Engineering