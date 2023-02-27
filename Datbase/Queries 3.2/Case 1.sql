-- Case 1
-- Consider the following table structure for a blog:
-- CREATE TABLE blog_posts (
-- id INT PRIMARY KEY,
-- title VARCHAR(255),
-- body TEXT,
-- author_id INT,
-- created_at TIMESTAMP,
-- updated_at TIMESTAMP
-- );
-- CREATE TABLE blog_comments (
-- id INT PRIMARY KEY,
-- post_id INT,
-- body TEXT,
-- author_id INT,
-- created_at TIMESTAMP
-- );
-- Write a query to retrieve the title and body of the five most recent blog posts, along with the number of comments each post has.

use joins_db;

CREATE TABLE blog_posts (
id INT PRIMARY KEY,
title VARCHAR(255),
body TEXT,
author_id INT,
created_at TIMESTAMP,
updated_at TIMESTAMP
);

CREATE TABLE blog_comments (
id INT PRIMARY KEY,
post_id INT,
body TEXT,
author_id INT,
created_at TIMESTAMP
);

INSERT INTO blog_posts (id, title, body, author_id, created_at, updated_at)
VALUES 
(1, 'First blog post', 'This is the body of the first post', 1, '2022-02-21 12:00:00', '2022-02-21 12:00:00'),
(2, 'Second blog post', 'This is the body of the second post', 2, '2022-02-22 10:00:00', '2022-02-22 10:00:00'),
(3, 'Third blog post', 'This is the body of the third post', 1, '2022-02-23 09:00:00', '2022-02-23 09:00:00');

INSERT INTO blog_comments (id, post_id, body, author_id, created_at)
VALUES 
(1, 1, 'This is a comment on the first post', 2, '2022-02-21 12:30:00'),
(2, 1, 'This is another comment on the first post', 3, '2022-02-21 13:00:00'),
(3, 2, 'This is a comment on the second post', 1, '2022-02-22 11:00:00');

select p.title, p.body, COUNT(c.id) as num_comments
from blog_posts p
left join blog_comments c on p.id = c.post_id
group by  p.id
order by  p.created_at desc
limit 5;


