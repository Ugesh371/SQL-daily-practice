
CREATE DATABASE IF NOT EXISTS SQL_COMPANY_DB;
USE SQL_COMPANY_DB;

CREATE TABLE Departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50),
    location VARCHAR(50) 
);

INSERT INTO Departments VALUES
(1,'HR','Chennai'),
(2,'IT','Bangalore'),
(3,'Finance','Pune'),
(4,'Sales','Mumbai'),
(5,'Marketing','Chennai');

CREATE TABLE Employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    dept_id INT,
    salary DECIMAL(10,2),
    city VARCHAR(50),
    join_date DATE,            
    performance_rating INT     
);

INSERT INTO Employees VALUES
(101,'Arun',2,55000,'Chennai','2024-01-15',4),
(102,'Bala',2,60000,'Madurai','2023-11-10',5),
(103,'Anitha',1,45000,'Trichy','2024-03-20',3),
(104,'David',3,NULL,'Coimbatore','2024-05-01',2),
(105,'Asha',4,70000,'Madurai','2023-06-15',4),
(106,'John',NULL,50000,'Salem','2024-02-18',3),
(107,'Kavin',4,80000,'Chennai','2023-01-10',5),
(108,'Meena',5,65000,'Madurai','2023-08-22',4),
(109,'Priya',2,60000,'Trichy','2024-04-05',4),
(110,'Ravi',4,80000,'Madurai','2023-09-12',5);

-- Nested Subqueries
SELECT * FROM Employees WHERE salary > (SELECT AVG(salary) FROM Employees);
SELECT * FROM Employees WHERE salary > (SELECT salary FROM Employees WHERE emp_name = 'Ravi');
SELECT * FROM Employees WHERE join_date > (SELECT join_date FROM Employees WHERE emp_name = 'Meena');
SELECT * FROM Employees WHERE salary > (SELECT AVG(salary) FROM Employees WHERE dept_id = 2);
SELECT * FROM Employees WHERE performance_rating > (SELECT AVG(performance_rating) FROM Employees);

-- Multi-Row Subqueries
SELECT * FROM Employees WHERE dept_id IN (SELECT dept_id FROM Departments WHERE location IN ('Chennai','Bangalore'));
SELECT * FROM Employees WHERE dept_id IN (SELECT dept_id FROM Departments WHERE location = 'Pune');
SELECT * FROM Employees WHERE salary > ANY (SELECT salary FROM Employees WHERE dept_id = 5); 
SELECT * FROM Employees WHERE salary > ALL (SELECT salary FROM Employees WHERE dept_id = 1); 
SELECT * FROM Employees WHERE dept_id IN (SELECT dept_id FROM Employees WHERE performance_rating = 5);

-- Correlated Subqueries
SELECT * FROM Employees e WHERE salary > (SELECT AVG(salary) FROM Employees WHERE dept_id = e.dept_id);
SELECT * FROM Employees e WHERE salary = (SELECT MAX(salary) FROM Employees WHERE dept_id = e.dept_id);
SELECT * FROM Employees e WHERE performance_rating > (SELECT AVG(performance_rating) FROM Employees WHERE dept_id = e.dept_id);
SELECT * FROM Employees e WHERE salary < (SELECT MAX(salary) FROM Employees WHERE dept_id = e.dept_id);
SELECT * FROM Employees e WHERE salary = (SELECT MIN(salary) FROM Employees WHERE dept_id = e.dept_id);
SELECT DISTINCT dept_id FROM Employees e WHERE EXISTS (SELECT 1 FROM Employees WHERE dept_id = e.dept_id AND salary > 70000);
SELECT * FROM Employees e WHERE salary > ANY (SELECT salary FROM Employees WHERE dept_id = e.dept_id AND emp_id <> e.emp_id);
SELECT * FROM Employees e WHERE NOT EXISTS (SELECT 1 FROM Employees WHERE dept_id = e.dept_id AND emp_id <> e.emp_id);
