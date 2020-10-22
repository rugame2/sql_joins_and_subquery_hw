--Inner Join on actor and actor_id table
SELECT actor.actor_id,first_name,last_name,film_id
FROM actor
INNER JOIN film_actor
ON actor.actor_id = film_actor.actor_id;

--Left JOIN on actor and film_actor table
SELECT actor.actor_id,first_name,last_name,film_id
FROM film_actor
LEFT JOIN actor
ON actor.actor_id = film_actor.actor_id;

--Multi Joins that will produce info about a customer
--From the country of Angola
SELECT customer.first_name,customer.last_name,customer.email,country
FROM customer
INNER JOIN address
ON customer.address_id = address.address_id
INNER JOIN city
ON address.city_id = city.city_id
INNER JOIN country
ON city.country_id = country.country_id
WHERE country = 'Angola';

--Subquery, where you write two queries at the same time, and fold them into each other


--two queries split apart (which will become a subquery later)

--Find a customer_id that has a amount < 175 in total payments
SELECT customer_id
FROM payment
GROUP BY customer_id
HAVING SUM(amount) > 175
ORDER BY SUM(amount) DESC;


--Find all customer info
SELECT *
FROM customer;

--Subquery to find the 6 customers that have  
--total amount of payments > 175
--Subquery with a group by clause
SELECT * 
FROM customer
WHERE customer_id IN(
	SELECT customer_id
	FROM payment
	GROUP BY customer_id
	HAVING SUM(amount) > 175
	ORDER BY SUM(amount)DESC
);

--Languages inside of film subquery, find all films with a language of English
--Basic
SELECT *
FROM film
WHERE language_id IN(
	SELECT language_id
	FROM language
	Where name = 'English'
);

--Homework

--Question 1
SELECT first_name,last_name,district
FROM address
JOIN customer
ON address.address_id = customer.address_id
WHERE district = 'Texas';

--Question 2 
SELECT customer.customer_id,first_name,last_name,amount
FROM customer
JOIN payment
ON customer.customer_id = payment.customer_id
WHERE(amount) > 6.99
ORDER BY(amount) ASC;

--Question 3
SELECT * 
FROM customer
WHERE customer_id IN(
	SELECT customer_id
	FROM payment
	GROUP BY customer_id
	HAVING SUM(amount) > 175
	ORDER BY SUM(amount)DESC
);

--Question 4
SELECT customer.first_name,customer.last_name,country
FROM customer
INNER JOIN address
ON customer.address_id = address.address_id
INNER JOIN city
ON address.city_id = city.city_id
INNER JOIN country
ON city.country_id = country.country_id
WHERE country = 'Nepal';

--Question 5 
SELECT staff_id, COUNT(staff_id)
FROM payment
GROUP BY staff_id;

--Question 6


--Question 7
SELECT *
FROM film
WHERE rating IN(
	SELECT film_id
	FROM film_category
	Where name = 'English'
);

--Question 8
SELECT COUNT(customer.customer_id)
FROM customer
JOIN payment
ON customer.customer_id = payment.customer_id
WHERE amount = 0;

