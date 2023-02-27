create database if not exists query51_db;
 use query51_db;
 
 -- create tables
CREATE TABLE customers (
  customer_id INT PRIMARY KEY,
  name VARCHAR(255),
  email VARCHAR(255)
);

CREATE TABLE products (
  product_id INT PRIMARY KEY,
  name VARCHAR(255),
  price DECIMAL(10,2)
);



CREATE TABLE orders (
  order_id INT PRIMARY KEY,
  customer_id INT,
  order_date DATE,
  country varchar(256),
  FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

create table if not exists employees (
id int  primary key auto_increment,
first_name varchar(256),
last_name varchar(256),
salary int ,
department_id int
);

CREATE TABLE order_details (
  order_id INT,
  product_id INT,
  quantity INT,
  employee_id int,
  unit_price float,
  quantity_sold int,
  FOREIGN KEY (order_id) REFERENCES orders(order_id),
  FOREIGN KEY (product_id) REFERENCES products(product_id),
  foreign key (employee_id) references employees(id)
);



-- insert data
INSERT INTO customers (customer_id, name, email) VALUES
(1, 'John Doe', 'john.doe@example.com'),
(2, 'Jane Smith', 'jane.smith@example.com'),
(3, 'Bob Johnson', 'bob.johnson@example.com');

INSERT INTO products (product_id, name, price) VALUES
(1, 'Product A', 9.99),
(2, 'Product B', 19.99),
(3, 'Product C', 29.99),
(4, 'Product D', 39.99),
(5, 'Product E', 49.99);

INSERT INTO orders (order_id, customer_id, order_date,country) VALUES
(1, 1, '2022-01-01','India'),
(2, 2, '2022-01-02','India'),
(3, 1, '2023-01-03','America'),
(4, 3, '2023-01-04','Canada'),
(5, 2, '2023-01-05','Bangladesh');

INSERT INTO order_details (order_id, product_id, quantity,employee_id,unit_price,quantity_sold) VALUES
(1, 1, 15,1,10.23,14),
(1, 2, 20,2,55.7,15),
(2, 3, 18,3,33.9,15),
(3, 2, 100,4,76.5,90),
(4, 5, 267,1,23.78,222),
(5, 4, 333,2,45.8,275),
(5, 5, 143,3,56.7,45);

insert into employees values (1,'Paresh','ABC',30000,1),
(2,'Suresh','ABC',40000,1),
(3,'Mahesh','DEF',50000,2),
(4,'Mohan','GHI',40000,3),
(5,'Abhay','JKL',30000,4),
(6,'Dhaval','MNO',80000,1);
-- 1. Write a SQL query to retrieve the top 10 customers who have made the most orders in the "orders" table, along with the total number of orders they have made.
SELECT c.name, COUNT(o.order_id) AS num_orders
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id
ORDER BY num_orders DESC
LIMIT 10;

-- 2. Write a SQL query to retrieve the names of all employees who have sold more than $100,000 worth of products in the "order_details" table, sorted by the amount sold in descending order.

SELECT employees.name, SUM(order_details.quantity_sold) as total_sales
FROM order_details
JOIN employees ON order_details.employee_id = employees.id
GROUP BY employees.name
HAVING total_sales > 100
ORDER BY total_sales DESC;



-- 3. Write a SQL query to retrieve the names of all customers who have made orders in the "orders" table, along with the total amount they have spent on all orders and the total amount they have spent on orders made in the last 30 days.
SELECT c.name, SUM(od.quantity * od.unit_price) AS total_spent, AVG(od.quantity * od.unit_price) AS avg_spent
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_details od ON o.order_id = od.order_id
GROUP BY c.customer_id;


-- 4. Write a SQL query to retrieve the names and salaries of all employees who have a salary greater than the average salary of all employees in the "employees" table, sorted by salary in descending order.
SELECT e.first_name, e.last_name, e.salary
FROM employees e
WHERE e.salary > (
  SELECT AVG(salary)
  FROM employees
) 
ORDER BY e.salary DESC;


-- 5. Write a SQL query to retrieve the names of all customers who have made orders in the "orders" table, but have not made any orders in the last 90 days.
SELECT c.name
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
WHERE NOT EXISTS (
  SELECT *
  FROM orders o2
  JOIN order_details od ON o2.order_id = od.order_id
  JOIN products p ON od.product_id = p.product_id
  WHERE o2.customer_id = c.customer_id AND p.price > 100
);

-- 6. Write a SQL query to retrieve the names and salaries of all employees who have a salary greater than the minimum salary of their department in the "employees" table, sorted by department ID and then by salary in descending order.
SELECT e.first_name, e.last_name, e.salary
FROM employees e
WHERE e.salary > (
  SELECT MIN(salary)
  FROM employees e2
  WHERE e2.department_id = e.department_id
)
ORDER BY e.department_id, e.salary DESC;


-- 7. Write a SQL query to retrieve the names and salaries of the five highest paid employees in each department of the "employees" table, sorted by department ID and then by salary in descending order.
SELECT e1.department_id, e1.first_name, e1.last_name, e1.salary
FROM employees e1
WHERE (
  SELECT COUNT(*)
  FROM employees e2
  WHERE e2.department_id = e1.department_id AND e2.salary >= e1.salary
) <= 5
ORDER BY e1.department_id, e1.salary DESC;


-- 8. Write a SQL query to retrieve the names of all customers who have made orders in the "orders" table, but have not made any orders for products in the "products" table with a price greater than $100.
SELECT DISTINCT c.name
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
WHERE NOT EXISTS (
  SELECT *
  FROM order_details od
  JOIN products p ON od.product_id = p.product_id
  WHERE od.order_id = o.customer_id AND p.price > 100
);

-- 9. Write a SQL query to retrieve the names of all customers who have made orders in the "orders" table, along with the total amount they have spent on all orders and the average amount they have spent per order.
SELECT c.name, SUM(od.quantity * od.unit_price) AS total_spent, AVG(od.quantity * od.unit_price) AS avg_spent
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_details od ON o.order_id = od.order_id
GROUP BY c.customer_id;

-- 10. Write a SQL query to retrieve the names of all products in the "products" table that have been ordered by customers in more than one country, along with the names of the countries where the products have been ordered.
SELECT p.name, GROUP_CONCAT(DISTINCT o.country ORDER BY o.country SEPARATOR ', ') AS countries_ordered
FROM products p
JOIN order_details od ON p.product_id = od.product_id
JOIN orders o ON od.order_id = o.order_id
GROUP BY p.product_id
HAVING COUNT(DISTINCT o.country) > 1;
