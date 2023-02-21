-- Table: Activity
-- Column Name | Type |
-- +--------------+---------+
-- | player_id | int |
-- | device_id | int |
-- | event_date | date |
-- | games_played | int |
-- SQL Schema
-- (player_id, event_date) is the primary key of this table.
-- This table shows the activity of players of some games.
-- Each row is a record of a player who logged in and played a number of games
-- (possibly 0) before logging out on someday using some device.
-- Input:
-- Activity table:
-- +-----------+-----------+------------+--------------+
-- | player_id | device_id | event_date | games_played |
-- +-----------+-----------+------------+--------------+
-- | 1 | 2 | 2016-03-01 | 5 |
-- | 1 | 2 | 2016-05-02 | 6 |
-- | 2 | 3 | 2017-06-25 | 1 |
-- | 3 | 1 | 2016-03-02 | 0 |
-- | 3 | 4 | 2018-07-03 | 5 |
-- +-----------+-----------+------------+--------------+
-- Question 1: Write an SQL query to report the first login date for each player. Return the result table in any order.
-- The query result format is in the following example.
-- Output:
-- +-----------+-------------+
-- | player_id | first_login |
-- +-----------+-------------+
-- | 1 | 2016-03-01 |
-- | 2 | 2017-06-25 |
-- | 3 | 2016-03-02 |
-- +-----------+-------------+

use products_db;
create table if not exists Table1 (
player_id int ,
device_id int  ,
event_date date ,
games_played int ,
CONSTRAINT PK_Table PRIMARY KEY (player_id,event_date)
);

insert into Table1 values 
(1,2,'2016-03-01',5),
(1,2, '2016-05-02',6 ),
( 2,3,'2017-06-2',1 ),
(3,1,'2016-03-02',0 ),
(3,4,'2018-07-03',5);

select player_id , min(event_date) from Table1 group by player_id ;

-- Question 2: Write an SQL query to report the device that is first logged in for each player. Return the result table in any order.
-- The query result format is in the following example.
-- Output:
-- +-----------+-----------+
-- | player_id | device_id |
-- +-----------+-----------+
-- | 1 | 2 |
-- | 2 | 3 |
-- | 3 | 1 |
-- +-----------+-----------+

select player_id , min(device_id) as min_device_id  from Table1 group by player_id having min(event_date);

-- Question 3: Write an SQL query to report for each player and date, how many games played so far by the player. That is, the total number of games played by the player until that date. Check the example for clarity. Return the result table in any order.
-- The query result format is in the following example.
-- Input:
-- Activity table:
-- +-----------+-----------+------------+--------------+
-- | player_id | device_id | event_date | games_played |
-- +-----------+-----------+------------+--------------+
-- | 1 | 2 | 2016-03-01 | 5 |
-- | 1 | 2 | 2016-05-02 | 6 |
-- | 1 | 3 | 2017-06-25 | 1 |
-- | 3 | 1 | 2016-03-02 | 0 |
-- | 3 | 4 | 2018-07-03 | 5 |
-- +-----------+-----------+------------+--------------+
-- Output:
-- +-----------+------------+---------------------+
-- | player_id | event_date | games_played_so_far |
-- +-----------+------------+---------------------+
-- | 1 | 2016-03-01 | 5 |
-- | 1 | 2016-05-02 | 11 |
-- | 1 | 2017-06-25 | 12 |
-- | 3 | 2016-03-02 | 0 |
-- | 3 | 2018-07-03 | 5 |
-- +-----------+------------+---------------------+
create table if not exists Activity(
player_id int,
device_id int,
event_date date,
games_played int
);
insert into Activity values (1,2,'2016-03-01',5),
(1,2,'2016-05-02',6),
(1,3,'2017-06-25',1),
(3,1,'2016-03-02',0),
(3,4,'2018-07-03',5);


SELECT player_id, event_date, 
  (SELECT SUM(games_played) 
   FROM Activity 
   WHERE player_id = a.player_id AND event_date <= a.event_date) 
   AS games_played_so_far
FROM Activity a
ORDER BY player_id, event_date;






