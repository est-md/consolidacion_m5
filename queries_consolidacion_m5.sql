-- Insercion de datos
-- tabla customers

INSERT INTO customer(customer_id, store_id, first_name, last_name, email, 
address_id, activebool, create_date, last_update, active)
VALUES (600, 1, 'Juan', 'Django', 'jdjango@postgre.com', 21, true, '2024-12-17',
'2024-12-17 10:53:35.125', 1);

-- staff
SELECT * FROM staff;
INSERT INTO staff(staff_id, first_name, last_name, address_id, email, store_id, 
active, username, password, last_update, picture)
VALUES (3, 'John', 'Halo', '3', 'johnhalo@postgre.com', 1, true, 'John', 
'8cb2237d0679ca8c6befc6745513964', '2024-12-17 11:41:00.000', null);

-- actors

SELECT * FROM actor;
INSERT INTO actor(actor_id, first_name, last_name, last_update)
VALUES (201, 'Ryan', 'Duckling', '2025-12-17 11:50:00.000');

-- modificacion de datos
-- customer

UPDATE customer
SET email = 'juandjango@postgre.com'
WHERE customer_id = 600;

-- staff

SELECT * FROM staff;
UPDATE staff
SET username = 'jstephens'
WHERE staff_id = 2;

-- actor

UPDATE actor
SET first_name = 'Rayana'
WHERE actor_id = 64;

-- Listar todas las rental con los datos del customer dado un año y mes

SELECT rental_m_y.rental_id, rental_m_y.rental_date, rental_m_y.inventory_id, 
rental_m_y.customer_id, rental_m_y.return_date, customer_rental.first_name,  customer_rental.last_name,  customer_rental.email 
FROM rental rental_m_y
JOIN customer customer_rental
ON rental_m_y.customer_id = customer_rental.customer_id
AND EXTRACT(MONTH FROM rental_date) = 5
WHERE EXTRACT(YEAR FROM rental_date) = 2005;

-- Listar Número, Fecha (payment_date) y Total (amount) de todas las payment

SELECT payment_id "Number", payment_date "Date", amount "Total" FROM payment
ORDER BY "Total";

-- Listar todas las film del año 2006 que contengan un (rental_rate) mayor a 4


SELECT * FROM film 
WHERE release_year = 2006 AND rental_rate > 4
ORDER BY title;

-- Realiza un Diccionario de datos que contenga el nombre de las tablas y columnas, si éstas pueden ser nulas, y su tipo de dato correspondiente

SELECT isc.table_name "Tabla", 	
 isc.column_name "Columna",
 isc.is_nullable  "Acepta Nulo",
 isc.data_type "Tipo de dato"
FROM information_schema.columns isc
INNER JOIN PG_CLASS t2 ON (t2.RELNAME = isc.TABLE_NAME)
WHERE isc.TABLE_SCHEMA = 'public'
ORDER BY isc.TABLE_NAME;
