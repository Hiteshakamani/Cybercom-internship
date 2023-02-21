-- Create a database schema for student grade system. It contains student data and their grade of each subject based on the different semester.

use products_db;

create table if not exists student_table(
student_id  int primary key auto_increment,
first_name varchar(256) not null,
last_name varchar(256) ,
date_of_birth date,
email varchar(256),
phone_number double
);

create table if not exists subject_table(
subject_id int primary key auto_increment,
subject_name varchar(256) not null
);

create table if not exists semester_table (
semester_id int primary key auto_increment,
semester_name varchar(256),
start_date date ,
end_date date
);

create table if not exists grade_table(
grade_id int primary key auto_increment,
student_id int,
subject_id int,
semester_id int,
grade varchar(256),
 foreign key (student_id) references student_table(student_id) on delete cascade,
 foreign key (subject_id) references subject_table(subject_id) on delete cascade,
 foreign key (semester_id) references semester_table(semester_id) on delete cascade
);
