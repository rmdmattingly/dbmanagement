--q1
create or replace function PreReqsFor(int, REFCURSOR) returns refcursor as
$$
declare
	cNum int 		:= $1;
	resSet REFCURSOR 	:= $2;
begin
	open resSet for
		select preReqNum
		from Prerequisites
		where cNum = Prerequisites.courseNum;
	return resSet;
end;
$$
language plpgsql;
select PreReqsFor(499, 'results');
Fetch all from results;

--q2
create or replace function IsPreReqFor(int, REFCURSOR) returns refcursor as
$$
declare
	pNum int		:= $1;
	resSet REFCURSOR	:= $2;
begin
	open resSet for
		select courseNum
		from Prerequisites
		where pNum = Prerequisites.preReqNum;
	return resSet;
end;
$$
language plpgsql;
select IsPreReqFor(308, 'results2');
Fetch all from results2;

--q3 // JEDI *<|:^) // I tried and tinkered with it for awhile...
			--sadly I'm no jedi *<|:'^(
/*create or replace function AllPreReqs (int) returns refcursor as
$$
declare
	cNum int 		:= $1;
begin
	if PreReqsFor(cNum, 'results')
		then execute procedure;
	else
		rollback;
	end if;
end;
$$
language plpgsql;
select AllPreReqs(499);*/














