--Выбрать записи работников (включить колонки имени, фамилии, телефона, региона),
-- в которых регион неизвестен

SELECT e.first_name, e.last_name, e.home_phone, e.region
FROM employees AS e
WHERE region IS NULL;

-- Выбрать такие страны в которых "зарегистрированы" одновременно заказчики и поставщики,
-- но при этом в них не "зарегистрированы" работники

SELECT country FROM customers
INTERSECT
SELECT address_country FROM suppliers
EXCEPT
SELECT country FROM employees;


