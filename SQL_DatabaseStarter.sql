CREATE DATABASE sql_lab3;
USE sql_lab3;

set global local_infile = 1 ;

drop table if exists Reserve ;
drop table if exists Sailors ;
drop table if exists Boats ;

-- set up tables and dtypes
create table Sailors (
  sid int,
  name varchar(20) NOT NULL,
  age int,
  rating float NOT NULL,
  Primary Key (sid) ) ;

create table Boats (
  bid int,
  name varchar(20),
  ratingNeeded int,
  bcolor varchar(20),
  PRIMARY KEY (bid) ) ;

create table Reserve (
  bid int,
  sid int, 
  rdate date,
  PRIMARY KEY (bid,sid,rdate),
  Foreign Key (bid) references Boats(bid),
  Foreign Key (sid) references Sailors(sid) ) ;

-- Input data from a text file into created tables
load data local infile '/Users/Kenny/Downloads/MSDS/MSDE_SQL/Lab 3 Files/data_sailors.txt' into table sailors
  fields terminated by ','
  lines terminated by '\n'
  ;

load data local infile '/Users/Kenny/Downloads/MSDS/MSDE_SQL/Lab 3 Files/data_boats.txt' into table boats
  fields terminated by ','
  lines terminated by '\n'
  ;

load data local infile '/Users/Kenny/Downloads/MSDS/MSDE_SQL/Lab 3 Files/data_reserve.txt' into table reserve
  fields terminated by ','
  lines terminated by '\n'
  ;