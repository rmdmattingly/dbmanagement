--Raymond Mattingly
--Professor Alan Labouseur
--9/28/16
--LAB 4
--Q1
select city
from agents
where aid in
( 
	select aid
	from orders
	where cid = 'c006'
);
--Q2
select pid
from orders
where aid in
(
	select aid
	from orders
	where cid in
	(
		select cid
		from customers
		where city = 'Kyoto'
	) 
);
--Q3
select cid, name
from customers
where cid not in 
(
	select cid
	from orders
	where aid = 'a03'
);
--Q4
select cid
from customers
where cid in
(
	select cid
	from orders
	where pid = 'p07'
	AND cid in 
	(
		select cid
		from orders
		where pid = 'p01'
	)
);
--Q5
select pid
from products
where pid not in
(
	select pid
	from orders
	where cid not in
	(
		select pid
		from orders
		where aid='a08'
	)
)
order by pid DESC;
--Q6
select name, discount, city
from customers
where cid in
(
	select cid
	from orders
	where aid in 
	(
		select aid
		from agents
		where city='Dallas'
		OR city='New York'
	)
);
--Q7
select name
from customers
where discount in
(
	select discount
	from customers
	where city = 'Dallas'
	OR city = 'London'
);
--Q8 (CHECK CONSTRAINTS)
/*
	Check constraints specify what can be put in a data entry, and 
	thus play a big role in maximizing the usefulness of one's data.

	An example of a check constraint would be in one was asked to 
	enter the numerical representation of their birth month; a check
	constraint would be put in place to make sure that only the 
	entries 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, or 12 are accepted.

	The book talks about how check constraints can cause issues with
	null entries and deletion, so implementation of check constraints
	is not necessarily always good.
*/


