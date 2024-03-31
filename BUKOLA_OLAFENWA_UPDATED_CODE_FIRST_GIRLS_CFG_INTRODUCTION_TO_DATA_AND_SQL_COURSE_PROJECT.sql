-- NAME: BUKOLA RUTH OLAFENWA  
-- TITLE: EXPRESS GROCERY SHOP INSIGHTS: A DATA & SQL DATABASE PROJECT
-- COURSE: INTRODUCTION TO DATA & SQL
-- DATABASE Expressgrocery is populated with five tables.
-- Primary and foreign keys are, especially, better defined. 
-- A join, a view, a stored function, and an example query with a subquery are featured.
-- Two triggers are created for the categories table.
-- Four updates to the categories, suppliers, products and salespersons tables in the database.
-- An example query with group by and having.

CREATE DATABASE express_grocery;

USE express_grocery;

-- TABLE CATEGORIES
CREATE TABLE categories
(category_id INT PRIMARY KEY AUTO_INCREMENT,
category_name VARCHAR(30) NOT NULL,
date_created DATETIME DEFAULT CURRENT_TIMESTAMP,
date_modified DATETIME ON UPDATE CURRENT_TIMESTAMP
);


INSERT INTO categories
(category_name)
VALUES
('Frozen Foods'),
('Drinks'),
('Tinned Food'),
('Fruits'),
('Bakery');



-- TABLE SUPPLIERS
CREATE TABLE suppliers
(supplier_id INT PRIMARY KEY AUTO_INCREMENT,
supplier_name VARCHAR(50) NOT NULL,
phone_number CHAR(11) NOT NULL,
email VARCHAR(50) NOT NULL,
borough VARCHAR(40) NOT NULL,
date_created DATETIME DEFAULT CURRENT_TIMESTAMP,
date_modified DATETIME ON UPDATE CURRENT_TIMESTAMP
);


INSERT INTO suppliers
(supplier_name, phone_number, email, borough)
VALUES
('Jane', '07444444333', 'jane@sheerfrozenfoods.com', 'Barking'),
('Marcus', '07388899950', 'marcus@justfoods.com', 'Lewisham'),
('Scott', '07111666111', 'scott@fishrepublic.org', 'Deptford'),
('Ali', '07999666111', 'ali@alldrinkswholesale.com', 'Hackney'),
('Theo', '07522299977', 'theojohn@gmail.com', 'Islington'),
('Fatima', '07333666111', 'fatimaabdul@everythinggrocery.com', 'Tottenham'),
('Eric', '07411120120', 'ericwilson@heinzproductsdistributor.com', 'Ealing'),
('Rob', '07366677799', 'rob@frozenfoodssolution.org', 'Lewisham'),
('Stuart', '07633322211', 'stuart@fruitdomain', 'Harrow'),
('Sean', '07211199930', 'sean@tinnedfoodwholesale.com', 'Deptford'),
('Sara', '07533399920', 'sara@deptfordcatering.com', 'Deptford'),
('Heena','07599998888', 'heena@bakeryandbeverages.com', 'Harrow');



-- TABLE PRODUCTS
CREATE TABLE products
(product_id INT PRIMARY KEY AUTO_INCREMENT,
product_name VARCHAR(50) NOT NULL,
brand VARCHAR(50) NOT NULL,
weight CHAR(5) NOT NULL,
unit CHAR(2) NOT NULL,
price DECIMAL(5,2) NOT NULL,
category_id INT,
supplier_id INT,
date_created DATETIME DEFAULT CURRENT_TIMESTAMP,
date_modified DATETIME ON UPDATE CURRENT_TIMESTAMP,
CONSTRAINT fk_category_id
FOREIGN KEY (category_id)
REFERENCES categories(category_id),
CONSTRAINT fk_supplier_id
FOREIGN KEY (supplier_id)
REFERENCES suppliers(supplier_id)
);


INSERT INTO products
(product_name, brand, weight, unit, price, category_id, supplier_id)
VALUES
('Chicken Wings', 'Pluvera', 1, 'KG', 1.99, 1, 1),
('Chicken Drumsticks', 'Pluvera', 1, 'KG', 1.99, 1, 1),
('Turkey Thighs', 'Harmony Farm', 1, 'KG', 1.89, 1, 2),
('Assorted Meat', 'Pluvera', 1, 'KG', 2.55, 1, 1),
('Prawns', 'Bay Of Bengal', 0.5, 'KG', 3.00, 1, 3),
('Tilapia', 'Ibco', 0.4, 'KG', 6.69, 1, 3),
('Mackerel', 'British', 0.4, 'KG', 1.99, 1, 3),
('French Fries', 'McCAIN', 0.9, 'KG', 3.45, 1, 8),
('Jacket Potatoes', 'McCAIN', 0.9, 'KG', 3.15, 1, 8),
('Vanilla Icecream', 'Viennetta', 0.65, 'L', 2.15, 1, 8),
('Chocolate Drink', 'Yazoo', 0.4, 'L', 0.85, 2, 4),
('Natural Mineral Water', 'Buxton', 1.5, 'L', 1.00, 2, 4),
('Orange and Mango Fruit Juice', 'Tropicana', 0.85, 'L', 2.19, 2, 4),
('Apple Fruit Juice', 'Tropicana', 0.9, 'L', 2.19, 2, 4),
('Coconut Chilled Drink', 'ALPRO', 1, 'L', 2.65, 2, 6),
('Semiskimmed Milk', 'Mortons', 2, 'L', 1.49, 2, 6),
('Banana Flavoured Milk', 'Nurishment', 0.4, 'KG', 1.60, 2, 6),
('Instant Coffee', 'Nescafe', 0.3, 'KG', 3.69, 2, 6),
('Drinking Hot Chocolate', 'Cadbury', 0.5, 'KG', 4.29, 2, 6),
('Original Sweetcorn', 'Green Giant', 0.34, 'KG', 1.50, 3, 10),
('Salt Free Sweetcorn', 'Green Giant', 0.198, 'KG', 0.90, 3, 10),
('Baked Beans', 'Heinz', 0.415, 'KG', 1.75, 3, 7),
('Sardines In Olive Oil', 'John West', 0.095, 'KG', 1.50, 3, 10),
('Chicken and Vegetable Soup', 'Heinz', 0.2, 'KG', 1.10, 3, 7),
('Chick Peas', 'Napolina', 0.4, 'KG', 1.45, 3, 10),
('Chestnuts', 'Merchant Gourmet', 0.18, 'KG', 2.50, 3, 10),
('Spaghetti', 'Heinz', 0.2, 'KG', 1.10, 3, 10),
('Fair Loose Bananas', 'Adept Farms', 1, 'KG', 1.35, 4, 9),
('Strawberries', 'Adept Farms', 0.5, 'KG', 1.49, 4, 9),
('Green Seedless Grapes', 'Stamford', 0.5, 'KG', 1.49, 4, 9),
('Red Seedless Grapes', 'M&S', 0.5, 'KG', 2.55, 4, 9),
('Gala Apples', 'Adept Farms', 1, 'KG', 2.95, 4, 9),
('Brae Apples', 'Adept Farms', 1, 'KG', 2.95, 4, 9),
('Easy Peelers', 'M&S', 0.6, 'KG', 2.15, 4, 9),
('Root Ginger', 'Natoora', 0.12, 'KG', 1.80, 4, 5),
('Oranges', 'Flavourz', 0.175, 'KG', 0.80, 4, 9),
('Carrots', 'M&S', 1, 'KG', 2.00, 4, 9),
('Red Onions', 'Countryside Farms', 5, 'KG', 2.49, 4, 5),
('White Soft Bread', 'Kingsmill', 0.8, 'KG', 1.45, 5, 12),
('Wholemeal Bread', 'Warburtons', 0.4, 'KG', 1.15, 5, 12),
('Jaffa Cakes', 'Mcvities', 0.122, 'KG', 1.39, 5, 6),
('Cake', 'Mr Kipling Battenberg', 0.23, 'KG', 2.75, 5, 6),
('Almond Crossiant', 'June', 0.1, 'KG', 1.39, 5, 11),
('Butter Crossiant', 'June', 0.1, 'KG', 1.19, 5, 11),
('Cookies Double Chocolate', 'Maryland', 0.2, 'KG', 1.65, 5, 6);



-- TABLE SALESPERSONS
CREATE TABLE salespersons
(salesperson_id INT PRIMARY KEY AUTO_INCREMENT,
first_name VARCHAR(40) NOT NULL,
last_name VARCHAR(40) NOT NULL,
email VARCHAR(50) NOT NULL,
phone_number CHAR(11) NOT NULL,
number INT NOT NULL,
street VARCHAR(50) NOT NULL,
district VARCHAR(50) NOT NULL,
date_created DATETIME DEFAULT CURRENT_TIMESTAMP,
date_modified DATETIME ON UPDATE CURRENT_TIMESTAMP
);


INSERT INTO salespersons
(first_name, last_name, email, phone_number, number, street, district)
VALUES
('Abdul', 'Jalal', 'abduljalal@gmail.com', '07544889922', 49, 'Swallow Avenue', 'Stratford'), 
('Julie', 'Peters', 'juliepeters@hotmail.com', '07211133355', 64, 'Plaistow Rd', 'Plaistow'), 
('Femi', 'Segun', 'femisegun@hotmail.com', '07566622244', 4, 'Holbrook Rd', 'Plaistow'), 
('Scott', 'May', 'scottmay@gmail.com', '07222888999', 7, 'Corporation Rd', 'Plaistow');



-- TABLE SALES
CREATE TABLE sales
(sales_id INT,
sales_date DATE,
salesperson_id INT,
product_id INT,
quantity INT,
sales_amount DECIMAL(5,2),
PRIMARY KEY(sales_id, sales_date),
CONSTRAINT fk_salesperson_id
FOREIGN KEY (salesperson_id)
REFERENCES salespersons(salesperson_id),
CONSTRAINT fk_product_id
FOREIGN KEY (product_id)
REFERENCES products(product_id)
);

INSERT INTO sales
(sales_id, sales_date, salesperson_id, product_id, quantity, sales_amount)
VALUES
(1633, '2023-07-09', 1, 1, 2, 3.98),
(1788, '2023-07-09', 1, 1, 5, 3.98),
(1801, '2023-07-10', 4, 2, 3, 5.97),
(1866, '2023-07-10', 4, 25, 2, 2.90),
(1999, '2023-07-10', 4, 30, 4, 5.96),
(2002, '2023-07-11', 1, 35, 5, 9.00), 
(2088, '2023-07-11', 3, 1, 7, 13.98),
(2133, '2023-07-11', 2, 2, 2, 3.98),
(2191, '2023-07-11', 1, 6, 3, 20.07),
(2309, '2023-07-12', 1, 10, 3, 6.45),
(2375, '2023-07-12', 3, 15, 5, 13.25), 
(2388, '2023-07-12', 1, 15, 3, 7.95), 
(2555, '2023-07-13', 4, 3, 6, 11.34), 
(2601, '2023-07-13', 4, 2, 6, 11.94), 
(2681, '2023-07-14', 4, 1, 10, 19.90), 
(2712, '2023-07-14', 2, 42, 12, 33.00), 
(2800, '2023-07-14', 4, 45, 15, 24.75), 
(20, '2023-08-01', 1, 10, 5, 10.75), 
(140, '2023-08-01', 1, 7, 15, 29.85), 
(517, '2023-08-03', 3, 5, 12, 36.00),
(799, '2023-08-04', 2, 2, 20, 39.80), 
(803, '2023-08-05', 1, 16, 13, 19.37), 
(1001, '2023-08-06', 1, 16, 25, 37.25), 
(1205, '2023-08-07', 3, 3, 30, 56.7), 
(1299, '2023-08-07', 2, 2, 26, 51.74), 
(1361, '2023-08-07', 2, 1, 29, 57.71), 
(1902, '2023-08-10', 3, 19, 15, 64.35), 
(1999, '2023-09-10', 3, 19, 11, 47.19), 
(2040, '2023-09-11', 1, 25, 17, 24.65), 
(2089, '2023-09-11', 1, 31, 20, 51),
(2103, '2023-09-11', 1, 25, 10, 14.5),
(2114, '2023-09-11', 1, 25, 19, 27.55),
(2167, '2023-09-11', 4, 3, 7, 13.23),
(2190, '2023-09-11', 1, 2, 22, 43.78),
(230, '2023-10-02', 4, 37, 12, 24),
(311, '2023-10-02', 4, 42, 6, 16.5),
(833, '2023-10-05', 4, 6, 10, 66.90),
(899, '2023-10-05', 3, 1, 18, 35.82),
(910, '2023-10-05', 1, 2, 23, 45.77),
(1477, '2023-10-08', 1, 1, 16, 31.84),
(1501, '2023-10-08', 2, 11, 5, 17.45), 
(1792, '2023-10-10', 1, 44, 10, 11.90),
(2003, '2023-10-12', 3, 28, 5, 6.75),
(2444, '2023-10-14', 2, 20, 4, 6.00),
(2491, '2023-10-14', 1, 1, 8, 15.92), 
(2622, '2023-10-15', 1, 2, 4, 7.96),
(2801, '2023-10-16', 1, 3, 4, 7.56), 
(3008, '2023-10-17', 2, 19, 1, 4.29),
(3085, '2023-10-17', 2, 31, 2, 5.10),
(3106, '2023-10-17', 2, 1, 9, 17.91);



-- A QUERY WITH A LEFT JOIN TO EXTRACT ALL THE SALESPERSONS' IDs, FIRST NAMES, AND LAST NAMES FROM THE SALESPERSONS TABLE ON THE LEFT, AND WHERE THESE SPECIFIED DATA MATCH SALES_ID, SALES_DATE, AND SALESAMOUNT COLUMNS IN THE SALES TABLE.  
-- Accordingly, this query returns a result set of all salespersons and sales transactions they have made.
SELECT 
	sp.salesperson_id,
    sp.first_name, 
    sp.last_name, 
    s.sales_id,
    s.sales_date, 
    s.sales_amount
FROM
	salespersons sp
LEFT JOIN
	sales s
ON 
	sp.salesperson_id = s.salesperson_id;


-- A VIEW THAT LOGICALLY COMBINES TWO TABLES: THE PRODUCTS AND SALES TABLE THAT ARE JOINED WITH AN INNER JOIN, IN A LOGICAL WAY
CREATE VIEW vw_salesinfo
AS
SELECT
	p.category_id, s.product_id, s.salesperson_id, s.sales_amount
FROM
	products p
JOIN
	sales s
ON 
	p.product_id = s.product_id;
-- QUERYING THE VIEW
SELECT * FROM vw_salesinfo;
SELECT 
	v.product_id,
	v.sales_amount
FROM
	vw_salesinfo AS v;

-- A STORED FUNCTION NAMED 'PRODUCT DISCOUNT' THAT CALCULATES AND RETURNS THE RESULT SET FOR THE VALUE OF A 10% 'PRODUCTDISCOUNT' FOR EACH PRODUCT IN THE PRODUCTS TABLE
DELIMITER //
CREATE FUNCTION express_grocery.product_discount (price NUMERIC(6,2))
RETURNS NUMERIC(6,2)
DETERMINISTIC
BEGIN
RETURN (price * 0.1);
END//
DELIMITER ;
-- CALLING THE STORED FUNCTION 'PRODUCT DISCOUNT' WHILE QUERYING THE PRODUCTS TABLE
SELECT 
	product_id,
	price,
	product_discount(price) as discount
FROM 
	products;


-- AN EXAMPLE QUERY WITH A SUBQUERY USED HERE TO DEMONSTRATES HOW TO EXTRACT THE ID AND AMOUNT OF THE PRODUCT WITH THE LEAST SALESAMOUNT FROM THE DATABASE
-- THE SUBQUERY CALCULATES AND RETURNS A RESULT SET FOR THE MINIMUM SALESAMOUNT IN THE SALES TABLE
-- AFTER WHICH THE OUTER QUERY SELECTS THE PRODUCT ID AND SALESAMOUNT FOR SALES WHERE THE SALESAMOUNT MATCHES THE MINIMUM SALESAMOUNT THE SUBQUERY IDENTIFIES  
SELECT
	s.product_id, 
    s.sales_amount
FROM
	sales AS s
WHERE 
	s.sales_amount = (SELECT MIN(s.sales_amount)
FROM
sales AS s);


-- ADVANCED OPTIONS
-- TRIGGERS FOR THE CATEGORIES TABLE AND AN EXAMPLE QUERY WITH GROUP BY AND HAVING
CREATE TRIGGER categories_before_insert
BEFORE INSERT ON categories
FOR EACH ROW
SET NEW.date_created = IFNULL(NEW.date_created, NOW());

CREATE TRIGGER categories_before_update
BEFORE UPDATE ON categories
FOR EACH ROW
SET NEW.date_modified = NOW();



-- SAMPLE UPDATES PROVING THAT UPDATES WORK IN THE CATEGORIES, PRODUCTS, SUPPLIERS, AND SALESPERSONS TABLES.

UPDATE 
	categories
SET 
	category_name = 'Variety of Drinks'
WHERE 
	category_id = 2;
-- Querying the database for confirmation of update
SELECT 
	c.category_name 
FROM 
	categories AS c
WHERE
	c.category_id = 2;

UPDATE 
	suppliers
SET 
	supplier_name = 'Zeus', 
    phone_number = '07400012222', 
    email = 'zeus@gmail.com', 
    borough = 'Deptford'
WHERE 
	supplier_id = 6;
-- Confirmation query
SELECT
	su.supplier_name,
    su.phone_number,
    su.email,
    su.borough
FROM
	suppliers AS su
WHERE 
	su.supplier_id = 6;
    

UPDATE 
	products
SET 
	product_name = 'Pear', 
	brand = 'Solo Farms', 
	weight = '0.6', 
    unit = 'KG', 
    price = 5.75
WHERE 
	product_id = 37;
-- Query confirmation
SELECT
	p.product_name,
    p.brand,
    p.weight,
    p.unit,
    p.price
FROM
	products AS p
WHERE
	p.product_id = 37;

UPDATE 
	salespersons
SET 
	number = '77', 
	street = 'Beck Ham St', 
	district = 'West Ham'
WHERE 
	salesperson_id = 3;
-- Query confirmation
SELECT
	sp.number,
    sp.street,
    sp.district
FROM
	salespersons AS sp
WHERE
	sp.salesperson_id = 3;
    


-- AN EXAMPLE QUERY WITH GROUP BY AND HAVING
-- A QUERY TO EXTRACT ID, SALESPERSONS AND NUMBER OF SALES FOR PRODUCTS WHOSE SALESPERSONS' IDs ARE GREATER THAN TWO
-- WHILE THE 'GROUP BY' GROUPS THE RESULT SET TO BE RETURNED, THE 'HAVING BY' FILTERS THE RESULT SET BY LIMITING IT TO THAT OF SALESPERSONS GREATER THAN TWO
SELECT 
	s.product_id, 
	s.salesperson_id, 
	COUNT(s.sales_amount) AS num_of_sales
FROM 
	sales AS s
GROUP BY 
	s.product_id, 
    s.salesperson_id
HAVING 
	s.salesperson_id > 2
ORDER BY s.product_id;
    
    
