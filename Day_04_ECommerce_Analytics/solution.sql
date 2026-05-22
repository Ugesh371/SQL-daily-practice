
USE ECommerceDB;

-- ORDER BY & LIMIT
SELECT product_id, product_name, price FROM Product ORDER BY price DESC LIMIT 3;

-- Aggregate Functions
SELECT 
    COUNT(*) AS Total_Sales_Records,
    SUM(sale_amount) AS Total_Sales_Amount,
    AVG(sale_amount) AS Average_Sale_Amount,
    MAX(sale_amount) AS Highest_Sale_Amount,
    MIN(sale_amount) AS Lowest_Sale_Amount
FROM Sales;

-- GROUP BY & HAVING
SELECT s.product_id, p.product_name, SUM(s.sale_amount) AS Total_Sales
FROM Sales s
JOIN Product p ON s.product_id = p.product_id
GROUP BY s.product_id, p.product_name
HAVING SUM(s.sale_amount) > 100;

-- Window Functions
SELECT product_id, product_name, price,
    RANK() OVER (ORDER BY price DESC) AS Price_Rank
FROM Product;
