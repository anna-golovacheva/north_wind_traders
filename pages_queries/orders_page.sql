--Выбрать все заказы, отсортировать по required_date (по убыванию)
-- и отсортировать по дате отгрузки (по возрастанию)

SELECT * FROM orders AS o
ORDER BY required_date DESC, shipped_date;

--Найти среднее значение дней, уходящих на доставку с даты формирования заказа в USA

SELECT AVG(orders.shipped_date - orders.order_date)
FROM orders
WHERE orders.ship_country = 'USA';

--Найти сумму, на которую имеется товаров (количество * цену) причём таких,
-- которые не сняты с продажи (см. на поле discontinued)

SELECT SUM(products.unit_price * products.units_in_stock)
FROM products
WHERE products.discontinued = 0;

