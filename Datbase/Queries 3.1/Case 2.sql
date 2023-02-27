-- Case 2
-- Consider the following table structure for a store's inventory:
-- CREATE TABLE inventory (
-- id INT PRIMARY KEY,
-- name VARCHAR(255),
-- quantity INT,
-- price DECIMAL(10,2),
-- category VARCHAR(50)
-- );
-- Write a query to retrieve the name and price of all items in the inventory where the quantity is greater than 0 and the category is 'electronics', sorted in descending order by price.

use joins_db;

CREATE TABLE inventory (
id INT PRIMARY KEY,
name VARCHAR(255),
quantity INT,
price DECIMAL(10,2),
category VARCHAR(50)
);

INSERT INTO inventory (id, name, quantity, price, category)
VALUES 
  (1, 'Widget A', 100, 9.99, 'electronics'),
  (2, 'Widget B', 50, 19.99, 'Widgets'),
  (3, 'Gadget C', 25, 49.99, 'electronics'),
  (4, 'Thingamabob D', 10, 99.99, 'Thingamabobs');

select name, price from inventory where quantity > 0 and category =  'electronics' order by price desc;



