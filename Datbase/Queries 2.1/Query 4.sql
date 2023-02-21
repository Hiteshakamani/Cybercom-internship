-- Write an SQL query to delete all the duplicate emails, keeping only one unique email with the smallest id. Return the result table in any order.
-- Table: Person
-- +-------------+---------+
-- | Column Name | Type |
-- +-------------+---------+
-- | id | int |
-- | email | varchar |
-- +-------------+---------+
-- id is the primary key column for this table.
-- Each row of this table contains an email. The emails will not contain uppercase letters.
-- The query result format is in the following example.
-- Example 1:
-- Input:
-- Person table:
-- +----+------------------+
-- | id | email |
-- +----+------------------+
-- | 1 | john@example.com |
-- | 2 | bob@example.com |
-- | 3 | john@example.com |
-- +----+------------------+
-- Output:
-- +----+------------------+
-- | id | email |
-- +----+------------------+
-- | 1 | john@example.com |
-- | 2 | bob@example.com |
-- +----+------------------+

use products_db;
 create table if not exists Person (
 id int auto_increment primary key,
 email varchar(256) not null
 );
 
 insert into Person (email) values ('john@example.com'),
('bob@example.com'),
('john@example.com ');

DELETE FROM Person
WHERE id NOT IN (
    SELECT MIN(id) 
    FROM Person 
    GROUP BY email
);

