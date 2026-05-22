
USE SQL_COMPANY_DB;

-- Employee Department Coverage
SELECT e.emp_id, e.emp_name, d.dept_name, e.salary, e.city
FROM Employees e
LEFT JOIN Departments d ON e.dept_id = d.dept_id;

-- Missing Data Audit
SELECT emp_id, emp_name, dept_id, city FROM Employees WHERE salary IS NULL;
SELECT emp_id, emp_name, salary FROM Employees WHERE salary > 60000;

-- Customer Deduplication Audit
SELECT customer_name, COUNT(*) AS Count FROM Customers GROUP BY customer_name HAVING COUNT(*) > 1;
SELECT DISTINCT city FROM Customers;

-- Transaction Logging Details
SELECT o.order_id, c.customer_name, p.product_name, o.quantity, o.order_date
FROM Orders o
JOIN Customers c ON o.customer_id = c.customer_id
JOIN Products p ON o.product_id = p.product_id;

-- Inventory Pricing Rankings
SELECT product_id, product_name, price FROM Products ORDER BY price DESC LIMIT 3;

-- Financial Aggregations
SELECT SUM(amount) AS TotalSales FROM Sales;

SELECT p.product_name, AVG(s.amount) AS AvgSales
FROM Sales s
JOIN Products p ON s.product_id = p.product_id
GROUP BY p.product_name;

-- Sales Pipeline Rankings
SELECT emp_name, region, sales,
       RANK() OVER (ORDER BY sales DESC) AS SalesRank
FROM SalesTeam;

SELECT region, AVG(sales) AS AvgRegionSales FROM SalesTeam GROUP BY region;
