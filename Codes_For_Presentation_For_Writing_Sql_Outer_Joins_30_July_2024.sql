USE express_grocery;

-- Retrieve the id, name, weight and sales amount of all products, including products that have not been sold. 
SELECT  p.product_id,
		p.product_name,
        p.weight,
        s.sales_amount
FROM	products AS p
LEFT OUTER JOIN	sales AS s
ON	p.product_id = s.product_id;

-- USING 'USING'
SELECT  p.product_id,
		p.product_name,
        p.weight,
        s.sales_amount
FROM	products AS p
LEFT OUTER JOIN	sales AS s
USING (product_id);

-- USING RIGHT JOIN EQUIVALENT
SELECT  p.product_id,
		p.product_name,
        p.weight,
        s.sales_amount
FROM	sales AS s
RIGHT OUTER JOIN	products AS p
ON	p.product_id = s.product_id;


SELECT  p.product_id,
		p.product_name,
        p.weight,
        s.sales_amount
FROM	sales AS s
RIGHT OUTER JOIN	products AS p
USING (product_id);


-- Salespersons id and corresponding total sales, including salespersons who have no sales record.
SELECT sa.salesperson_id,
		SUM(DISTINCT s.sales_amount) AS total_sales
FROM	salespersons AS sa
LEFT JOIN	sales AS s
ON	sa.salesperson_id = s.salesperson_id
GROUP BY sa.salesperson_id;


-- RIGHT JOIN EQUIVALENT
SELECT sa.salesperson_id,
		SUM(DISTINCT s.sales_amount) AS total_sales
FROM	sales AS s
RIGHT JOIN	salespersons AS sa
ON	sa.salesperson_id = s.salesperson_id
GROUP BY sa.salesperson_id;


-- categories and their product count, including categories without products
SELECT c.category_id,
		COUNT(DISTINCT p.product_id) AS prod_count
FROM	categories AS c
LEFT JOIN	products AS p
ON	c.category_id = p.category_id
GROUP BY c.category_id;


-- RIGHT JOIN EQUIVALENT
SELECT c.category_id,
		COUNT(DISTINCT p.product_id) AS prod_count
FROM	products AS p
RIGHT JOIN	categories AS c
ON	c.category_id = p.category_id
GROUP BY c.category_id;



-- Salespersons first names and total quantity sold 
SELECT sa.first_name,
		SUM(DISTINCT s.quantity) AS total_quan
FROM	salespersons AS sa
LEFT JOIN	sales AS s
ON	sa.salesperson_id = s.salesperson_id
GROUP BY sa.first_name;

-- RIGHT JOIN EQUIVALENT
SELECT sa.first_name,
		SUM(DISTINCT s.quantity) AS total_quan
FROM	sales AS s
RIGHT JOIN	salespersons AS sa
ON	sa.salesperson_id = s.salesperson_id
GROUP BY sa.first_name;

-- All suppliers and product count, including suppliers without any products
SELECT	su.supplier_id,
		COUNT(DISTINCT p.product_id) AS prod_count
FROM	suppliers AS su
LEFT JOIN	products AS p
ON	su.supplier_id = p.supplier_id
GROUP BY su.supplier_id;

-- RIGHT JOIN EQUIVALENT
SELECT	su.supplier_id,
		COUNT(DISTINCT p.product_id) AS prod_count
FROM	products AS p
RIGHT JOIN	suppliers AS su
ON	su.supplier_id = p.supplier_id
GROUP BY su.supplier_id;


-- WITH TWO CONDITIONS: AN 'ON' CONDITION AND AN 'AND' CONDITION
-- Supplier name of all products with id greater than 20.
SELECT DISTINCT p.product_id,
		su.supplier_name
FROM	products AS p
LEFT JOIN suppliers AS su
ON	su.supplier_id = p.supplier_id
AND p.product_id > 20
ORDER BY p.product_id;

-- RIGHT JOIN EQUIVALENT
SELECT DISTINCT p.product_id,
		su.supplier_name
FROM	suppliers AS su
RIGHT JOIN products AS p
ON	su.supplier_id = p.supplier_id
AND p.product_id > 20
ORDER BY p.product_id;

-- WITH ONE CONDITION, FOLLOWED BY THE 'WHERE' FILTER COMMAND
SELECT DISTINCT p.product_id,
		su.supplier_name
FROM	products AS p
LEFT JOIN suppliers AS su
ON	su.supplier_id = p.supplier_id
WHERE	p.product_id > 20
ORDER BY p.product_id;



-- INVOLVING THREE TABLES
-- All categories and suppliers names, including categories without suppliers.
 SELECT	DISTINCT c.category_name,
		su.supplier_name
FROM	categories AS c
LEFT JOIN	products AS p
ON	c.category_id = p.category_id
LEFT JOIN suppliers AS su
ON	p.supplier_id = su.supplier_id;

-- RIGHT JOIN EQUIVALENT
SELECT	DISTINCT c.category_name,
		su.supplier_name
FROM	suppliers AS su
RIGHT JOIN	products AS p
ON	su.supplier_id = p.supplier_id
RIGHT JOIN categories AS c
ON	p.category_id = c.category_id;



