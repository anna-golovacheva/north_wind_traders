SELECT cat.category_id, cat.category_name, cat.description, array_agg(pr.product_name)
FROM products pr JOIN categories cat USING(category_id)
WHERE cat.category_id = 1
GROUP BY cat.category_id;