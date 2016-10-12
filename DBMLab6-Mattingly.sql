--Raymond Mattingly
--Professor Alan Labouseur
--Database Management
--12 October 2016
--q1
select c.name, ci.city
from customers c, 
    (select max(x.diffProd), x.city
	from 	
		(select count(city) as diffProd, city
		     from products p
		     group by city
		     order by count(city) desc
		) as x
	group by x.city
	order by max(x.diffProd) desc
	limit 2
    ) as ci
where c.city = ci.city;
--q2
select name
from products p, 
		(select(avg(priceUSD)) as average 
		  from products
		) as price
where p.priceUSD > price.average
order by name asc;
--q3
select c.name, o.pid, o.totalUSD
from customers c
inner join orders o on (o.cid = c.cid)
order by o.totalUSD asc;
--q4
select c.name, sum(o.totalUSD)
from customers c, orders o
where o.cid = c.cid
group by c.name
order by name asc;
--q5
select c.name, p.name, a.name
from orders o
inner join agents a on(a.aid = o.aid)
inner join products p on (p.pid = o.pid)
inner join customers c on (c.cid = o.cid)
where o.aid in
		(
		select a.aid
		from agents a
		where city ='New York'
		);
--q6
select o.ordnum, (o.qty * p.priceUSD)as realUSD, o.totalUSD
from orders o
inner join products p on (p.pid = o.pid)
where ((o.qty*p.priceUSD)!= o.totalUSD);
--q7
--a left outer join will compare the entirety of rows from the first table to any matching rows of the second table.
--a right outer join will compare the entirety of rows from the second table to any matching rows of the first table.
--ex:
select distinct c.cid, ordnum
from customers c
left outer join orders o on (o.cid = c.cid)
order by ordnum asc;
--
select distinct c.cid, ordnum
from customers c
right outer join orders o on (o.cid = c.cid)
order by ordnum asc;













