/*
* Raymond Mattingly
* Professor Alan Labouseur
* 7 December 2016
* DBM Final Project -- SQL File
* ROWING DATABASE
*	featuring data, reports, views, stored procedures, triggers
*		accompanying documentation available
*/
--DROP TABLES IF EXIST
drop trigger if exists valid_coach on "coaches";
drop trigger if exists valid_rower on "rowers";
drop view if exists CoachesLaunch;
drop view if exists CoxswainShells;
drop view if exists AllWins;
drop table if exists coxswains;
drop table if exists coaches;
drop table if exists oars;
drop table if exists launches;
drop table if exists oar_sets;
drop table if exists practice;
drop table if exists workouts;
drop table if exists shells;
drop table if exists rowers;
drop table if exists winners;
drop table if exists regattas;
drop table if exists event;
drop table if exists regatta_boats;
--CREATE TABLES
CREATE TABLE rowers
(
	rid SERIAL NOT NULL,
	rname varchar(255) NOT NULL,
	twok varchar(10),
	PRIMARY KEY (rid)
);
CREATE TABLE coaches
(
	coid SERIAL NOT NULL,
	coname varchar(255) NOT NULL,
	alma_mater varchar(255),
	PRIMARY KEY (coid)
);
CREATE TABLE oars
(
	oid SERIAL NOT NULL,
	setid int NOT NULL,
	load int NOT NULL,
	blade varchar(255) NOT NULL,
	PRIMARY KEY (oid)
);
CREATE TABLE oar_sets
(
	setid SERIAL NOT NULL,
	tape_color varchar(255) NOT NULL,
	PRIMARY KEY (setid)
);
CREATE TABLE launches
(
	lid SERIAL NOT NULL,
	lname varchar(255) NOT NULL,
	byear varchar(255) NOT NULL,
	PRIMARY KEY (lid)
);
CREATE TABLE practice
(
	rid int NOT NULL,
	sid int NOT NULL,
	ptime timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
	coid int,
	cxid int,
	oid int NOT NULL,
	wid int,
	lid int,
	PRIMARY KEY (rid, sid, ptime)
);
CREATE TABLE workouts
(
	wid SERIAL NOT NULL,
	wtime varchar(255) NOT NULL,
	rest varchar(255),
	goal_split varchar(255),
	PRIMARY KEY (wid)
);
CREATE TABLE shells
(
	sid SERIAL NOT NULL,
	sname varchar(255) NOT NULL,
	manufacturer varchar(255) NOT NULL,
	model varchar(255) NOT NULL,
	syear varchar(255) NOT NULL,
	PRIMARY KEY (sid)
);
CREATE TABLE winners
(
	rid int NOT NULL,
	ptime timestamp NOT NULL,
	sid int NOT NULL,
	cxid int,
	PRIMARY KEY (rid, ptime)
);
CREATE TABLE coxswains
(
	cxid SERIAL NOT NULL,
	cxname varchar(255) NOT NULL,
	PRIMARY KEY (cxid)
);
CREATE TABLE regattas
(
	regid SERIAL NOT NULL,
	regname varchar(255) NOT NULL,
	rdate date NOT NULL,
	PRIMARY KEY (regid)
);
CREATE TABLE event
(
	event_num int NOT NULL,
	regid int NOT NULL,
	PRIMARY KEY (event_num, regid)
);
CREATE TABLE regatta_boats
(
	regid int NOT NULL,
	rid int NOT NULL,
	event_num int NOT NULL,
	sid int NOT NULL,
	oid int NOT NULL,
	cxid int,
	PRIMARY KEY (regid, rid, event_num)
);
--DATA INSERTION BELOW
--coxswains
INSERT INTO coxswains
	VALUES ('1', 'Ryan Lillis');
INSERT INTO coxswains
	VALUES ('2', 'Dylan Galimi');
--coaches
INSERT INTO coaches
	VALUES ('1', 'Campbell Woods', 'Oregon State');
INSERT INTO coaches
	VALUES ('2', 'Reed Miller', 'UMass');
--oars
INSERT INTO oars
	VALUES ('1', '1', '135', 'fat2');
INSERT INTO oars
	VALUES ('2', '1', '135', 'fat2');
INSERT INTO oars
	VALUES ('3', '1', '135', 'fat2');
INSERT INTO oars
	VALUES ('4', '1', '135', 'fat2');
INSERT INTO oars
	VALUES ('5', '2', '135', 'hatchet');
INSERT INTO oars
	VALUES ('6', '2', '135', 'hatchet');
INSERT INTO oars
	VALUES ('7', '2', '135', 'hatchet');
INSERT INTO oars
	VALUES ('8', '2', '135', 'hatchet');
--oar_sets
INSERT INTO oar_sets
	VALUES ('1', 'green');
INSERT INTO oar_sets
	VALUES ('2', 'red');
--launches
INSERT INTO launches
	VALUES ('1', 'Sea Snapper', '2015');
INSERT INTO launches
	VALUES ('2', 'Tom Sanford', '2014');
--workouts
INSERT INTO workouts
	VALUES ('1', '5', '5', '1:35');
INSERT INTO workouts
	VALUES ('2', '2', '2', '1:27');
INSERT INTO workouts
	VALUES ('3', '20', '4', '1:50');
INSERT INTO workouts
	VALUES ('4', '1', '1', '1:24');
--rowers
INSERT INTO rowers
	VALUES ('1', 'Raymond Mattingly', '6:28');
INSERT INTO rowers
	VALUES ('2', 'Tadd Bindas', '6:31');
INSERT INTO rowers
	VALUES ('3', 'Chris Carlson', '6:12');
INSERT INTO rowers
	VALUES ('4', 'Chris Lazich', '6:32');
INSERT INTO rowers
	VALUES ('5', 'Rami Awad', '6:17');
INSERT INTO rowers
	VALUES ('6', 'Dan Arrato', '6:25');
INSERT INTO rowers
	VALUES ('7', 'Joe Kohn', '6:20');
INSERT INTO rowers
	VALUES ('8', 'Morgan Stippa', '6:17');
--shells
INSERT INTO shells
	VALUES ('1', 'Austin', 'Vespoli', 'E', '2015');
INSERT INTO shells
	VALUES ('2', 'Simmons', 'Vespoli', 'D', '2014');
--winners
INSERT INTO winners
	VALUES ('1', '2016-10-15 06:30:00', '1', '1');
INSERT INTO winners
	VALUES ('2', '2016-10-15 06:30:00', '1', '1');
INSERT INTO winners
	VALUES ('3', '2016-10-15 06:30:00', '1', '1');
INSERT INTO winners
	VALUES ('4', '2016-10-15 06:30:00', '1', '1');
INSERT INTO winners
	VALUES ('5', '2016-11-15 06:15:00', '2', '2');
INSERT INTO winners
	VALUES ('6', '2016-11-15 06:15:00', '2', '2');
INSERT INTO winners
	VALUES ('7', '2016-11-15 06:15:00', '2', '2');
INSERT INTO winners
	VALUES ('8', '2016-11-15 06:15:00', '2', '2');
--regattas
INSERT INTO regattas
	VALUES ('1', 'Head of the Charles', '10-22-16');
INSERT INTO regattas
	VALUES ('2', 'Head of the Fish', '10-29-16');
--event
INSERT INTO event
	VALUES ('63', '1');
INSERT INTO event
	VALUES ('6', '2');
--regatta_boats
INSERT INTO regatta_boats
	VALUES ('1', '1', '63', '1', '1', '1');
INSERT INTO regatta_boats
	VALUES ('1', '2', '63', '1', '2', '1');
INSERT INTO regatta_boats
	VALUES ('1', '3', '63', '1', '3', '1');
INSERT INTO regatta_boats
	VALUES ('1', '4', '63', '1', '4', '1');
INSERT INTO regatta_boats
	VALUES ('2', '5', '6', '2', '5', '2');
INSERT INTO regatta_boats
	VALUES ('2', '6', '6', '2', '6', '2');
INSERT INTO regatta_boats
	VALUES ('2', '7', '6', '2', '7', '2');
INSERT INTO regatta_boats
	VALUES ('2', '8', '6', '2', '8', '2');
--practice
INSERT INTO practice
	VALUES ('1', '1', '2016-10-15 06:30:00', '1', '1', '1', '1', '1');
INSERT INTO practice
	VALUES ('2', '1', '2016-10-15 06:30:00', '1', '1', '2', '1', '1');
INSERT INTO practice
	VALUES ('3', '1', '2016-10-15 06:30:00', '1', '1', '3', '1', '1');
INSERT INTO practice
	VALUES ('4', '1', '2016-10-15 06:30:00', '1', '1', '4', '1', '1');
INSERT INTO practice
	VALUES ('5', '2', '2016-10-15 06:30:00', '2', '2', '5', '1', '1');
INSERT INTO practice
	VALUES ('6', '2', '2016-10-15 06:30:00', '2', '2', '6', '1', '1');
INSERT INTO practice
	VALUES ('7', '2', '2016-10-15 06:30:00', '2', '2', '7', '1', '1');
INSERT INTO practice
	VALUES ('8', '2', '2016-10-15 06:30:00', '2', '2', '8', '1', '1');
INSERT INTO practice
	VALUES ('1', '1', '2016-11-15 06:15:00', '2', '2', '1', '1', '2');
INSERT INTO practice
	VALUES ('2', '1', '2016-11-15 06:15:00', '2', '2', '2', '1', '2');
INSERT INTO practice
	VALUES ('3', '1', '2016-11-15 06:15:00', '2', '2', '3', '1', '2');
INSERT INTO practice
	VALUES ('4', '1', '2016-11-15 06:15:00', '2', '2', '4', '1', '2');
INSERT INTO practice
	VALUES ('5', '2', '2016-11-15 06:15:00', '1', '1', '5', '1', '1');
INSERT INTO practice
	VALUES ('6', '2', '2016-11-15 06:15:00', '1', '1', '6', '1', '1');
INSERT INTO practice
	VALUES ('7', '2', '2016-11-15 06:15:00', '1', '1', '7', '1', '1');
INSERT INTO practice
	VALUES ('8', '2', '2016-11-15 06:15:00', '1', '1', '8', '1', '1');

--VIEWS:
--view1: RowerWins
create or replace view AllWins as
select practice.ptime, rowers.rname, shells.sname
from practice
left join rowers on rowers.rid=practice.rid
left join shells on shells.sid=practice.sid
left join winners on winners.ptime=practice.ptime
	AND winners.rid=practice.rid
where 
      (
		winners.rid IS NOT NULL
      )
;
select *
from AllWins;
--view2: CoxswainShells
create or replace view CoxswainShells as
select distinct practice.ptime, coxswains.cxname, shells.sname
from practice
left join coxswains on practice.cxid=coxswains.cxid
left join shells on shells.sid=practice.sid;
select *
from CoxswainShells;
--view3: CoachesLaunch
create or replace view CoachesLaunch as
select distinct practice.ptime, coaches.coname, launches.lname
from practice
left join launches on practice.lid=launches.lid
left join coaches on practice.coid=coaches.coid
order by practice.ptime;

--STORED PROCEDURES:
--stored procedure1: Wins(name)
create or replace function Wins(varchar, REFCURSOR) returns refcursor as
$$
declare
	eName varchar 		:= $1;
	resSet REFCURSOR 	:= $2;
begin
	open resSet for
		select practice.ptime, rowers.rname, shells.sname
		from practice
		left join rowers on rowers.rid=practice.rid
		left join shells on shells.sid=practice.sid
		left join winners on winners.ptime=practice.ptime
			AND winners.rid=practice.rid
		where (
				rowers.rname=eName
			  )
			  AND
			  (
				winners.rid IS NOT NULL
			  );
	return resSet;
end;
$$
language plpgsql;
select Wins('Raymond Mattingly', 'results');
Fetch all from results;
--OR WITH THE USE OF A VIEW THIS STORED PROCEDURE CAN EXIST AS:
create or replace function Wins2(varchar, REFCURSOR) returns refcursor as
$$
declare
	eName varchar 		:= $1;
	resSet REFCURSOR 	:= $2;
begin
	open resSet for
		select ptime, rname, sname
		from AllWins
		where rname=eName;
	return resSet;
end;
$$
language plpgsql;
select Wins2('Raymond Mattingly', 'results2');
Fetch all from results2;
--stored procedure2: Coach Launches Fxn
create or replace function CoachLaunchesFxn(varchar, REFCURSOR) returns refcursor as
$$
declare
	cName varchar 		:= $1;
	resSet REFCURSOR 	:= $2;
begin
	open resSet for
		select ptime, coname, lname
		from CoachesLaunch
		where coname=cName;
	return resSet;
end;
$$
language plpgsql;
select CoachLaunchesFxn('Reed Miller', 'clresults');
Fetch all from clresults;
--stored procedure3: Coxswain Shells Fxn
create or replace function CoxswainShellsFxn(varchar, REFCURSOR) returns refcursor as
$$
declare
	cName2 varchar 		:= $1;
	resSet REFCURSOR 	:= $2;
begin
	open resSet for
		select ptime, cxname, sname
		from CoxswainShells
		where cxname=cName2;
	return resSet;
end;
$$
language plpgsql;
select CoxswainShellsFxn('Ryan Lillis', 'cxsresults');
Fetch all from cxsresults;
	
--TRIGGERS
--trigger1: check validity of rower input
create or replace function ValidateRowerFxn() returns trigger as
$$
begin
	if exists 
	(
		select 1 
		from rowers
		where rid=new.rid
	) then
	return null;
	end if;
return new;
end
$$
language plpgsql;
CREATE TRIGGER valid_rower
BEFORE INSERT ON rowers
FOR EACH ROW
EXECUTE PROCEDURE ValidateRowerFxn();
--success is demonstrated by the lower query not being inserted
INSERT INTO rowers
	VALUES ('1', 'Raymond Mattingly2', '6:28');
--trigger2: check validity of coach input
create or replace function ValidateCoachFxn() returns trigger as
$$
begin
	if exists 
	(
		select 1 
		from coaches
		where coid=new.coid
	) then
	return null;
	end if;
return new;
end
$$
language plpgsql;
CREATE TRIGGER valid_coach
BEFORE INSERT ON coaches
FOR EACH ROW
EXECUTE PROCEDURE ValidateCoachFxn();
--success is demonstrated by the lower query not being inserted
INSERT INTO coaches
	VALUES ('1', 'CampbellWoods2', 'Go Ducks, Baby');

--REPORTS:
--report1: return shells on the water for a practice for safety reasons
select practice.ptime, shells.sname
from practice
left join shells on practice.sid=shells.sid
order by practice.ptime;

--report2: return what shells to bring to a regatta
select distinct regattas.rdate, regattas.regname, shells.sname
from regattas, shells
left join regatta_boats on regatta_boats.sid=shells.sid
order by regattas.rdate;
	
--report3: return what rowers are on the water for safety reasons
select practice.ptime, rowers.rname
from practice
left join rowers on practice.rid=rowers.rid
order by practice.ptime;
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	




