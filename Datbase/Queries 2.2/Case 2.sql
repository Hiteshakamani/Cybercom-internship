-- Write an SQL query to report all the classes that have at least five students. Return the result table in any order.
-- Table: Courses
-- +-------------+---------+
-- | Column Name | Type |
-- +-------------+---------+
-- | student | varchar |
-- | class | varchar |
-- +-------------+---------+
-- (student, class) is the primary key column for this table.
-- Each row of this table indicates the name of a student and the class in which they are enrolled.
-- The query result format is in the following example.
-- Example 1:
-- Input:
-- Courses table:
-- +---------+----------+
-- | student | class |
-- +---------+----------+
-- | A | Math |
-- | B | English |
-- | C | Math |
-- | D | Biology |
-- | E | Math |
-- | F | Computer |
-- | G | Math |
-- | H | Math |
-- | I | Math |
-- +---------+----------+
-- Output:
-- +---------+
-- | class |
-- +---------+
-- | Math |
-- +---------+
use products_db;


create table if not exists Courses(
student varchar(256),
class varchar(256),
CONSTRAINT PK_Course PRIMARY KEY (student,class)
);

insert into Courses values ('A','Math'),
('B','Math'),
('C','English'),
('D','Math'),
('E','Biology'),
('F','Math'),
('G','Computer'),
('H','Math'),
('I','Math');

SELECT class
FROM Courses
GROUP BY class
HAVING COUNT(DISTINCT student) >= 5;