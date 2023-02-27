 use query33_db;
-- Case 2
-- Consider you’ve one employee database system. Create table
-- schema and add data according to the following queries.

CREATE TABLE IF NOT EXISTS employees (
EmployeeID INT PRIMARY KEY AUTO_INCREMENT,
FirstName VARCHAR(50),
LastName VARCHAR(50),
Title VARCHAR(50),
Department VARCHAR(50),
Salary DECIMAL(10,2),
HireDate DATE
);

INSERT INTO employees (FirstName, LastName, Title, Department, Salary, HireDate)
VALUES
('John', 'Smith', 'Manager', 'Sales', 75000.00, '1998-05-01'),
('Jane', 'Doe', 'Manager', 'Marketing', 80000.00, '2001-03-15'),
('Mike', 'Johnson', 'Salesperson', 'Sales', 45000.00, '2002-09-30'),
('Lisa', 'Wong', 'Marketing Coordinator', 'Marketing', 50000.00, '2005-07-01'),
('David', 'Kim', 'Salesperson', 'Sales', 55000.00, '2008-02-14'),
('Sarah', 'Lee', 'Marketing Manager', 'Marketing', 90000.00, '2010-09-01'),
('Tom', 'Nguyen', 'Sales Manager', 'Sales', 85000.00, '2012-06-15'),
('Emily', 'Tran', 'Marketing Coordinator', 'Marketing', 55000.00, '2015-04-01'),
('Brian', 'Liu', 'Salesperson', 'Sales', 60000.00, '2018-01-01'),
('Karen', 'Chen', 'Marketing Coordinator', 'Marketing', 52000.00, '2020-09-01');

-- Write a query that returns the first and last name of all employees who have a title that contains the word "Manager".
SELECT FirstName, LastName FROM employees WHERE Title LIKE '%Manager%';

-- Write a query that returns the department name and the average salary of all employees in each department.
SELECT Department, AVG(Salary) AS AvgSalary FROM employees GROUP BY Department;

-- Write a query that returns the number of employees who were hired in each year, sorted by year.
SELECT YEAR(HireDate) AS HireYear, COUNT(*) AS NumEmployees
FROM employees GROUP BY YEAR(HireDate) ORDER BY HireYear;

-- Write a query that returns the first name, last name, and salary of the top 10 highest-paid employees.
SELECT FirstName, LastName, Salary FROM employees ORDER BY Salary DESC LIMIT 10;

-- Write a query that updates the salary of all employees in the "Sales" department to be 10% higher than their current salary.
UPDATE employees SET Salary = Salary * 1.1 WHERE Department = 'Sales';

-- Write a query that deletes all employees who were hired before the year 2000.
DELETE FROM employees WHERE YEAR(HireDate) < 2000;

-- Write a query that creates a new table called "employee_stats" that contains the following columns: "department_name", "total_employees", and "average_salary". The table should include one row for each department.

CREATE TABLE IF NOT EXISTS employee_stats (
department_name VARCHAR(50) PRIMARY KEY,
total_employees INT,
average_salary DECIMAL(10,2)
);

INSERT INTO employee_stats (department_name, total_employees, average_salary)
SELECT Department, COUNT(*) AS NumEmployees, AVG(Salary) AS AvgSalary FROM employees GROUP BY Department;
-- 8. Write a query that returns the first and last name of all employees who have the same last name as their manager.
SELECT e1.FirstName, e1.LastName
FROM employees e1
JOIN employees e2 ON e1.ManagerId = e2.EmployeeId
WHERE e1.LastName = e2.LastName;


-- 9. Write a query that returns the top 5 departments with the highest average salary.
SELECT d.Name AS department_name, AVG(e.Salary) AS average_salary
FROM employees e
JOIN departments d ON e.DepartmentId = d.DepartmentId
GROUP BY d.DepartmentId
ORDER BY AVG(e.Salary) DESC
LIMIT 5;


-- 10. Write a query that returns the first and last name of all employees who have at least one dependent. Sort the results by last name.
SELECT e.FirstName, e.LastName
FROM employees e
JOIN (
  SELECT EmployeeId
  FROM dependents
  GROUP BY EmployeeId
) d ON e.EmployeeId = d.EmployeeId
ORDER BY e.LastName;
