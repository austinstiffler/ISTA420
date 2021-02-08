.echo on
.headers on

-- Name: Austin Stiffler
-- File: NinetiesMusic.sql
-- Assignment: SQL Programming Exercise 01
-- Date: 12 January, 2021

drop table if exists NinetiesMusic;

create table NinetiesMusic (
  track text primary key,
  artist text,
  year int check(year > 1989 and year < 2000),
  plays int,
  award text check(award = 'Platinum') NOT NULL
  );
  
insert into NinetiesMusic values ('Semi Charmed Kindof Life', 'Third Eye Blind', 1997, 267369308, NULL);
insert into NinetiesMusic values ('Genie In a Bottle', 'Christina Aguilera', 1999, 194901732, NULL);
insert into NinetiesMusic values ('Smells Like Teen Spirit', 'Nirvana', 1991, 194901732, 'Platinum');
insert into NinetiesMusic values ('I Want it That Way', 'Backstreet Boys', 1999, 696774038, 'Platinum');
insert into NinetiesMusic values ('I Will Always Love You', 'Whitney Houston', 1992, 356823146, 'Gold');

select * from NinetiesMusic;
