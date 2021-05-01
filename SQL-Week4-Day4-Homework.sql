--1 -- 5 customers from Texas
SELECT customer_id, district
FROM customer
JOIN address
ON customer.address_id = address.address_id
WHERE district ='Texas'
--2 -- 2428 payments above $6.99
SELECT customer.customer_id, first_name, last_name, amount
FROM customer
JOIN payment
ON customer.customer_id = payment.customer_id
WHERE amount >= 6.99
--3 -- Solution below:
SELECT customer.customer_id, first_name, last_name
FROM customer
WHERE customer_id IN (
	SELECT customer_id --SUM(amount) for checking within subquery
	FROM payment
	GROUP BY customer_id
	HAVING SUM(amount) >= 175
	ORDER BY SUM(amount)
);
--4 -- Kevin Schuler
SELECT first_name, last_name, country
FROM customer
JOIN address
ON customer.address_id = address.address_id
JOIN city
ON address.city_id = city.city_id
JOIN country
ON city.country_id = country.country_id
WHERE country ='Nepal'
ORDER BY country

--5 -- Staff Member #2 had the most transactions
SELECT staff_id, COUNT(payment_id)
FROM payment
GROUP BY staff_id

SELECT staff_id
FROM payment
WHERE staff_id ='2' == 7304
--AND--
SELECT staff_id
FROM payment
WHERE staff_id ='1' == 7292
-- 6--
"G"	178
"PG" 194
"R"	195
"NC-17"	210
"PG-13"	223
SELECT rating, COUNT (film_id)
FROM film
GROUP BY rating
ORDER BY COUNT (film_id);
--7 --
SELECT customer.customer_id, first_name, last_name
FROM customer
WHERE customer_id IN ( 
	SELECT customer_id, amount
	FROM payment
	WHERE amount > 6.99
);

--8-- 24 free rentals were given away
SELECT amount
FROM payment
WHERE amount = 0.00


