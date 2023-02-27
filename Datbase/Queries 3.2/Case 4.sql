-- Case 4
-- Consider a table called "orders" with the following columns: "id", "customer_id", "order_date", "total_amount". Write a SQL query to calculate the total amount of orders f


use joins_db;

create table if not exists orders(
id int ,
customer_id int,
order_date date,
total_amount int 
);
insert into orders (id, customer_id, order_date, total_amount) VALUES
(1, 101, '2022-02-21', 5000),
(2, 102, '2022-02-21', 2000),
(3, 103, '2022-02-20', 7500),
(4, 104, '2022-02-20', 10000),
(5, 105, '2022-02-19', 3500),
(6, 106, '2022-02-19', 6000),
(7, 107, '2022-02-18', 8000),
(8, 108, '2022-02-17', 9000),
(9, 109, '2022-02-16', 1000),
(10, 110, '2022-02-16', 15000);

select customer_id,sum(total_amount) as total_amount from orders group by customer_id order by total_amount desc;