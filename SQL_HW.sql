USE sakila;

#1a
SELECT first_name, last_name FROM actor;

#1b
SELECT UPPER(CONCAT(first_name, ' ', last_name)) AS `Actor Name`
FROM actor;

#2a
SELECT 
    actor_id, first_name, last_name
FROM
    actor
WHERE
    first_name = 'Joe';

#2b
SELECT 
    actor_id, first_name, last_name
FROM
    actor
WHERE
    last_name LIKE '%GEN%';

#2c
SELECT 
    last_name, first_name
FROM
    actor
WHERE
    last_name LIKE '%LI%'
ORDER BY last_name , first_name;

#2d
SELECT 
    country_id, country
FROM
    country
WHERE
    country IN ('Afghanistan' , 'Bangladesh', 'China');
    
#3a
ALTER TABLE actor
ADD description BLOB;

#3b
ALTER TABLE actor
DROP COLUMN description;

#4a
SELECT 
    last_name, COUNT(*) AS 'Number of Actors'
FROM
    actor
GROUP BY last_name;

#4b
SELECT last_name, COUNT(*) AS 'Number of Actors' 
FROM actor 
GROUP BY last_name HAVING count(*) >=2;

#4c
UPDATE actor 
SET first_name = 'HARPO'
WHERE First_name = "Groucho" AND last_name = "Williams";

##verifying that the change too place
#SELECT * 
#FROM actor;

#4d
UPDATE actor 
SET first_name = 'GROUCHO'
WHERE first_name = "Harpo";

##verifying that the change too place
#SELECT * 
#FROM actor;

#5a
DESCRIBE sakila.address;

#6a
SELECT first_name, last_name, address
FROM staff s 
JOIN address a
ON s.address_id = a.address_id;

#6b
SELECT first_name, last_name, SUM(amount) AS "August Rentals by Staff ID"
FROM staff s
INNER JOIN payment p
ON s.staff_id = p.staff_id
GROUP BY p.staff_id
ORDER BY last_name ASC;

#6c
SELECT title, COUNT(actor_id) AS "# of Actors in Film"
FROM film f
INNER JOIN film_actor fa
ON f.film_id = fa.film_id
GROUP BY title;

#6d
SELECT title, COUNT(inventory_id)
FROM film f
INNER JOIN inventory i 
ON f.film_id = i.film_id
WHERE title = "Hunchback Impossible";

#6e
SELECT first_name, last_name, SUM(amount) AS "Total Amount Paid"
FROM payment p
INNER JOIN customer c
ON p.customer_id = c.customer_id
GROUP BY p.customer_id
ORDER BY last_name ASC;