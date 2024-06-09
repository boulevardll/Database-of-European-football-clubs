--DROP DATABASE IF EXISTS "a.ilyamakov";
--CREATE DATABASE "a.ilyamakov" WITH ENCODING = 'UTF8';
--SET client_encoding = 'UTF8';
--
-- CREATING TABLES
--
DROP TABLE IF EXISTS coaches cascade;

CREATE TABLE coaches(
		id SERIAL,
		name VARCHAR(30),
		age SMALLINT NOT NULL
);
DROP TABLE IF exists trophies cascade;
CREATE TABLE trophies(
		id SERIAL,
		name VARCHAR(30),
		count SMALLINT
);
DROP TABLE IF exists clubs cascade;
CREATE TABLE clubs(
		id SERIAL,
		name VARCHAR(30),
		city VARCHAR(30),
		stadium VARCHAR(30),
		id_coaches SMALLINT NOT NULL,
		foundation SMALLINT NOT NULL,
		id_trophies SMALLINT NOT NULL
);
DROP TABLE IF exists players cascade;
CREATE TABLE players(
		id SERIAL,
		id_clubs SMALLINT NOT NULL,
		name VARCHAR(30),
		id_nations SMALLINT NOT NULL,
		age SMALLINT,
		position VARCHAR(30),
		price INTEGER
);
DROP TABLE IF exists nations cascade;
CREATE TABLE nations(
		id SERIAL,
		name VARCHAR(30)
);


ALTER TABLE coaches
	ADD CONSTRAINT coaches_id PRIMARY KEY (id),
	ADD CONSTRAINT coaches_name UNIQUE (name),
	ADD CONSTRAINT coaches_age CHECK(age between 30 and 80);
ALTER TABLE trophies
	ADD CONSTRAINT trophies_id PRIMARY KEY (id),
	ADD CONSTRAINT trophies_count CHECK(count between 1 and 60);
ALTER TABLE clubs
	ADD CONSTRAINT clubs_id PRIMARY KEY (id),
	ADD CONSTRAINT clubs_name UNIQUE (name),
	ADD CONSTRAINT clubs_id_coaches_fkey FOREIGN KEY (id_coaches) REFERENCES coaches(id) ON DELETE CASCADE,
	ADD CONSTRAINT clubs_foundation CHECK(foundation between 1860 and 1990),
	ADD CONSTRAINT clubs_id_trophies_fkey FOREIGN KEY (id_trophies) REFERENCES trophies(id) ON DELETE CASCADE;
ALTER TABLE nations
	ADD CONSTRAINT nations_id PRIMARY KEY (id),
	ADD CONSTRAINT nations_name UNIQUE (name);
ALTER TABLE players
	ADD CONSTRAINT players_id PRIMARY KEY (id),
	ADD CONSTRAINT players_id_clubs_fkey FOREIGN KEY (id_clubs) REFERENCES clubs(id) ON DELETE CASCADE,
	ADD CONSTRAINT players_name UNIQUE (name),
	ADD CONSTRAINT players_id_nations_fkey FOREIGN KEY (id_nations) REFERENCES nations(id) ON DELETE CASCADE,
	ADD CONSTRAINT players_age CHECK(age between 16 and 40);

--
-- INSERTING DATA
--


INSERT INTO coaches(id, name, age)
VALUES
(1, 'Pep Guardiola', 51),
(2, 'Julian Nagelsmann', 35),
(3, 'Jurgen Klopp', 55),
(4, 'Graham Potter', 47),
(5, 'Christophe Galtier', 56),
(6, 'Carlo Ancelotti', 63),
(7, 'Xavi', 42),
(8, 'Erik ten Hag', 52),
(9, 'Massimiliano Allegri', 55),
(10, 'Diego Simeone', 52),
(11, 'Edin Terziс', 40),
(12, 'Jose Mourinho', 59),
(13, 'Simone Inzaghi', 46),
(14, 'Antonio Conte', 53),
(15, 'Mikel Arteta', 40),
(16, 'Jorge Sampaoli', 62);

INSERT INTO trophies(id, name, count)
VALUES
(1, 'Premier League', 8),
(2, 'Champions League', 6),
(3, 'Premier League', 19),
(4, 'Premier League', 6),
(5, 'Ligue 1', 9),
(6, 'Champions League', 14),
(7, 'Primera', 26),
(8, 'Fifa Club World Cup', 1),
(9, 'Seria A', 36),
(10, 'Europa League', 3),
(11, 'German Cup', 5),
(12, 'Conference League', 1),
(13, 'Champions League', 3),
(14, 'UEFA CUP ', 2),
(15, 'FA CUP', 14),
(16, 'Spanish Cup ', 5);

INSERT INTO clubs(id, name, city, stadium, id_coaches, foundation, id_trophies)
VALUES
(1, 'Manchester City', 'Manchester', ' Etihad Stadium', 1,  1880, 1),
(2, 'Bayern', 'Munich', 'Allianz Arena', 2, 1900, 2),
(3, 'Liverpool', 'Liverpool', 'Anfield', 3, 1892, 3),
(4, 'Chelsea', 'London', 'Stamford Bridge', 4, 1905, 4),
(5, 'PSG', 'Paris', 'Parc des Princes', 5, 1970, 5),
(6, 'Real Madrid', 'Madrid', 'Santiago Bernabeu', 6, 1902, 6),
(7, 'Barcelona', 'Barcelona',  'Camp Nou', 7, 1899, 7),
(8, 'Manchester United', 'Manchester', 'Old Trafford', 8, 1878, 8),
(9, 'Juventus', 'Turin', 'Juventus Stadium', 9, 1897, 9),
(10, 'Atletico Madrid', 'Madrid', 'Wanda Metropolitano', 10, 1903, 10),
(11, 'Borussia Dortmund', 'Dortmund', 'Signal Iduna Park', 11, 1909, 11),
(12, 'Roma', 'Rome', 'Stadio Olimpico', 12, 1927, 12),
(13, 'Inter Milan' , 'Milan', 'San Siro', 13, 1908, 13),
(14, 'Tottenham', 'London', 'Tottenham Hotspur Stadium', 14, 1882, 14),
(15, 'Arsenal', 'London', 'Emirates Stadium', 15, 1886, 15),
(16, 'Sevilla', 'Seville', 'Ramon Sanchez Pizjuan Stadium', 16, 1890, 16);
INSERT INTO nations(id, name)
VALUES 
(1, 'Norway'),
(2, 'Germany'),
(3, 'Senegal'),
(4, 'Egypt'),
(5, 'France'),
(6, 'England'),
(7, 'Argentina'),
(8, 'Brazil'),
(9, 'Croatia'),
(10, 'Portugal'),
(11, 'Spain'),
(12, 'Belgium'),
(13, 'Canada'),
(14, 'Poland'),
(15, 'Italy');
INSERT INTO players(id, id_clubs, name, id_nations, age, position, price)
VALUES 
(1, 1, 'Erling Haaland', 1, 22, 'Forward',  17000000),
(2, 2,'Manuel Neuer', 2, 36, 'Goalkeeper', 12000000),
(3, 2,'Sadio Mane', 3, 30, 'Left Winger', 60000000),
(4, 3, 'Mohamed Salah', 4, 30, 'Right Winger', 80000000),
(5, 4,'Ngolo Kante', 5, 31, 'Midfielder', 30000000),
(6, 4,'Raheem Sterling', 6, 27, 'Left Winger', 70000000),
(7, 5,'Lionel Messi', 7, 35, 'Right Winger', 50000000),
(8, 5,'Neymar', 8, 30, 'Left Winger', 75000000),
(9, 6,'Karim Benzema', 5, 34, 'Forward', 35000000),
(10, 6, 'Luka Modric', 9, 37, 'Midfielder', 10000000),
(11, 7, 'M. ter Stegen', 2, 30, 'Goalkeeper', 30000000),
(12, 8, 'Cristiano Ronaldo', 10, 37, 'Forward', 20000000),
(13, 9, 'Bremer', 8, 25, 'Centre-Back', 40000000),
(14, 9, 'Pogba', 5, 29, 'Midfielder', 35000000),
(15, 10, 'Thomas Lemar', 5, 27, 'Left Winger', 30000000),
(16, 11, 'Bellingham', 6, 19, 'Midfielder', 100000000),
(17, 12, 'Dybala', 7, 29, 'Forward', 30000000),
(18, 13, 'Martinez', 7, 25, 'Forward', 75000000),
(19, 14, 'Kane', 6, 29, 'Forward', 90000000),
(20, 15, 'Saliba', 5, 21, 'Centre-Back', 50000000),
(21, 16, 'Lamela', 7, 30, 'Right-Winger', 14000000),
(22, 1, 'Ederson', 8, 29, 'Goalkeeper', 45000000),
(23, 1, 'Aymeric Laporte', 11, 28, 'Centre-Back', 38000000),
(24, 1, 'Kyle Walker', 6, 32, 'Right-Back', 15000000),
(25, 1, 'Kevin De Bruyne', 12, 31, 'Midfielder', 80000000),
(26, 2, 'Alphonso Davies', 13, 22, 'Left-Back', 70000000),
(27, 2, 'Kingsley Coman', 5, 26, 'Right Winger', 60000000),
(28, 2, 'Thomas Muller', 2, 33, 'Second Striker', 18000000),
(29, 3, 'Alisson', 8, 30, 'Goalkeeper', 50000000),
(30, 3, 'Thiago', 11, 31, 'Midfielder', 18000000),
(31, 4, 'Thiago Silva', 8, 38, 'Centre-Back', 3000000),
(32, 4, 'Mateo Kavacic', 9, 28, 'Midfielder', 40000000),
(33, 5, 'Sergio Ramos', 11, 36, 'Centre-Back', 6000000),
(34, 5, 'Kylian Mbappe', 5, 23, 'Forward', 160000000),
(35, 6, 'Daniel Carvajal', 11, 30, 'Right-Back', 18000000),
(36, 6, 'Toni Kroos', 2, 32, 'Midfielder', 20000000),
(37, 6, 'Vinicius Junior', 8, 22, 'Left Winger', 120000000),
(38, 6, 'Eden Hazard', 12, 31, 'Left Winger', 8000000),
(39, 7, 'Gerard Pique', 11, 35, 'Centre-Back', 3000000),
(40, 7, 'Jordi Alba', 11, 33, 'Righr-Back', 5000000),
(41, 7, 'Sergio Busquets', 11, 34, 'Centre-Back', 5000000),
(42, 7, 'Pedri', 11, 20, 'Midfielder', 100000000),
(43, 7, 'Gavi', 11, 18, 'Midfielder', 90000000),
(44, 7, 'Robert Lewandowski', 14, 34, 'Forward', 45000000),
(45, 8, 'David de Gea', 11, 32, 'Goalkeeper', 15000000),
(46, 8, 'Raphael Varane', 5, 29, 'Centre-Back', 40000000),
(47, 8, 'Harry Maguire', 6, 29, 'Centre-Back', 30000000),
(48, 8, 'Casemiro', 8, 30, 'Midfielder', 50000000),
(49, 8, 'Bruno Fernandes', 10, 28, 'Midfielder', 75000000),
(50, 9, 'Wojciech Szczesny', 14, 32, 'Goalkeeper', 13000000),
(51, 9, 'Leonardo Bonucci', 15, 35, 'Centre-Back', 4000000),
(52, 9, 'Alex Sandro', 8, 31, 'Left-Back', 5000000),
(53, 10, 'Koke', 11, 30, 'Midfielder', 18000000),
(54, 10, 'Antoine Griezmann', 5, 31, 'Second Striker', 25000000),
(55, 11, 'Mats Hummels', 2, 33, 'Centre-Back', 7000000),
(56, 11, 'Marko Reus', 2, 33, 'Midfielder', 9000000),
(57, 12, 'Rui Patricio', 10, 34, 'Goalkeeper', 5000000),
(58, 12, 'Stephan El Shaarawy', 15, 30, 'Left Winger', 5000000),
(59, 13, 'Nicolo Barella', 15, 25, 'Midfielder', 70000000),
(60, 13, 'Romelu Lukaku', 12, 29, 'Forward', 55000000),
(61, 13, 'Marcelo Brozovic', 9, 30, 'Midfielder', 35000000),
(62, 14, 'Hugo Lloris', 5, 35, 'Goalkeeper', 7000000),
(63, 14, 'Ivan Perisic', 9, 33, 'Left Winger', 10000000),
(64, 14, 'Richarlison', 8, 25, 'Forward', 50000000),
(65, 15, 'Bukayo Saka', 6, 21, 'Right Winger', 90000000),
(66, 15, 'Martin Odegaard', 1, 23, 'Midfielder', 60000000),
(67, 15, 'Gabriel Gesus', 8, 25, 'Forward', 75000000),
(68, 16, 'Alex Telles', 8, 29, 'Left-Back', 14000000),
(69, 16, 'Jesus Navas', 11, 37, 'Right-Back', 3000000),
(70, 16, 'Isco', 11, 30, 'Midfielder', 9000000);

--SIMPLE QUERIES
SELECT name, age FROM players
WHERE age < 22 
ORDER BY age;

CREATE INDEX players_age_idx ON players(age) WHERE age < 22;

SELECT *
FROM clubs
WHERE city = 'London';

CREATE INDEX clubs_london_idx ON clubs(city) WHERE city = 'London';

SELECT name, foundation
FROM clubs
ORDER BY foundation
LIMIT 1;

SELECT name, age, position
FROM players
WHERE position = 'Goalkeeper'
ORDER BY age DESC
LIMIT 3;

CREATE INDEX players_position_idx ON players(position)
WHERE position = 'Goalkeeper';


--MEDIUM QUERIES

SELECT coaches.name, clubs.name
FROM coaches
INNER JOIN clubs 
ON clubs.id_coaches = coaches.id
ORDER BY clubs.name;

SELECT nations.name, COUNT(players.id)
FROM players
LEFT JOIN nations
ON players.id_nations = nations.id
GROUP BY nations.name
ORDER BY COUNT(players.id) DESC; 

SELECT clubs.name, trophies.name, trophies.count
FROM clubs
RIGHT JOIN trophies
ON clubs.id_trophies = trophies.id
ORDER BY trophies.count DESC
LIMIT 1;

--HARD QUERIES

SELECT clubs.name, COUNT(players.id)
FROM players
LEFT JOIN clubs
ON clubs.id = players.id_clubs
LEFT JOIN nations
ON players.id_nations = nations.id
WHERE nations.name = 'Spain'
GROUP BY clubs.name
ORDER BY COUNT(players.id) DESC
LIMIT 1;

SELECT clubs.name, players.name, players.price
FROM players
LEFT JOIN clubs
ON clubs.id = players.id_clubs
WHERE price > (SELECT AVG(price)
			  FROM players)
ORDER BY price DESC;


SELECT clubs.name, pl.name, pl.position, pl.price
FROM players AS pl
LEFT JOIN clubs
ON clubs.id = pl.id_clubs
WHERE clubs.city = 'London' AND  position = 'Forward'
ORDER BY price DESC
LIMIT 3;
		