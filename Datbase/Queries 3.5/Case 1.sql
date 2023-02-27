  create database if not exists queriy35_db;
 use queriy35_db;
-- Case 1
-- Create a database called "sales" with three tables: "customers", "orders", and "products".
-- The "customers" table should have the following columns: "customer_id", "first_name", "last_name", "email", and "phone".
-- The "orders" table should have the following columns: "order_id", "order_date", "customer_id", and "product_id".
-- The "products" table should have the following columns: "product_id", "product_name", "unit_price", and "description".

-- Create "customers" table
CREATE TABLE customers (
  customer_id INT PRIMARY KEY,
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  email VARCHAR(100),
  phone VARCHAR(20)
);

-- Insert data into "customers" table
INSERT INTO customers (customer_id, first_name, last_name, email, phone)
VALUES
  (1, 'John', 'Doe', 'johndoe@example.com', '555-1234'),
  (2, 'Jane', 'Smith', 'janesmith@example.com', '555-5678'),
  (3, 'Bob', 'Johnson', 'bobjohnson@example.com', '555-9101'),
  (4, 'Emily', 'Jones', 'emilyjones@example.com', '555-1212'),
  (5, 'Mark', 'Davis', 'markdavis@example.com', '555-3434');

-- Create "products" table
CREATE TABLE products (
  product_id INT PRIMARY KEY,
  product_name VARCHAR(50),
  unit_price DECIMAL(10, 2),
  description TEXT
);

-- Insert data into "products" table
INSERT INTO products (product_id, product_name, unit_price, description)
VALUES
  (1, 'Product A', 49.99, 'Description of Product A'),
  (2, 'Product B', 99.99, 'Description of Product B'),
  (3, 'Product C', 29.99, 'Description of Product C'),
  (4, 'Product D', 149.99, 'Description of Product D'),
  (5, 'Product E', 79.99, 'Description of Product E');

-- Create "orders" table
CREATE TABLE orders (
  order_id INT PRIMARY KEY,
  order_date DATE,
  customer_id INT,
  product_id INT,
  FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
  FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Insert data into "orders" table
INSERT INTO orders (order_id, order_date, customer_id, product_id)
VALUES
  (1, '2022-01-01', 1, 1),
  (2, '2022-01-02', 2, 2),
  (3, '2022-01-03', 3, 3),
  (4, '2022-01-04', 4, 4),
  (5, '2022-01-05', 5, 5),
  (6, '2022-01-06', 1, 2),
  (7, '2022-01-07', 2, 3),
  (8, '2022-01-08', 3, 4),
  (9, '2022-01-09', 4, 5),
  (10, '2022-01-10', 1, 3);

-- 1. Insert at least five customers, five products, and ten orders into the respective tables. Make sure that at least two customers have multiple orders, and at least two products are included in multiple orders.
-- 2. Write a query that retrieves the customer's first name, last name, email, and the number of orders they have placed. The results should be ordered by the number of orders in descending order.

SELECT c.first_name, c.last_name, c.email, COUNT(o.order_id) AS num_orders
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id
ORDER BY num_orders DESC;

-- 3. Write a query that retrieves the product name, the total number of orders for each product, and the total revenue generated by each product. The results should be ordered by the total revenue in descending order.
SELECT 
  p.product_name, 
  COUNT(o.order_id) AS total_orders, 
  SUM(p.unit_price) AS total_revenue 
FROM 
  products p 
  JOIN orders o ON p.product_id = o.product_id 
GROUP BY 
  p.product_name 
ORDER BY 
  total_revenue DESC;


-- 4. Write a query that retrieves the first name, last name, email, and product name for each order. The results should only include orders where the customer has placed multiple orders.
SELECT 
  c.first_name, 
  c.last_name, 
  c.email, 
  p.product_name 
FROM 
  customers c 
  JOIN orders o ON c.customer_id = o.customer_id 
  JOIN products p ON o.product_id = p.product_id 
GROUP BY 
  c.customer_id, 
  p.product_id 
HAVING 
  COUNT(o.order_id) > 1;


-- 5. Write a query that retrieves the first name, last name, and email for each customer who has placed at least one order for a product with a unit price greater than $50.
SELECT 
  c.first_name, 
  c.last_name, 
  c.email 
FROM 
  customers c 
  JOIN orders o ON c.customer_id = o.customer_id 
WHERE EXISTS (
  SELECT 
    1 
  FROM 
    products p 
  WHERE 
    p.product_id = o.product_id 
    AND p.unit_price > 50
);


-- 6. Write a query that retrieves the product name and the number of times it has been ordered, but only includes products that have been ordered more than once.

SELECT 
  p.product_name, 
  COUNT(o.order_id) AS total_orders 
FROM 
  products p 
  JOIN orders o ON p.product_id = o.product_id 
GROUP BY 
  p.product_id 
HAVING 
  COUNT(o.order_id) > 1;
