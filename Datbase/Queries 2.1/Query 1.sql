-- Create a database structure for employee leave application. It
-- should include all the employee's information as well as their
-- leave information.

use products_db;

create table Emp_info(
id int auto_increment  primary key,
First_name varchar(256) not null,
Last_name varchar(256) not null,
Job_status varchar(256) ,
Job_type varchar(256),
Email varchar(256),
Phone varchar(256),
Address varchar(256)
);

INSERT INTO Emp_info (First_name, Last_name, Job_status, Job_type, Email, Phone, Address)
VALUES 
('Akash', 'Kumar', 'WFH', 'Manager', 'akashkumar@gmail.com', '9876543210', '123 Main St'),
('Priya', 'Sharma', 'WFO', 'Sales', 'priyasharma@gmail.com', '9876543211', '456 Market St'),
('Rajesh', 'Patel', 'WFH', 'Developer', 'rajeshpatel@gmail.com', '9876543212', '789 Broadway');
SELECT * FROM Emp_info;

create table Leave_info(
id int auto_increment primary key ,
emp_id int,
start_date date ,
end_date date,
reason varchar(256),
Leave_type varchar(256),
foreign key (emp_id) references Emp_info(id) on delete cascade 

);
INSERT INTO Leave_info (emp_id, start_date, end_date, reason, Leave_type)
VALUES 
(1, '2022-02-15', '2022-02-18', 'Family vacation', 'Vacation'),
(1, '2022-03-01', '2022-03-02', 'Doctor appointment', 'Sick leave'),
(2, '2022-02-22', '2022-02-25', 'Personal reasons', 'Personal leave'),
(3, '2022-03-10', '2022-03-15', 'Out of town trip', 'Vacation');

SELECT * FROM Leave_info;