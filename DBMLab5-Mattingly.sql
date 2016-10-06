--Raymond Mattingly
--Prof Alan Labouseur
--Lab 5
--5 October 2016
--q1
select a.city
from agents a
inner join orders o on o.aid = a.aid
where o.cid = 'c006';
--q2
select distinct o.pid
from orders o
inner join agents a on a.aid = o.aid
inner join customers c on c.cid = o.cid
where c.city = 'Kyoto' and o.qty >= 1
--q3
select name
from customers
where cid not in (
		  select cid
		  from orders
		 );
--q4	
select c.name 
from customers c
left outer join orders o on o.cid = c.cid
where o.cid is null;
--q5
select distinct c.name, a.name
from customers c
inner join orders o on o.cid = c.cid
inner join agents a on a.aid = o.aid
where a.city = c.city
	and (
		select count(o.cid)
		from orders o, agents a
		where o.aid = a.aid
		) >= 1;
--q6
select distinct a.name, c.name, a.city, c.city
from customers c
inner join agents a on a.city = c.city;
--q7
select c.name, c.city
from customers c
inner join products p on p.city = c.city
group by c.name, c.city
order by count(p.city) asc
limit 1;