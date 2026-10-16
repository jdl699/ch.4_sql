query 1:SELECT CONCAT(customer.last_name, ', ', customer.first_name) AS customer_name, 
       CONCAT(actor.last_name, ', ', actor.first_name) AS actor_name 
FROM customer 
JOIN actor ON customer.first_name = actor.first_name 
ORDER BY customer_name;

query 2:SELECT c1.customer_id, c1.store_id, c1.first_name, c1.last_name 
FROM customer c1, customer c2 
WHERE c1.first_name = c2.first_name 
  AND c1.customer_id <> c2.customer_id 
ORDER BY c1.first_name, c1.last_name;

query 3:SELECT 
    staff.staff_id, 
    CONCAT(staff.last_name, ', ', staff.first_name) AS staff_name, 
    staff.email, 
    staff.store_id, 
    address.district, 
    city.city, 
    country.country 
FROM staff
JOIN address 
    ON staff.address_id = address.address_id
JOIN city 
    ON address.city_id = city.city_id
JOIN country 
    ON city.country_id = country.country_id
ORDER BY 
    staff.last_name, 
    staff.first_name;
	
query 4SELECT 
    staff.staff_id, 
    CONCAT(staff.last_name, ', ', staff.first_name) AS staff_name, 
    staff.email, 
    staff.store_id, 
    address.district, 
    city.city, 
    country.country 
FROM 
    staff, 
    address, 
    city, 
    country 
WHERE 
    staff.address_id = address.address_id 
    AND address.city_id = city.city_id 
    AND city.country_id = country.country_id 
ORDER BY 
    staff.last_name, 
    staff.first_name;
	
	
query 5:SELECT 
    film.film_id, 
    film.title, 
    rental.rental_id, 
    rental.rental_date 
FROM 
    film 
LEFT JOIN 
    inventory 
    ON film.film_id = inventory.film_id 
LEFT JOIN 
    rental 
    ON inventory.inventory_id = rental.inventory_id 
WHERE 
    rental.rental_id IS NULL 
ORDER BY 
    film.title;
	

query 6:SELECT 
    film.film_id, 
    film.title, 
    language.language_id, 
    language.name 
FROM 
    film 
RIGHT JOIN 
    language 
    ON film.language_id = language.language_id 
WHERE 
    film.film_id IS NULL 
ORDER BY 
    language.name;
	

query 7:SELECT 
    staff.staff_id, 
    CONCAT(staff.last_name, ', ', staff.first_name) AS staff_name, 
    staff.email, 
    staff.store_id, 
    address.district, 
    city.city, 
    country.country 
FROM 
    staff 
JOIN 
    address USING (address_id) 
JOIN 
    city USING (city_id) 
JOIN 
    country USING (country_id) 
ORDER BY 
    staff.last_name, 
    staff.first_name;
	
query 8:SELECT 
    staff.staff_id, 
    CONCAT(staff.last_name, ', ', staff.first_name) AS staff_name, 
    staff.email, 
    staff.store_id, 
    address.district, 
    city.city, 
    country.country 
FROM 
    staff 
JOIN 
    address USING (address_id) 
JOIN 
    city USING (city_id) 
JOIN 
    country USING (country_id) 
ORDER BY 
    staff.last_name, 
    staff.first_name;
	
query 9:SELECT 
    film_text.film_id, 
    film_text.title, 
    inventory.store_id, 
    inventory.inventory_id 
FROM 
    film_text 
NATURAL JOIN 
    inventory 
ORDER BY 
    film_text.title, 
    inventory.store_id, 
    inventory.inventory_id 
LIMIT 100;

query 10:SELECT 
    staff.staff_id, 
    staff.first_name, 
    staff.last_name, 
    store.store_id 
FROM 
    staff 
CROSS JOIN 
    store 
ORDER BY 
    staff.staff_id, 
    store.store_id;
	
query 11:SELECT 
    customer_id, 
    rental_id, 
    rental_date, 
    inventory_id, 
    'IN' AS status 
FROM 
    rental 
WHERE 
    customer_id = 9 
    AND return_date IS NOT NULL 

UNION 

SELECT 
    customer_id, 
    rental_id, 
    rental_date, 
    inventory_id, 
    'OUT' AS status 
FROM 
    rental 
WHERE 
    customer_id = 9 
    AND return_date IS NULL 

ORDER BY 
    rental_date;

query 12:SELECT 
    film.film_id, 
    film.title, 
    language.language_id, 
    language.name 
FROM 
    film 
LEFT JOIN 
    language 
    ON film.language_id = language.language_id 

UNION 

SELECT 
    film.film_id, 
    film.title, 
    language.language_id, 
    language.name 
FROM 
    film 
RIGHT JOIN 
    language 
    ON film.language_id = language.language_id 

ORDER BY 
    language_id DESC, 
    title ASC;
	