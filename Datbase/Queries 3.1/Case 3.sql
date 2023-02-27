-- Case 3
-- Consider the following table structure for a sales database:
-- CREATE TABLE sales (
-- id INT PRIMARY KEY,
-- date DATE,
-- customer_id INT,
-- product_id INT,
-- quantity INT,
-- total_price DECIMAL(10,2)
-- );
-- Write a query to retrieve the total sales for each month in the year 2021, sorted in ascending order by month.


use joins_db;

CREATE TABLE sales (
id INT PRIMARY KEY,
date DATE,
customer_id INT,
product_id INT,
quantity INT,
total_price DECIMAL(10,2)
);

INSERT INTO sales (id, date, customer_id, product_id, quantity, total_price)
VALUES
(1, '2021-01-01', 1001, 101, 2, 25.00),
(2, '2021-01-02', 1002, 102, 3, 45.00),
(3, '2021-02-03', 1003, 103, 1, 12.50),
(4, '2021-02-04', 1001, 104, 2, 30.00),
(5, '2021-03-05', 1002, 105, 1, 15.00);

select month(date) as month , sum(total_price) as total_sales from sales where year(date) = 2021 group by month(date) order by month asc;



