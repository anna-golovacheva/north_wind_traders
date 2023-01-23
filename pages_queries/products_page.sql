--Найти активные (см. поле discontinued) продукты из категории Beverages и Seafood,
-- которых в продаже менее 20 единиц. Вывести наименование продуктов, кол-во единиц в продаже,
-- имя контакта поставщика и его телефонный номер.

SELECT pr.product_name, pr.units_in_stock, s.contact_name, s.phone
FROM categories AS cat
JOIN products AS pr ON pr.category_id = cat.category_id
JOIN suppliers AS s ON s.id_supplier = pr.supplier_id
WHERE (cat.category_name = 'Beverages' OR cat.category_name = 'Seafood')
AND pr.units_in_stock < 20
AND pr.discontinued = 0;
