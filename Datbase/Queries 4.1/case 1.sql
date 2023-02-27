create database if not exists query41_db;
use query41_db;

-- Case 1
-- Assume that you are working with a database containing information about a bookstore. The database has several tables:
-- books table containing information about all books in the bookstore. The table has the following columns:
-- id: unique identifier for each book
-- title: title of the book
-- author_id: foreign key pointing to the authors table
-- publication_date: publication date of the book
-- authors table containing information about all authors of the
-- books in the bookstore. The table has the following columns:
-- id: unique identifier for each author
-- name: name of the author
-- book_categories table containing information about all categories of books in the bookstore. The table has the following columns:
-- id: unique identifier for each category
-- name: name of the category
-- book_category_mappings table containing information about which books belong to which categories. The table has the following columns:
-- id: unique identifier for each mapping
-- book_id: foreign key pointing to the books table
-- category_id: foreign key pointing to the book_categories table
CREATE TABLE authors (
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS book_categories (
     id INT NOT NULL AUTO_INCREMENT,
     name VARCHAR(255) NOT NULL,
     PRIMARY KEY (id)
 );

CREATE TABLE IF NOT EXISTS books (
     id INT NOT NULL AUTO_INCREMENT,
     title VARCHAR(255) NOT NULL,
     author_id INT NOT NULL,
     publication_date DATE NOT NULL,
     PRIMARY KEY (id),
     FOREIGN KEY (author_id) REFERENCES authors(id)
 );

CREATE INDEX idx_books_id ON books (id);
 
CREATE TABLE IF NOT EXISTS book_category_mappings (
     id INT NOT NULL AUTO_INCREMENT,
     book_id INT NOT NULL,
     category_id INT NOT NULL,
     PRIMARY KEY (id),
     FOREIGN KEY (book_id) REFERENCES books(id),
     FOREIGN KEY (category_id) REFERENCES book_categories(id)
 );

INSERT INTO authors (name) VALUES ('Jane Austen'), ('Charles Dickens'), ('Leo Tolstoy');

INSERT INTO books (title, author_id, publication_date) VALUES
('Pride and Prejudice', 1, '1813-01-28'),
('Sense and Sensibility', 1, '1811-10-30'),
('David Copperfield', 2, '1850-05-01'),
('Oliver Twist', 2, '1838-02-01'),
('War and Peace', 3, '1869-01-01'),
('Anna Karenina', 3, '1877-01-01');

INSERT INTO book_categories (name) VALUES ('Fiction'), ('Non-Fiction');

INSERT INTO book_category_mappings (book_id, category_id) VALUES
(1, 1), (2, 1), (3, 1), (4, 1), (5, 1), (6, 1),
(5, 2), (6, 2);


INSERT INTO authors (name) VALUES ('Jane Austen'), ('William Shakespeare'), ('Charles Dickens'), ('Mark Twain'), ('J.K. Rowling');

INSERT INTO books (title, author_id, publication_date) VALUES
    ('Pride and Prejudice', 1, '1813-01-28'),
    ('Emma', 1, '1815-12-23'),
    ('Hamlet', 2, '1603-01-01'),
    ('Macbeth', 2, '1623-01-01'),
    ('Oliver Twist', 3, '1838-01-01'),
    ('Great Expectations', 3, '1861-01-01'),
    ('The Adventures of Tom Sawyer', 4, '1876-01-01'),
    ('The Adventures of Huckleberry Finn', 4, '1884-01-01'),
    ('Harry Potter and the Philosopher''s Stone', 5, '1997-06-26'),
    ('Harry Potter and the Chamber of Secrets', 5, '1998-07-02');

INSERT INTO book_categories (name) VALUES ('Fiction'), ('Non-fiction');

INSERT INTO book_category_mappings (book_id, category_id) VALUES
    (1, 1),
    (2, 1),
    (3, 1),
    (4, 1),
    (5, 1),
    (6, 1),
    (7, 1),
    (8, 1),
    (9, 1),
    (10, 1),
    (3, 2),
    (6, 2),
    (9, 2),
    (10, 2);

-- Write SQL queries to solve the following problems:
-- 1. Write a query to find all books published in the year 2020.

SELECT title
FROM books
WHERE publication_date BETWEEN '2020-01-01' AND '2020-12-31';


-- 2. Write a query to find the name of the author who has written the most number of books.

SELECT authors.name, COUNT(*) AS num_books
FROM books
JOIN authors ON books.author_id = authors.id
GROUP BY authors.name
ORDER BY num_books DESC
LIMIT 1;

-- 3. Write a query to find the name of the category with the most number of books.
SELECT book_categories.name, COUNT(*) AS num_books
FROM book_category_mappings
JOIN book_categories ON book_category_mappings.category_id = book_categories.id
GROUP BY book_categories.name
ORDER BY num_books DESC
LIMIT 1;

-- 4. Write a query to find the name of the author who has written the most number of books in the category "fiction".
SELECT authors.name, COUNT(*) AS num_books
FROM books
JOIN authors ON books.author_id = authors.id
JOIN book_category_mappings ON books.id = book_category_mappings.book_id
JOIN book_categories ON book_category_mappings.category_id = book_categories.id
WHERE book_categories.name = 'fiction'
GROUP BY authors.name
ORDER BY num_books DESC
LIMIT 1;

-- 5. Write a query to find the titles of the top 5 most popular books. The popularity of a book is defined as the number of times it has been borrowed by customers. Assume that information about book borrowings is stored in a separate table called book_borrowings with the following columns:
-- id: unique identifier for each borrowing
-- book_id: foreign key pointing to the books table
-- customer_id: foreign key pointing to the customers table
-- borrow_date: date on which the book was borrowed

SELECT books.title, COUNT(*) AS num_borrowings
FROM book_borrowings
JOIN books ON book_borrowings.book_id = books.id
GROUP BY books.title
ORDER BY num_borrowings DESC
LIMIT 5;
