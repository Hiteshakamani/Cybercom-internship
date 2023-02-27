-- Case 1
-- Assume you are working with a company that has a database containing information about employees and their departments. The database has three tables:
-- Employees table, which includes columns for employee ID, name, department ID, and salary.
-- Departments table, which includes columns for department ID and department name.
-- Salaries table, which includes columns for employee ID, salary, and date.


-- Please write SQL queries t-- Create Employees table
CREATE TABLE IF NOT EXISTS Employees (
    emp_id INT NOT NULL AUTO_INCREMENT,
    emp_name VARCHAR(50) NOT NULL,
    dept_id INT NOT NULL,
    salary INT NOT NULL,
    PRIMARY KEY (emp_id)
);

-- Create Departments table
CREATE TABLE IF NOT EXISTS Departments (
    dept_id INT NOT NULL AUTO_INCREMENT,
    dept_name VARCHAR(50) NOT NULL,
    PRIMARY KEY (dept_id)
);

-- Create Salaries table
CREATE TABLE IF NOT EXISTS Salaries (
    salary_id INT NOT NULL AUTO_INCREMENT,
    emp_id INT NOT NULL,
    salary INT NOT NULL,
    date DATE NOT NULL,
    PRIMARY KEY (salary_id),
    FOREIGN KEY (emp_id) REFERENCES Employees(emp_id)
);

-- Insert sample data into Departments table
INSERT INTO Departments (dept_name) VALUES ('Sales'),
('Marketing'),
 ('Finance'),
('IT');

-- Insert sample data into Employees table
INSERT INTO Employees (emp_name, dept_id, salary) VALUES ('John Doe', 1, 50000),
('Jane Smith', 2, 60000),
 ('Bob Johnson', 1, 55000),
 ('Emily Davis', 3, 70000),
 ('David Lee', 4, 80000);

-- Insert sample data into Salaries table
INSERT INTO Salaries (emp_id, salary, date) VALUES (1, 50000, '2022-01-01'),
(2, 60000, '2022-01-01'),
 (3, 55000, '2022-01-01'),
 (4, 70000, '2022-01-01'),
(5, 80000, '2022-01-01'),
 (1, 55000, '2022-02-01'),
 (2, 65000, '2022-02-01'),
 (3, 60000, '2022-02-01'),
 (4, 75000, '2022-02-01'),
 (5, 90000, '2022-02-01');

-- 1. Write a query to return the names of all employees who work in the 'Sales' department.
SELECT e.emp_name
FROM Employees e
JOIN Departments d ON e.department_id = d.department_id
WHERE d.dept_name = 'Sales';



-- 2. Write a query to return the total number of employees in each department, ordered by department name.
SELECT Departments.department_name, COUNT(Employees.employee_id) AS num_employees
FROM Departments
JOIN Employees ON Departments.department_id = Employees.department_id
GROUP BY Departments.department_id
ORDER BY Departments.department_name;


-- 3. Write a query to return the average salary for each department, ordered by department name.
SELECT Departments.department_name, AVG(Salaries.salary) AS avg_salary
FROM Departments
JOIN Employees ON Departments.department_id = Employees.department_id
JOIN Salaries ON Employees.employee_id = Salaries.employee_id
GROUP BY Departments.department_id
ORDER BY Departments.department_name;


-- 4. Write a query to return the top 10% of highest paid employees, ordered by salary.
SELECT name, salary
FROM Employees
JOIN Salaries ON Employees.employee_id = Salaries.employee_id
ORDER BY salary DESC
LIMIT (SELECT COUNT(*) * 0.1 FROM Employees);

-- 5. Write a query to return the salary of each employee for their latest salary entry.
SELECT Employees.name, Salaries.salary
FROM Employees
JOIN Salaries ON Employees.employee_id = Salaries.employee_id
WHERE Salaries.date = (
    SELECT MAX(date)
    FROM Salaries
    WHERE employee_id = Employees.employee_id
);
