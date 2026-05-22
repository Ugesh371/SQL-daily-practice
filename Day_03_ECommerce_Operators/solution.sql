
CREATE DATABASE IF NOT EXISTS ECommerceDB;
USE ECommerceDB;

CREATE TABLE Product (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    price DECIMAL(10,2) CHECK (price > 0)
);

CREATE TABLE Sales (
    sale_id INT PRIMARY KEY,
    product_id INT,
    quantity INT CHECK (quantity > 0),
    sale_amount DECIMAL(10,2) CHECK (sale_amount > 0),
    FOREIGN KEY (product_id) REFERENCES Product(product_id)
);

INSERT INTO Product (product_id, product_name, price) VALUES
(1, 'Laptop', 85000.00),
(2, 'Smartphone', 45000.00),
(3, 'Headphones', 5000.00),
(4, 'Keyboard', 1200.00),
(5, 'Mouse', 800.00),
(6, 'Monitor', 15000.00),
(7, 'Webcam', 3500.00);

INSERT INTO Sales (sale_id, product_id, quantity, sale_amount) VALUES
(1, 1, 2, 170000.00),
(2, 2, 3, 135000.00),
(3, 3, 5, 25000.00),
(4, 4, 10, 12000.00),
(5, 5, 15, 12000.00),
(6, 6, 2, 30000.00),
(7, 7, 4, 14000.00);

-- DISTINCT & AS
SELECT DISTINCT product_name FROM Product;
SELECT product_name AS Product_Name FROM Product;
SELECT DISTINCT product_id FROM Sales;
SELECT price AS Product_Price FROM Product;

-- WHERE Clause
SELECT * FROM Product WHERE price > 10000;
SELECT * FROM Product WHERE price < 5000;
SELECT * FROM Sales WHERE quantity = 2;

-- Comparison Operators
SELECT * FROM Product WHERE price >= 15000;
SELECT * FROM Sales WHERE quantity <> 5;

-- Arithmetic Operators
SELECT product_name, price, price * 1.10 AS Increased_Price FROM Product;
SELECT sale_id, sale_amount, sale_amount + 500 AS Updated_Amount FROM Sales;

-- Logical Operators
SELECT * FROM Product WHERE price > 5000 AND price < 50000;
SELECT * FROM Sales WHERE quantity = 2 OR quantity = 4;
SELECT * FROM Product WHERE NOT price > 20000;

-- IS NULL / IS NOT NULL
SELECT * FROM Sales WHERE product_id IS NULL;
SELECT * FROM Product WHERE price IS NOT NULL;

-- IN and NOT IN
SELECT * FROM Product WHERE product_id IN (1, 3, 5);
SELECT * FROM Product WHERE product_id NOT IN (2, 4, 6);

-- BETWEEN and NOT BETWEEN
SELECT * FROM Product WHERE price BETWEEN 1000 AND 20000;
SELECT * FROM Product WHERE price NOT BETWEEN 5000 AND 50000;

-- LIKE Patterns
SELECT * FROM Product WHERE product_name LIKE 'M%';
SELECT * FROM Product WHERE product_name LIKE '%e';
SELECT * FROM Product WHERE product_name LIKE '%phone%';
SELECT * FROM Product WHERE product_name NOT LIKE 'S%';

-- Mixed Questions
SELECT * FROM Product WHERE price BETWEEN 1000 AND 20000 AND product_name LIKE 'M%';
SELECT * FROM Sales WHERE quantity BETWEEN 2 AND 10;
SELECT * FROM Product WHERE product_id IN (1, 2, 3) AND price > 5000;
SELECT DISTINCT quantity FROM Sales;
