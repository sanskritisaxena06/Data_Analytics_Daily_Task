create database ecommerce;
show databases;
use ecommerce;

create table Product (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL UNIQUE,
    price DECIMAL(10,2) NOT NULL CHECK (price > 0),
    stock INT NOT NULL DEFAULT 0 CHECK (stock >= 0)
);
desc Product;
INSERT INTO Product (product_id, product_name, price, stock)
VALUES
(1, 'Laptop', 55000.00, 20),
(2, 'Smartphone', 25000.00, 35),
(3, 'Headphones', 2500.00, 50),
(4, 'Keyboard', 1200.00, 40),
(5, 'Mouse', 700.00, 60),
(6, 'Smart Watch', 4500.00, 25),
(7, 'Tablet', 18000.00, 15),
(8, 'Bluetooth Speaker', 3000.00, 30);

create table Orders (
    order_id INT PRIMARY KEY,
    sales DECIMAL(10,2) NOT NULL DEFAULT 0 CHECK (sales >= 0),
    order_status VARCHAR(20) NOT NULL DEFAULT 'Pending'
        CHECK (order_status IN ('Pending', 'Completed', 'Cancelled'))
);
desc Orders;
INSERT INTO Orders (order_id, sales, order_status)
VALUES
(101, 55000.00, 'Completed'),
(102, 25000.00, 'Completed'),
(103, 5000.00, 'Pending'),
(104, 3600.00, 'Completed'),
(105, 4500.00, 'Cancelled'),
(106, 18000.00, 'Completed'),
(107, 6000.00, 'Completed'),
(108, 7500.00, 'Pending');

create table Sales (
    sales_id INT PRIMARY KEY,
    product_id INT NOT NULL,
    order_id INT NOT NULL,
    quantity INT NOT NULL DEFAULT 1 CHECK (quantity > 0),

    FOREIGN KEY (product_id) REFERENCES Product(product_id),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id)
);
desc Sales;
INSERT INTO Sales (sales_id, product_id, order_id, quantity)
VALUES
(1, 1, 101, 1),
(2, 2, 102, 1),
(3, 3, 103, 2),
(4, 4, 104, 3),
(5, 6, 105, 1),
(6, 7, 106, 1),
(7, 8, 107, 2),
(8, 3, 108, 3);

create table Returns (
    return_id INT PRIMARY KEY,
    order_id INT NOT NULL UNIQUE,
    return_reason VARCHAR(200) DEFAULT 'Not specified',
    FOREIGN KEY (order_id) REFERENCES Orders(order_id)
);
desc Returns;
INSERT INTO Returns (return_id, order_id, return_reason)
VALUES
(1, 105, 'Product damaged'),
(2, 102, 'Customer changed mind'),
(3, 107, 'Wrong product received');