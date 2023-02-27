-- Case 2
-- Create a table called "employees" with the following columns: "id" (integer, primary key), "name" (text), "age" (integer), and "salary" (integer).
-- Insert the following data into the "employees" table:
-- id name age salary
-- 1 John 35 60000
-- 2 Mary 27 50000
-- 3 Peter 42 75000
-- 4 Olivia 29 55000
-- 5 Michael 38 80000




use query33_db;

create table if not exists employees (
id int primary key auto_increment,
name text,
age int ,
salary int
);

insert into employees (name , age , salary)values
('John' , 35 , 60000),
('Mary' , 27 , 50000),
('Peter' , 42 , 75000),
('Olivia',29,55000 ),
('Michael' , 38 , 80000);

-- 1. Write a SQL query to select all employees from the
-- "employees" table.

select name from employees;

-- 2. Write a SQL query to select the name and salary of all
-- employees with a salary greater than 60000.

select name , salary from employees where salary > 60000;

-- 3. Write a SQL query to update Peter's age to 43.

 update employees set age = 43 where id = (select id from employees where  name = 'Peter '); 
 
 update employees join (select id from employees where name = 'Peter') as p on employees.id = p.id set age = 43;
-- 4. Write a SQL query to delete the employee with the id of 4.

delete from employees where id = 4;

-- 5. Write a SQL query to calculate the average salary of all
-- employees.

select avg(salary) as avg_salary from employees;

-- 6. Write a SQL query to select the name and age of the oldest
-- employee.

select name ,age as max_age from employees where age = (select max(age) from employees ) ;

-- 7. Write a SQL query to select the name and age of the
-- youngest employee.

select name , age as min_age from employees where age = (select min(age) from employees) ;

-- 8. Write a SQL query to select the name of the employee with
-- the highest salary.

select name , max(salary) as high_salary from employees  group by name order by high_salary desc;



