
-- Create Database
CREATE DATABASE IF NOT EXISTS OnlineShopping;
USE OnlineShopping;

-- Product Table
CREATE TABLE Product (
    Product_ID INT PRIMARY KEY AUTO_INCREMENT,
    Product_Name VARCHAR(100),
    Price DECIMAL(10, 2),
    Stock_Quantity INT
);

-- Customer Table
CREATE TABLE Customer (
    Customer_ID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100),
    Email VARCHAR(100),
    Contact VARCHAR(15)
);

-- Orders Table
CREATE TABLE Orders (
    Order_ID INT PRIMARY KEY AUTO_INCREMENT,
    Customer_ID INT,
    Order_Date DATE,
    Total_Amount DECIMAL(10, 2),
    FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID)
);

-- OrderDetails Table
CREATE TABLE OrderDetails (
    OrderDetail_ID INT PRIMARY KEY AUTO_INCREMENT,
    Order_ID INT,
    Product_ID INT,
    Quantity INT,
    Subtotal DECIMAL(10, 2),
    FOREIGN KEY (Order_ID) REFERENCES Orders(Order_ID),
    FOREIGN KEY (Product_ID) REFERENCES Product(Product_ID)
);

-- Sample Data for Product Table
INSERT INTO Product (Product_Name, Price, Stock_Quantity) VALUES
('Laptop', 50000, 10),
('Smartphone', 25000, 5),
('Headphones', 2000, 15);

-- Sample Data for Customer Table
INSERT INTO Customer (Name, Email, Contact) VALUES
('John Doe', 'john@example.com', '9876543210'),
('Jane Smith', 'jane@example.com', '9123456789');

-- Sample Order
INSERT INTO Orders (Customer_ID, Order_Date, Total_Amount) VALUES (1, '2025-03-15', 52000);
INSERT INTO OrderDetails (Order_ID, Product_ID, Quantity, Subtotal) VALUES
(1, 1, 1, 50000),
(1, 3, 1, 2000);

-- Update Stock after order
UPDATE Product SET Stock_Quantity = Stock_Quantity - 1 WHERE Product_ID = 1;
UPDATE Product SET Stock_Quantity = Stock_Quantity - 1 WHERE Product_ID = 3;
