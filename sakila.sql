
-- 1. How many distinct (different) actors' last names are there?

SELECT COUNT(DISTINCT(last_name)) from actor; -- 121 Distinct last names
SELECT DISTINCT(last_name) from actor;

-- 2. In how many different languages where the films originally produced? 
-- (Use the column `language_id` from the `film` table)

SELECT COUNT(language_id) from film; -- 1000 Languages

-- 3.How many movies were released with `"PG-13"` rating?

SELECT rating, COUNT(rating) AS the_count -- 223
FROM film
	WHERE rating = "PG-13";
    
-- 4. Get 10 the longest movies from 2006.
-- CHICAGO NORTH
-- CONTROL ANTHEM
-- DARN FORRESTER
-- GANGS PRIDE
-- HOME PITY
-- MUSCLE BRIGHT
-- POND SEATTLE
-- SOLDIERS EVOLUTION
-- SWEET BROTHERHOOD
-- WORST BANGER
-- CONSPIRACY SPIRIT

SELECT * FROM film
ORDER BY length DESC;

-- 5. How many days has been the company operating (check `DATEDIFF()` function)?


-- 6. Show rental info with additional columns month and weekday. Get 20.

SELECT inventory_id, rental_id, customer_id, rental_date
FROM rental;

-- 7. Add an additional column `day_type` with values 'weekend' and 'workday' 
-- depending on the rental day of the week.
UPDATE rental
SET day_type = 
    CASE 
        WHEN DAYOFWEEK(rental_date) IN (1, 7) THEN 'weekend'
        ELSE 'workday'
    END
WHERE day_type IS NULL;

ALTER TABLE rental ADD COLUMN day_type VARCHAR(10);
UPDATE rental
SET day_type = 
    CASE 
        WHEN DAYOFWEEK(rental_date) IN (1, 7) THEN 'weekend'
        ELSE 'workday'
    END;

-- 8. How many rentals were in the last month of activity?

SELECT last_update FROM rental -- 182 rows returned so im supposing there is as many.
WHERE last_update Between "2024-01-01" and "2024-01-31";

-- 9.Get film ratings. 
-- PG
-- G
-- NC-17
-- PG-13
-- R
SELECT DISTINCT(rating) from film;

-- 10. Get release years
-- 2006
SELECT (release_year) from film;

-- 11. Get all films with ARMAGEDDON in the title.
-- 6
SELECT title
FROM film
WHERE title LIKE ("%ARMAGEDDON%");

-- 12. Get all films with APOLLO in the title
-- 6
SELECT title
FROM film
WHERE title LIKE ("%APOLLO%");

-- 13. Get all films which title ends with APOLLO.
-- 5 
SELECT title
FROM film
WHERE title LIKE ("%APOLLO");

-- 14. Get all films with word DATE in the title.

SELECT title
FROM film
WHERE CONCAT(' ', title, ' ') LIKE "% DATE %";

-- 15. Get 10 films with the longest title.

SELECT title FROM film
ORDER BY title DESC
limit 10;

-- 16. Get 10 the longest films.

SELECT title, length FROM film
ORDER BY length desc
limit 10;

-- 17.How many films include **Behind the Scenes** content?

SELECT COUNT(special_features)
FROM film
WHERE special_features LIKE ("%Behind the scenes%");

-- 18. List films ordered by release year and title in alphabetical order.

SELECT title, release_year FROM film
WHERE title > "a";

-- 19. Drop column `picture` from `staff`.

ALTER TABLE staff
DROP COLUMN picture;

-- 20. A new person is hired to help Jon. Her name is TAMMY SANDERS, and she is a customer. Update the database accordingly.

SELECT *
FROM customer
WHERE first_name = "TAMMY" AND last_name = "SANDERS";
INSERT INTO staff VALUES
(3, "Tammy", "Sanders", 79, "TAMMY.SANDERS@sakilacustomer.org", 2, 1, "Tam", "password", "2006-02-15 03:57:16");

-- 21. sdfasda


SELECT *
FROM rental
WHERE rental_id = 1;
SELECT customer_id
FROM customer
WHERE first_name = "Charlotte" AND last_name = "Hunter";
SELECT film_id
FROM film
WHERE title = "Academy Dinosaur";
INSERT INTO rental VALUES
(16050, "2024-01-31 16:01:30", 1, 130, null, 1, "2024-01-31 16:01:30");


-- 22.

SELECT *
FROM customer
WHERE active = 0;
SET SQL_SAFE_UPDATES=0;
CREATE TABLE delete_users AS
SELECT customer_id, email, last_update FROM customer WHERE active = 0;
SELECT * FROM customer;
DELETE FROM customer WHERE active = 0;






