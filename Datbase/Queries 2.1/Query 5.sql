-- 5. Write an SQL query to report all customers who never order anything. Return the result table in any order.
-- Table: Customers
-- +-------------+---------+
-- | Column Name | Type |
-- +-------------+---------+
-- | id | int |
-- | name | varchar |
-- +-------------+---------+
-- id is the primary key column for this table.
-- Each row of this table indicates the ID and name of a customer.
-- Table: Orders
-- +-------------+------+
-- | Column Name | Type |
-- +-------------+------+
-- | id | int |
-- | customerId | int |
-- +-------------+------+
-- id is the primary key column for this table.
-- customerId is a foreign key of the ID from the Customers table.
-- Each row of this table indicates the ID of an order and the ID of the customer who ordered it.
-- The query result format is in the following example.

use products_db;

create table if not exists Customers (
id int primary key auto_increment,
Customer_Name varchar(256)
);

insert into Customers (Customer_Name) values ('Joe'),
('Henry'),
('Sam'),
('Max');

select * from Customers;

Create table if not exists Orders(
id int auto_increment primary key ,
customerId int ,
foreign key (customerId) references Customers(id) on delete cascade
);

insert into Orders (CustomerId) values (3),
(1);

Select * from Orders;

SELECT Customer_Name as Customers
FROM Customers
WHERE id NOT IN (
    SELECT customerId
    FROM Orders
);
