-- Case 1
-- Consider a table called "books" with the following columns: "id", "title", "author", "publication_year". Write a SQL query to retrieve the title and author of the oldest book in the table.

create database if not exists query33_db;
use query33_db;
create table if not exists books (
id int ,
title varchar(256),
author varchar(256),
publication_year int 
);

insert into books (id, title, author, publication_year)
values
(1, 'To Kill a Mockingbird', 'Harper Lee', 1960),
(2, '1984', 'George Orwell', 1949),
(3, 'The Great Gatsby', 'F. Scott Fitzgerald', 1925),
(4, 'Pride and Prejudice', 'Jane Austen', 1813),
(5, 'The Catcher in the Rye', 'J.D. Salinger', 1951),
(6, 'One Hundred Years of Solitude', 'Gabriel Garcia Marquez', 1967),
(7, 'Brave New World', 'Aldous Huxley', 1932),
(8, 'Beloved', 'Toni Morrison', 1987),
(9, 'Moby Dick', 'Herman Melville', 1851),
(10, 'The Sun Also Rises', 'Ernest Hemingway', 1926);


select title , author from books where publication_year = (select min(publication_year) from books) ;
