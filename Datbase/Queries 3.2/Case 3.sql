-- Case 3
-- Consider a table called "employees" with the following columns: "id", "name", "department", "salary". Write a SQL query to retrieve the names and salaries of all employees in the "sales" department who earn more than $50,000 per year.

use joins_db;

create table if not exists employees (
id int ,
name varchar(256),
department varchar(256) ,
salary int
);

insert into employees (id,name, department, salary) 
values
(1,'John Smith', 'sales', 60000),
(2, 'jane doe', 'sales', 38000),
(3, 'Bob johnson', 'electronics', 30000),
(4,'vijay rao', 'education', 63000),
(5, 'juhi chavda', 'communication', 42000),
(6, 'suresh patil', 'sales', 55000);

select name, salary 
from employees
where department = 'sales' and salary > 50000;