USE express_grocery;

-- 1. List the id and names of products with weight greater than 0.5kg.

SELECT product_id, 
	   product_name,
       weight
FROM   products
WHERE  weight > 0.5;

CREATE VIEW halfkg_plus
AS
SELECT product_id,
       product_name,
       weight
FROM   products
WHERE  weight > 0.5;

SELECT * FROM halfkg_plus;

-- 2. List the id, name and phone number of all suppliers in the suppliers table.
SELECT supplier_id,
	   supplier_name,
	   phone_number
FROM   suppliers;

CREATE VIEW supplier_details
AS
SELECT supplier_id,
		supplier_name,
        phone_number
FROM suppliers;

SELECT * FROM supplier_details;
SELECT supplier_name 
FROM supplier_details
WHERE supplier_id <= 6;

-- 3. Total number of products in each category
SELECT DISTINCT category_id,
		COUNT(product_id) AS num_of_prod
FROM products
GROUP BY category_id
ORDER BY category_id;

CREATE VIEW prod_in_cat
AS
SELECT DISTINCT category_id,
		COUNT(product_id) AS num_of_products
FROM products
GROUP BY category_id
ORDER BY category_id;

SELECT * FROM prod_in_cat;




-- CREATING VIEWS BASED ON OTHER VIEWS

-- 4. Represent the number of products from categories with id higher than 2 (based on the prod_in_cat view)
SELECT DISTINCT category_id,
		num_of_products
FROM prod_in_cat
WHERE category_id > 2;

CREATE VIEW prod_in_cat2
AS
SELECT DISTINCT category_id,
		num_of_products
FROM prod_in_cat
WHERE category_id > 2;

SELECT * FROM prod_in_cat2;


-- 5. List the id, name and weight of products with weight between 1 and 1.5KG (based on halfkg_plus)
SELECT  product_id,
	    product_name,
		weight
FROM   halfkg_plus
WHERE  weight BETWEEN 1 AND 1.5;

CREATE VIEW kg_range
AS
SELECT  product_id,
	    product_name,
		weight
FROM   halfkg_plus
WHERE  weight BETWEEN 1 AND 1.5;

SELECT * FROM kg_range;
-- To show the views as virtual tables and table types
SHOW FULL TABLES;



-- CREATING VIEWS TO REPLACE EXISTING VIEWS

-- 6. Replace halfkg_plus
-- list id, name, and weight of products whose weight are greater than 0.5 and have not been sold.
SELECT p.product_id,
	   p.product_name,
       p.weight
FROM 
	   products p
LEFT JOIN 
	   sales s
ON
	   p.product_id = s.product_id
WHERE  p.weight > 0.5
AND s.sales_amount IS NULL;
-- the view
CREATE OR REPLACE VIEW halfkg_plus
AS
SELECT p.product_id,
	   p.product_name,
       p.weight
FROM 
	   products p
LEFT JOIN 
	   sales s
ON
	   p.product_id = s.product_id
WHERE  p.weight > 0.5
AND s.sales_amount IS NULL;

-- querying the view
SELECT * FROM halfkg_plus;


-- Replace supplier details. 
-- 7. Retrieve ids, names and phone number of all suppliers who supply products in the "Frozen Foods" category.
SELECT supplier_id,
	   supplier_name,
	   phone_number
FROM suppliers
WHERE supplier_id IN (SELECT DISTINCT supplier_id 
FROM products
WHERE category_id IN (SELECT category_id
FROM categories
WHERE category_name = 'Frozen Foods'));

CREATE OR REPLACE VIEW supplier_details
AS
SELECT supplier_id,
		supplier_name,
        phone_number
FROM suppliers
WHERE supplier_id IN (SELECT DISTINCT supplier_id 
FROM products
WHERE category_id IN (SELECT category_id
FROM categories
WHERE category_name = 'Frozen Foods'));

SELECT * FROM supplier_details;

                    --              END                --