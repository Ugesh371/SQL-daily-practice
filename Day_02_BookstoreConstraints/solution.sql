
CREATE DATABASE IF NOT EXISTS BookstoreDB;
USE BookstoreDB;

CREATE TABLE Books (
    BookID INT PRIMARY KEY,
    Title VARCHAR(100) NOT NULL,
    Author VARCHAR(50) NOT NULL,
    ISBN VARCHAR(20) UNIQUE,
    Price DECIMAL(8,2) CHECK (Price > 0)
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    BookID INT,
    OrderDate DATE NOT NULL,
    Quantity INT CHECK (Quantity > 0),
    FOREIGN KEY (BookID) REFERENCES Books(BookID)
);

ALTER TABLE Books ADD CONSTRAINT unique_isbn_alt UNIQUE (ISBN);

-- Insert Mock Data
INSERT INTO Books (BookID, Title, Author, ISBN, Price) VALUES 
(1, 'The Alchemist', 'Paulo Coelho', '9780061122415', 350.00),
(2, 'Atomic Habits', 'James Clear', '9780735211292', 499.00),
(3, 'Rich Dad Poor Dad', 'Robert Kiyosaki', '9781612680194', 299.00),
(4, 'Ikigai', 'Héctor García', '9780143130727', 450.00),
(5, 'Sapiens', 'Yuval Noah Harari', '9780099590088', 699.00);

SELECT * FROM Books;

UPDATE Books SET Price = 399.00 WHERE BookID = 3;
DELETE FROM Orders WHERE OrderID = 2;
TRUNCATE TABLE Orders;
