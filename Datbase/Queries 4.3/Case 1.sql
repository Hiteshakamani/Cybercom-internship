use query41_db;

-- Case 1
-- Assume you are given access to a database with two tables: users and orders. The users table contains the following columns:
-- id (integer)
-- name (text)
-- email (text)
-- password (text)
-- created_at (timestamp)
-- updated_at (timestamp)
-- The orders table contains the following columns:
-- id (integer)
-- user_id (integer)
-- amount (float)
-- created_at (timestamp)
-- updated_at (timestamp)

CREATE TABLE IF NOT EXISTS users (
    id INT NOT NULL AUTO_INCREMENT,
    name TEXT NOT NULL,
    email TEXT NOT NULL,
    password TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS orders (
    id INT NOT NULL AUTO_INCREMENT,
    user_id INT NOT NULL,
    amount FLOAT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);



-- Please write SQL queries to accomplish the following tasks:
-- 1. Create a new user with the following information:
-- name: John Doe
-- email: john.doe@example.com
-- password: 123456
-- created_at: current timestamp
-- updated_at: current timestamp

INSERT INTO users (name, email, password, created_at, updated_at)
VALUES ('John Doe', 'john.doe@example.com', '123456', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- 2. Retrieve the names and email addresses of all users who have placed at least one order.
SELECT DISTINCT u.name, u.email
FROM users u
INNER JOIN orders o ON u.id = o.user_id;

-- 3. Retrieve the total amount of orders placed by each user, sorted in descending order of total amount.
SELECT u.id, u.name, SUM(o.amount) AS total_amount
FROM users u
INNER JOIN orders o ON u.id = o.user_id
GROUP BY u.id
ORDER BY total_amount DESC;

-- 4. Retrieve the email address of the user who has placed the most orders.
SELECT u.email
FROM users u
INNER JOIN (
  SELECT user_id, COUNT(*) AS order_count
  FROM orders
  GROUP BY user_id
  ORDER BY order_count DESC
  LIMIT 1
) o ON u.id = o.user_id;


-- 5. Retrieve the user IDs and the total amount of orders placed by users who have placed at least one order and whose total amount of orders exceeds $100.

SELECT u.id, SUM(o.amount) AS total_amount
FROM users u
INNER JOIN orders o ON u.id = o.user_id
GROUP BY u.id
HAVING total_amount > 100;

-- 6. Retrieve the number of users who have not placed any orders.
SELECT COUNT(*) AS num_users_without_orders
FROM users u
LEFT JOIN orders o ON u.id = o.user_id
WHERE o.user_id IS NULL;

-- 7. Update the user with ID 1 to change their email address to "jane.doe@example.com".
UPDATE users
SET email = 'jane.doe@example.com'
WHERE id = 1;

-- 8. Delete all orders placed by users whose email address contains the string "test".
DELETE FROM orders
WHERE user_id IN (
  SELECT id
  FROM users
  WHERE email LIKE '%test%'
);

-- 9. Retrieve the total amount of orders placed on each day of the current week, grouped by day.
SELECT DATE(created_at) AS order_date, SUM(amount) AS total_amount
FROM orders
WHERE YEARWEEK(created_at) = YEARWEEK(CURRENT_TIMESTAMP)
GROUP BY order_date;

-- 10. Retrieve the IDs and email addresses of users who have placed an order in the current year and whose email address is in the format "example.com".

SELECT id, email
FROM users
WHERE id IN (
  SELECT user_id
  FROM orders
  WHERE YEAR(created_at) = YEAR(CURRENT_TIMESTAMP)
)
AND email LIKE '%@example.com';

