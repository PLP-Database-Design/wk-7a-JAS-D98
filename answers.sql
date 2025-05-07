-- QUESTION 1: Achieving 1NF
-- Transforming ProductDetail table into 1NF-compliant structure

-- Dropping and recreating a normalized version of the table
DROP TABLE IF EXISTS ProductDetail_1NF;

CREATE TABLE ProductDetail_1NF (OrderID INT, CustomerName VARCHAR(100), Product VARCHAR(100));

-- Inserting atomic rows (1NF compliant)
INSERT INTO ProductDetail_1NF (OrderID, CustomerName, Product) VALUES (101, 'John Doe', 'Laptop');
INSERT INTO ProductDetail_1NF (OrderID, CustomerName, Product) VALUES (101, 'John Doe', 'Mouse');
INSERT INTO ProductDetail_1NF (OrderID, CustomerName, Product) VALUES (102, 'Jane Smith', 'Tablet');
INSERT INTO ProductDetail_1NF (OrderID, CustomerName, Product) VALUES (102, 'Jane Smith', 'Keyboard');
INSERT INTO ProductDetail_1NF (OrderID, CustomerName, Product) VALUES (102, 'Jane Smith', 'Mouse');
INSERT INTO ProductDetail_1NF (OrderID, CustomerName, Product) VALUES (103, 'Emily Clark', 'Phone');


-- QUESTION 2: Achieving 2NF
-- Removing partial dependency from OrderDetails table


-- Creating a new table for customer info (Orders table)
DROP TABLE IF EXISTS Orders;

CREATE TABLE Orders (OrderID INT PRIMARY KEY, CustomerName VARCHAR(100));

-- Insert distinct customer records
INSERT INTO Orders (OrderID, CustomerName) VALUES (101, 'John Doe');
INSERT INTO Orders (OrderID, CustomerName) VALUES (102, 'Jane Smith');
INSERT INTO Orders (OrderID, CustomerName) VALUES (103, 'Emily Clark');

-- Creating a new table for order items (OrderItems table)
DROP TABLE IF EXISTS OrderItems;

CREATE TABLE OrderItems (OrderID INT,Product VARCHAR(100),Quantity INT,FOREIGN KEY (OrderID) REFERENCES Orders(OrderID));

-- Insert product records for each order
INSERT INTO OrderItems (OrderID, Product, Quantity) VALUES (101, 'Laptop', 2);
INSERT INTO OrderItems (OrderID, Product, Quantity) VALUES (101, 'Mouse', 1);
INSERT INTO OrderItems (OrderID, Product, Quantity) VALUES (102, 'Tablet', 3);
INSERT INTO OrderItems (OrderID, Product, Quantity) VALUES (102, 'Keyboard', 1);
INSERT INTO OrderItems (OrderID, Product, Quantity) VALUES (102, 'Mouse', 2);
INSERT INTO OrderItems (OrderID, Product, Quantity) VALUES (103, 'Phone', 1);