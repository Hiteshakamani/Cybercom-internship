-- 1. Create a database structure for product and categories. One product can be in more than one category and one category can have multiple products.
CREATE DATABASE IF NOT EXISTS products_db;
USE products_db;

CREATE TABLE IF NOT EXISTS category  (
  category_id INT AUTO_INCREMENT PRIMARY KEY,
  category_name VARCHAR(255) NOT NULL
);


INSERT INTO category VALUES (1 , 'Cosmatic'),
 (2 , 'Cloths'),
(3 , 'Fruits'),
(4 , 'Vegitables');

SELECT * FROM category;

CREATE TABLE IF NOT EXISTS product (
product_id int  AUTO_INCREMENT PRIMARY KEY,
product_name varchar(255) NOT NULL ,
quentity int,
product_price float NOT NULL,
product_description text
);

INSERT INTO product VALUES (1 , 'Soap' , 5, 30, 'Product 1'),

 (2 , 'Shampoo' , 5, 40, 'Product 2'),
 (3 , 'Brush' , 5, 25, 'Product 3'),
 (4 , 'Facewash' , 5, 150, 'Product 4'),
 (5 , 'Onion' , 5, 17.5, 'Product 5'),
 (6 , 'T-shirt' , 5, 500, 'Product 6');

SELECT * FROM product;

CREATE TABLE IF NOT EXISTS product_category (
  product_id INT NOT NULL,
  category_id INT NOT NULL,
  PRIMARY KEY (product_id, category_id),
  FOREIGN KEY (product_id) REFERENCES product (product_id) ON DELETE CASCADE,
  FOREIGN KEY (category_id) REFERENCES category (category_id) ON DELETE CASCADE
);

SELECT * FROM product_category;
