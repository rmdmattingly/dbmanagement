--RAYMOND MATTINGLY
--DBM W/ LABOUSEUR
--18 SEP 2016
--LAB 3
--q1
select ordnum, totalusd
from orders;
--q2
select name, city
from agents
where name='Smith';
--q3
select pid, name, priceUSD
from products 
where quantity>201000;
--q4
select name, city
from customers
where city='Duluth';
--q5
select name
from agents
where city!='New York'
	AND city!='Duluth';
--q6
select *
from products
where city!='Dallas'
	AND city!='Duluth'
	AND priceUSD>=1;
--q7
select *
from orders
where mon='feb'
	OR mon='mar';
--q8
select *
from orders
where mon='feb'
	AND totalusd>=600;
--q9
select *
from orders
where cid='c005';