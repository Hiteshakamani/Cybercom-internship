use query33_db;

create table if not exists cars (
CarID int primary key auto_increment,
Brand varchar(50),
Model varchar(50),
Year int,
Mileage int,
Price decimal(10,2),
Available bit
);
create table if not exists customers (
CustomerID int primary key auto_increment,
FirstName varchar(50),
LastName varchar(50),
Email varchar(100),
PhoneNumber varchar(20)
);
create table if not exists Sales(
SaleID int primary key auto_increment,
CarID int, 
CustomerID int, 
SaleDate date,
SalePrice decimal(10,2),
foreign key (CarID) references Cars(CarID) on delete cascade,
foreign key (CustomerID) references Customers(CustomerID) on delete cascade
);

INSERT INTO cars (Brand, Model, Year, Mileage, Price, Available)
VALUES ('Toyota', 'Camry', 2020, 25000, 20000.00, true),
 ('Honda', 'Civic', 2018, 40000, 15000.00, true),
 ('Ford', 'Mustang', 2019, 15000, 25000.00, false),
 ('BMW', 'X5', 2017, 30000, 35000.00, true),
('Hyundai', 'Sonata', 2021, 10000, 18000.00, true);



INSERT INTO customers (FirstName, LastName, Email, PhoneNumber)
VALUES ('John', 'Smith', 'john.smith@example.com', '123-456-7890'),
 ('Jane', 'Doe', 'jane.doe@example.com', '555-555-5555'),
 ('Mike', 'Johnson', 'mike.johnson@example.com', '999-999-9999');


INSERT INTO sales (CarID, CustomerID, SaleDate, SalePrice)
VALUES (1, 2, '2022-01-01', 19000.00),
(4, 1, '2022-02-14', 32000.00),
 (3, 3, '2022-03-05', 24000.00),
 (2, 2, '2022-04-01', 13000.00),
 (5, 1, '2022-05-22', 17000.00);
 
 
--  1. Retrieve the top 10 most expensive cars from the Cars
-- table.

select Model, Price from cars order by Price desc limit 10;

-- 2. Retrieve the average price of all available cars from the
-- Cars table.

select Model, avg(Price) as avg_price where Available = 'true' group by Model;
select Brand, avg(Price) as avg_price where Available = 'true' group by Brand;

-- 3. Retrieve the list of customers who have purchased a car,
-- along with the total number of cars each customer has
-- purchased.

select c.FirstName, c.LastName, COUNT(s.CarID) as TotalCarsPurchased
from customers c
join sales s on c.CustomerID = s.CustomerID
group by  c.CustomerID;


-- 4. Retrieve the list of customers who have not yet made a
-- purchase.

select FirstName, LastName
from customers
where CustomerID not in (
  select distinct CustomerID
  from sales
);


-- 5. Insert a new car into the Cars table with the following
-- information: Brand='Toyota', Model='Corolla', Year=2022,
-- Mileage=0, Price=20000, Available=1.


insert into cars (Brand, Model, Year, Mileage, Price, Available)
values ('Toyota', 'Corolla', 2022, 0, 20000.00, true);

-- 6. Update the price of all cars in the Cars table by adding
-- 10% to their current price.

update cars set Price = Price * 1.1;


-- 7. Delete all sales from the Sales table that occurred before
-- January 1, 2022.

delete from sales where SaleDate < '2022-01-01';
