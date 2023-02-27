-- Case 2
-- Consider the following table structure for a social media platform:
-- CREATE TABLE users (
-- id INT PRIMARY KEY,
-- name VARCHAR(255),
-- created_at TIMESTAMP
-- );
-- CREATE TABLE posts (
-- id INT PRIMARY KEY,
-- user_id INT,
-- body TEXT,
-- created_at TIMESTAMP
-- );
-- CREATE TABLE likes (
-- id INT PRIMARY KEY,
-- user_id INT,
-- post_id INT,
-- created_at TIMESTAMP
-- );
-- Write a query to retrieve the name and number of posts for each user who joined the platform in the year 2022, along with the total number of likes received for each user's posts.

use joins_db;

CREATE TABLE users (
id INT PRIMARY KEY,
name VARCHAR(255),
created_at TIMESTAMP
);

CREATE TABLE posts (
id INT PRIMARY KEY,
user_id INT,
body TEXT,
created_at TIMESTAMP
);

CREATE TABLE likes (
id INT PRIMARY KEY,
user_id INT,
post_id INT,
created_at TIMESTAMP
);

INSERT INTO users (id, name, created_at) VALUES
(1, 'John', '2022-02-20 10:30:00'),
(2, 'Jane', '2022-02-21 15:20:00'),
(3, 'Bob', '2022-02-21 18:00:00');

INSERT INTO posts (id, user_id, body, created_at) VALUES
(1, 1, 'This is my first post', '2022-02-20 11:00:00'),
(2, 2, 'I love SQL queries!', '2022-02-21 15:30:00'),
(3, 1, 'Another post from John', '2022-02-21 16:00:00'),
(4, 3, 'Hello World!', '2022-02-21 18:30:00');

INSERT INTO likes (id, user_id, post_id, created_at) VALUES
(1, 2, 1, '2022-02-20 11:30:00'),
(2, 1, 2, '2022-02-21 16:30:00'),
(3, 3, 2, '2022-02-21 17:00:00'),
(4, 2, 4, '2022-02-21 19:00:00');

select u.name, COUNT(p.id) as num_posts, SUM(l.id is not null) as num_likes
from users u
join posts p on u.id = p.user_id
left join likes l on p.id = l.post_id
where year(u.created_at) = 2022
group by u.id
order by num_posts desc;





