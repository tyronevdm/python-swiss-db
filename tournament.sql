-- Table definitions for the tournament project.
--
-- Put your SQL 'create table' statements in this file; also 'create view'
-- statements if you choose to use it.
--
-- You can write comments in this file by starting them with two dashes, like
-- these lines here.
drop database tournament;
create database tournament;
\c tournament;
create table players(id serial,name text,primary key (id));
create table matches(id serial,winner integer,looser integer,primary key (id));

CREATE VIEW countgames AS select players.id,players.name,count(matches.winner) as games from players left join matches on players.id = matches.winner group by players.id union select players.id,players.name,count(matches.looser) as games from players left join matches on players.id = matches.looser group by players.id;
CREATE VIEW countgames1 AS select id,name,sum(games) as games from countgames group by id,name;
CREATE VIEW wingames AS select players.id,players.name,count(matches.winner) as wins from players left join matches on players.id = matches.winner group by matches.winner,players.id,players.name;
CREATE VIEW wincountgames AS select wingames.id,wingames.name,wingames.wins,countgames1.games as matches from wingames inner join countgames1 on wingames.id = countgames1.id order by wins desc;
CREATE VIEW swiss AS select a.id as id1,a.name as name1,b.id as id2,b.name as name2 from wincountgames a,wincountgames b where a.wins = b.wins and a.id != b.id and a.id < b.id;
