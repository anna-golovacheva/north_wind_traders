SELECT pr.product_id, pr.product_name, cat.category_name, pr.unit_price
FROM products AS pr JOIN categories AS cat USING(category_id)
WHERE pr.product_id = 1;