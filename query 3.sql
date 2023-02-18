-- 3. Create a database structure for worldwide cricket team. Database will contain, each player’s name, its country, it’s expertise and so o 
USE products_db;

CREATE TABLE IF NOT EXISTS Team(
Team_ID int auto_increment primary key,
Team_name varchar(256) not null unique,
Cricket_board int
);
 Insert into Team (team_id, team_name) values
 (1,'Pakistan national cricket team'),
 (2 ,'Bangladesh national cricket team'),
 (3, 'West Indies cricket team'),
 (4, 'Sri Lanka national cricket team'),
 (5,'New Zealand national cricket team'),
 (6,'England cricket team'),
 (7,'Australian Men’s Cricket Team');
 
 select * from Team ;
 
 CREATE TABLE IF NOT EXISTS Expertise(
 Experty_ID int primary key auto_increment,
 Experty Varchar(256)
 );
 Insert into Expertise values
 (1,'Boller'),
 (2 ,'Wicket-keeper'),
 (3, 'Batter'),
 (4, 'All rounder');
 
 select * from Expertise;
 
 
CREATE TABLE IF NOT EXISTS Player(
Player_ID int auto_increment primary key,
player_name varchar(256) not null,
ODT_run int ,
TEST_run int,
T20_run int,
T20_match int,
ODT_match int,
Test_match int,
Team_ID int,
Experties_ID int,
FOREIGN KEY (Team_ID) REFERENCES Team (Team_ID) ON DELETE CASCADE,
  FOREIGN KEY (Experties_ID) REFERENCES Expertise (Experty_ID) ON DELETE CASCADE
);

INSERT INTO Player (player_name, ODT_run, TEST_run, T20_run, T20_match, ODT_match, Test_match, Team_ID, Experties_ID)
VALUES
  ('Joe Root', 6143, 8249, 286, 32, 154, 109, 6, 1),
  ('Babar Azam', 3359, 1585, 568, 38, 86, 28, 1, 1),
  ('Kane Williamson', 6173, 7115, 1661, 73, 151, 84, 5, 1),
  ('Virat Kohli', 12169, 7547, 3159, 89, 254, 94, 1, 1),
  ('Eoin Morgan', 7481, 1612, 1245, 89, 241, 51, 6, 2),
  ('Shakib Al Hasan', 6323, 3866, 1571, 85, 215, 59, 2, 2);
  
  select * from player;


 
 
 
 






