USE express_grocery;


-- MODIFICATION OF CATEGORIES, PRODUCTS, SUPPLIERS AND SALES TABLES FOR THE DAY'S PRESENTATION.
-- Insertion of three new categories into the categories table.
INSERT INTO categories
(category_name)
VALUES
("Cereals"),
("Vegetables"),
("Pet");

-- Insertion of six new products into the products table.
INSERT INTO products
(product_name, brand, weight, unit, price)
VALUES
('Cheese', 'British', 0.3, 'KG', 1.59),
('Wholemeal bread', 'Novita', 0.5, 'KG', 1.99),
('Peanut butter', 'Sun Pat', 0.85, 'KG', 3.45),
('Sweet and Crunchy', 'ASDA', 0.3, 'KG', 0.65),
('Raw Almond', 'Roy', 0.06, 'KG', 0.99),
('Quaker Oats', 'Quaker UK', 0.4, 'KG', 2.69);

-- Insertion into three new suppliers into the suppliers table
INSERT INTO suppliers
(supplier_name, phone_number, email, borough)
VALUES
('Ann', '07544444333', 'ann@gmail.com', 'Deptford'),
('Linda', '07788899951', 'Linda@yahoo.com', 'Barking'),
('Mark', '07211666333', 'scott@fishrepublic.org', 'Deptford');

-- Updating the salespersons' records in the sales tables to exclude salesperson with id '4'. 
UPDATE sales
SET salesperson_id = 3
WHERE salesperson_id = 4;
