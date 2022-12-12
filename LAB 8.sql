##LAB 8 
## List the number of films per category.
select * from sakila.film;
select * from sakila.film_category;
select f.film_id,fc.category_id,fc.film_id,count(fc.film_id)
from sakila.film f
left join sakila.film_category fc on f.film_id = fc.film_id
group by fc.category_id
order by count(fc.film_id) desc;

## Display the first and the last names, as well as the address, of each staff member.
select * from sakila.staff;
select * from sakila.address;
select s.first_name , s.last_name, s.address_id, s.staff_id, a.address_id
from sakila.staff s
join sakila.address a on a.address_id = s.address_id;

## Display the total amount rung up by each staff member in August 2005.
select * from sakila.payment;
select * from sakila.staff;
select s.staff_id, p.staff_id, p.payment_id, p.payment_date, sum(p.amount)
from sakila.payment p
join sakila.staff s on s.staff_id = p.staff_id
where payment_date like '2005-08%'
group by p.staff_id;


## List all films and the number of actors who are listed for each film.
select * from sakila.film;
select * from sakila.film_actor;
select f.title, count(fa.film_id)
from film f
join film_actor fa on fa.film_id = f.film_id
group by f.title;


## Using the payment and the customer tables as well as the JOIN command, list the total amount paid by each customer. List the customers alphabetically by their last names.
select * from sakila.customer;
select * from sakila.payment;
select concat(c.first_name,' ',c.last_name) as 'Customer Name',sum(p.amount)
from payment p 
join customer c on c.customer_id = p.customer_id
group by p.customer_id