-- 2. Create a database structure for students and its college. One student can be on one college only.

USE products_db;

CREATE TABLE IF NOT EXISTS colleges(
college_id int auto_increment primary key,
college_name varchar(256) not null  ,
college_address varchar(256) not null
);

INSERT INTO colleges VALUES(1, 'shantilal shah', 'Bhavnagar'),
( 2 , 'GEC', 'Bhavnagar');
INSERT INTO colleges (college_name, college_address) VALUES ('LD', 'Ahmedabad'),
 ('sal', 'Ahmedabad'),
 ('marwadi', 'Rajkot'),
('Atmiy', 'Ahmedabad');
SELECT * FROM colleges;

CREATE TABLE IF NOT EXISTS students(
student_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
student_name varchar(256) NOT NULL,
student_email varchar(256) NOT NULL,
student_phone INT NOT NULL,
college_id INT  ,
FOREIGN KEY (college_id) REFERENCES colleges (college_id) ON DELETE CASCADE
);

INSERT INTO students  VALUES (1 , 'Hitesha', 'abc@gmail.com' , 1234567890 , 1),
 (2 , 'Hiren', 'abc@gmail.com' , 1234567890 , 2),
 (3 , 'Hitanshi', 'abc@gmail.com' , 1234567890 , 4),
 (4 , 'Keval', 'abc@gmail.com' , 1234567890 , 5),
(1 , 'Vishwa', 'abc@gmail.com' , 1234567890 , 3),
(1 , 'Dhaval', 'abc@gmail.com' , 1234567890 , 7);

SELECT * FROM students;










