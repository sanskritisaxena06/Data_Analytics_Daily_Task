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

create table Orders (
    order_id INT PRIMARY KEY,
    sales DECIMAL(10,2) NOT NULL DEFAULT 0 CHECK (sales >= 0),
    order_status VARCHAR(20) NOT NULL DEFAULT 'Pending'
        CHECK (order_status IN ('Pending', 'Completed', 'Cancelled'))
);
desc Orders;

create table Sales (
    sales_id INT PRIMARY KEY,
    product_id INT NOT NULL,
    order_id INT NOT NULL,
    quantity INT NOT NULL DEFAULT 1 CHECK (quantity > 0),

    FOREIGN KEY (product_id) REFERENCES Product(product_id),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id)
);
desc Sales;

create table Returns (
    return_id INT PRIMARY KEY,
    order_id INT NOT NULL UNIQUE,
    return_reason VARCHAR(200) DEFAULT 'Not specified',
    FOREIGN KEY (order_id) REFERENCES Orders(order_id)
);
desc Returns;