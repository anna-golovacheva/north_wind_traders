--Посчитать количество заказчиков

SELECT count(*) AS cnt
FROM customers;

--Выбрать все уникальные сочетания городов и стран, в которых "зарегистрированы" заказчики

SELECT DISTINCT country, city
FROM customers;

--Найти заказчиков и обслуживающих их заказы сотрудников, таких, что и заказчики и сотрудники из
--города London, а доставка идёт компанией Speedy Express. Вывести компанию заказчика и ФИО сотрудника.

SELECT cr.company_name, e.first_name, e.last_name
FROM shippers AS sh JOIN orders AS o ON o.ship_via = sh.shipper_id
JOIN customers AS cr ON cr.customer_id = o.customer_id
JOIN employees AS e ON e.employee_id = o.employee_id
WHERE cr.city = 'London' AND e.city = 'London' AND sh.company_name = 'Speedy Express';

--Найти заказчиков, не сделавших ни одного заказа. Вывести имя заказчика и order_id.

SELECT customers.company_name
FROM customers
WHERE customer_id NOT IN (SELECT DISTINCT customer_id FROM orders);


