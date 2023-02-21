-- Write an SQL query to swap all 'f' and 'm' values (i.e., change all 'f' values to 'm' and vice versa) with a single update statement and no intermediate temporary tables.Note that you must write a single update statement, do not write any select statement for this problem.
-- Table: Salary
-- +-------------+----------+
-- | Column Name | Type |
-- +-------------+----------+
-- | id | int |
-- | name | varchar |
-- | sex | ENUM |
-- | salary | int |
-- +-------------+----------+
-- id is the primary key for this table.
-- The sex column is ENUM value of type ('m', 'f').
-- The table contains information about an employee.
-- The query result format is in the following example.

use products_db;

create table Salary(
id  int auto_increment primary key ,
name  varchar(256), 
sex ENUM('m','f'),
salary int 
);

insert into Salary (name, sex, salary) values
('A','m',2500),
('B','f',1500),
('C','m',5500),
('D','f',500);
select * from Salary ;

update Salary set sex = case sex when 'm' then 'f'
								 when 'f' then 'm'
                                 else sex end where id in (1,2,3,4) ;



