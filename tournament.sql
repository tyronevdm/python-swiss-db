-- Table definitions for the tournament project.
--
-- Put your SQL 'create table' statements in this file; also 'create view'
-- statements if you choose to use it.
--
-- You can write comments in this file by starting them with two dAShes, like
-- these lines here.
DROP DATABASE tournament;
CREATE DATABASE tournament;
\c tournament;
CREATE TABLE players(
	id SERIAL,
	name TEXT,PRIMARY KEY (id)
	);
CREATE TABLE matches(
	id SERIAL,
	winner INTEGER REFERENCES players(id) ON DELETE CASCADE,
	looser INTEGER REFERENCES players(id) ON DELETE CASCADE,PRIMARY KEY (id)
	);
--
CREATE VIEW countgames AS 
	SELECT players.id,players.name,COUNT(matches.winner) AS games 
	FROM players 
	LEFT JOIN matches 
	ON players.id = matches.winner 
	GROUP BY players.id 
UNION 
	SELECT players.id,players.name,COUNT(matches.looser) AS games 
	FROM players 
	LEFT JOIN matches
	ON players.id = matches.looser 
	GROUP BY players.id;
--
CREATE VIEW countgames1 AS 
	SELECT id,name,SUM(games) AS games 
	FROM countgames
	GROUP BY id,name;
--
CREATE VIEW wingames AS 
	SELECT players.id,players.name,COUNT(matches.winner) AS wins 
	FROM players 
	LEFT JOIN matches ON players.id = matches.winner 
	GROUP BY matches.winner,players.id,players.name;
--
CREATE VIEW wincountgames AS 
	SELECT wingames.id,wingames.name,wingames.wins,countgames1.games AS matches 
	FROM wingames 
	INNER JOIN countgames1 ON wingames.id = countgames1.id 
	ORDER BY wins DESC;
--
CREATE VIEW swiss AS 
	SELECT a.id AS id1,a.name AS name1,b.id AS id2,b.name AS name2 
	FROM wincountgames a,wincountgames b 
	WHERE a.wins = b.wins 
	AND a.id != b.id 
	AND a.id < b.id;
--
