USE express_grocery;

-- Retrieve name, brand, price and supplier name for all products.
SELECT product_name,
		brand,
        price,
        supplier_name
FROM	products 
INNER JOIN	suppliers
ON		products.supplier_id = suppliers.supplier_id;

-- ALTERNATIVELY, USE 'USING' KEYWORD WITH COMMON FILED IN PARENTHESES

SELECT product_name,
		brand,
        price,
        supplier_name
FROM	products 
INNER JOIN	suppliers
USING (supplier_id);

-- Retrieve name, brand, price and supplier name for all products.
-- This does not work because common field is not aliased.
SELECT product_name,
		brand,
        price,
        supplier_id,
        supplier_name
FROM	products 
INNER JOIN	suppliers
ON		products.supplier_id = suppliers.supplier_id;


SELECT  products.product_name,
		products.brand,
        products.price,
        products.supplier_id,
        suppliers.supplier_name
FROM	products 
INNER JOIN	suppliers
ON		products.supplier_id = suppliers.supplier_id;


SELECT  p.product_name,
		p.brand,
        p.price,
        p.supplier_id,
        su.supplier_name
FROM	products AS p
INNER JOIN	suppliers AS su
ON		p.supplier_id = su.supplier_id;

-- ALTERNATIVELY, USE 'USING' COMMAND
SELECT  p.product_name,
		p.brand,
        p.price,
        p.supplier_id,
        su.supplier_name
FROM	products AS p
INNER JOIN	suppliers AS su
USING (supplier_id);


-- All products supplied by suppliers from Deptford
SELECT	su.supplier_id,
		p.product_id
FROM	products AS p
JOIN	suppliers AS su
ON		p.supplier_id = su.supplier_id
WHERE	borough = 'Deptford';


-- ALTERNATIVELY, USE 'USING' COMMAND
SELECT	su.supplier_id,
		p.product_id
FROM	products AS p
JOIN	suppliers AS su
USING (supplier_id)
WHERE	su.borough = 'Deptford';


-- Total sales amount for each product id and name
SELECT	s.product_id,
		p.product_name,
		SUM(s.sales_amount) AS total_sales
FROM	sales AS s
JOIN	products AS p
ON		s.product_id = p.product_id
GROUP BY	product_id
ORDER BY	total_sales;

-- ALTERNATIVELY, USE 'USING' KEYWORD
SELECT	s.product_id,
		p.product_name,
		SUM(s.sales_amount) AS total_sales
FROM	sales AS s
JOIN	products AS p
USING (product_id)
GROUP BY	product_id
ORDER BY	total_sales;


-- Total sales amount per salesperson, including salesperson name.
SELECT	sa.first_name,
		sa.last_name,
        SUM(s.sales_amount) AS total_sales
FROM	salespersons AS sa
JOIN	sales AS s
ON		sa.salesperson_id = s.salesperson_id
GROUP BY sa.first_name, sa.last_name
ORDER BY	total_sales;


-- ALTERNATIVELY, USE 'USING' COMMAND
SELECT	sa.first_name,
		sa.last_name,
        SUM(s.sales_amount) AS total_sales
FROM	salespersons AS sa
JOIN	sales AS s
USING (salesperson_id)
GROUP BY sa.first_name, sa.last_name
ORDER BY	total_sales;


-- Salesperson with the highest total sales amount
-- SUM aggregate funcion is firstly used to retrieve the total sales, 
-- followed by summarising, ordering and limiting result to the row with the highest total sales amount. 
SELECT	sa.first_name,
		sa.last_name,
        SUM(s.sales_amount) AS total_sales
FROM	salespersons AS sa
JOIN	sales AS s
ON		sa.salesperson_id = s.salesperson_id
GROUP BY sa.first_name, sa.last_name
ORDER BY	total_sales DESC
LIMIT 1;

-- ALTERNATIVELY, USE 'USING' Keyword
SELECT	sa.first_name,
		sa.last_name,
        SUM(s.sales_amount) AS total_sales
FROM	salespersons AS sa
JOIN	sales AS s
USING (salesperson_id)
GROUP BY sa.first_name, sa.last_name
ORDER BY	total_sales DESC
LIMIT 1;


-- INVOLVING THREE TABLES
-- category name, product name, supplier name for all products
SELECT c.category_name,
		p.product_name,
        su.supplier_name
FROM	products AS p
JOIN	categories AS c
ON		p.category_id = c.category_id
JOIN	suppliers su
ON		p.supplier_id = su.supplier_id;




-- MORE - DISADVANTAGE OF USING THE 'USING' COMMAND
ALTER TABLE suppliers
RENAME COLUMN supplier_id to id;


-- RETURNS AN ERROR, COLUMN NOT RECOGNISED. SAME ERROR IS RETURNED USING 'id' COLUMN. 
SELECT  p.product_name,
		p.brand,
        p.price,
        p.supplier_id,
        su.supplier_name
FROM	products AS p
INNER JOIN	suppliers AS su
USING (supplier_id);


-- BUT THE 'ON' COMMAND WORKS.
SELECT  p.product_name,
		p.brand,
        p.price,
        p.supplier_id,
        su.supplier_name
FROM	products AS p
INNER JOIN	suppliers AS su
ON p.supplier_id = su.id;

-- CHANGING BACK TO 'supplier_id'
ALTER TABLE suppliers
RENAME COLUMN id to supplier_id;

--                       						 END													-- 