use sakila;

# In this lab, you will be using the Sakila database of movie rentals.

# Instructions

# 1 List number of films per category.
select c.category_id, c.name as Category, count(f.film_id) as Movies from film as f
Join film_category as fc
on f.film_id= fc.film_id
join category as c
on c.category_id = fc.category_id
group by category;

# 2 Display the first and last names, as well as the address, of each staff member.
select s.first_name, s.last_name, a.address
from staff as s
join address as a 
on s.address_id = a.address_id;
# 3 Display the total amount rung up by each staff member in August of 2005.

select s.staff_id, s.first_name, s.last_name, sum(p.amount) as Amount
from staff as s
Join payment as p
 on s.staff_id = p.staff_id
where payment_date regexp '2005-08-'
group by s.staff_id;

# 1 List number of films per category.
# 4 List each film and the number of actors who are listed for that film.

select f.film_id, f.title as Title, Count(fa.actor_id) from film as f
Left join film_actor as fa
on f.film_id = fa.film_id
Group by f.film_id
Order by count(fa.actor_id) DESC;

# 5 Using the tables payment and customer and the JOIN command, list the total paid by each customer. List the customers alphabetically by last name.
select c.customer_id, c.first_name, c.last_name, Sum(p.amount) As Sum from customer as c
Join payment as p
on c.customer_id = p.customer_id
group by c.customer_id
order by last_name ASC;
