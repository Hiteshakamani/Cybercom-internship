use products_db;

create table if not exists PERSON1(
personId int auto_increment primary key,
lastname varchar(256),
firstname varchar(256) 
);

insert into PERSON1(lastname, firstname) values 
('Wang' ,'Allen'),
('Alice' , 'Bob');

create table if not exists Address(
addressID int primary key auto_increment,
personId int ,
city varchar(256),
state varchar(256),
foreign key (personId) references PERSON1(personId) on delete cascade
);

insert into Address (city,state) values 
('New York City', 'New York'),
('Leetcode', 'California');

SELECT p.firstName, p.lastName, a.city, a.state
FROM PERSON1 p, Address a
WHERE p.personId = a.personId or a.personId IS NULL;
