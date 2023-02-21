-- Write an SQL query to create index on the email column.
-- +-------------+---------+
-- | Column Name | Type |
-- +-------------+---------+
-- | id | int |
-- | email | varchar |
-- +-------------+---------+
use products_db;

create table if not exists abc (
id int ,
email varchar(256)
);

create index def on abc (email);
