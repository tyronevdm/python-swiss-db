# Introduction

Python module that uses a PostgreSQL database to keep track of players and matches in a game tournament using a swiss style tournament structure. This python moduel was built as a final project in  [udacity course - Introduction to relational databsaes](https://www.udacity.com/course/viewer#!/c-ud197)

## Installation

1. Complete **Getting started** steps [here](https://docs.google.com/document/d/16IgOm4XprTaKxAa8w02y028oBECOoB1EI1ReddADEeY/pub?embedded=true)
2. Clone **python-swiss-db** and place into a suitable folder.
3. Copy and overrite all files (*.py,*.sql) from the **python-swiss-db** folder into the **fullstack** folder.
4. To run , start Github console, change to **fullstack folder\vagrant** 
5. Type ```vagrant up``` then ```vagrant ssh``` then
6. Follow below commands to create the **database schema**.
```
vagrant@vagrant-ubuntu-trusty-32:~$ cd /vagrant/tournament/
vagrant@vagrant-ubuntu-trusty-32:/vagrant/tournament$ psql
psql (9.3.10)
Type "help" for help.

vagrant=> \i tournament.sql
DROP DATABASE
CREATE DATABASE
You are now connected to database "tournament" as user "vagrant".
CREATE TABLE
CREATE TABLE
CREATE VIEW
CREATE VIEW
CREATE VIEW
CREATE VIEW
CREATE VIEW
```
7. ```\q``` to exit the db. Then to run the program, do the following
```
vagrant@vagrant-ubuntu-trusty-32:/vagrant/tournament$ python tournament_test.py
1. Old matches can be deleted.
2. Player records can be deleted.
3. After deleting, countPlayers() returns zero.
4. After registering a player, countPlayers() returns 1.
5. Players can be registered and deleted.
6. Newly registered players appear in the standings with no matches.
7. After a match, players have updated standings.
8. After one match, players with one win are paired.
Success!  All tests pass!
vagrant@vagrant-ubuntu-trusty-32:/vagrant/tournament$
```
8. You should see **Success!  All tests pass!** when the program unit tests have been completed successfully.