
CREATE DATABASE ecommerce_db;
USE ecommerce_db;


-- Tạo bảng products
CREATE TABLE products (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    price DECIMAL(10, 2) NOT NULL CHECK (price > 100),
    discount ENUM('5%', '10%', '15%', '20%') NOT NULL,
    stock INT NOT NULL CHECK (stock > 10)
);
-- Tạo bảng employees
CREATE TABLE employees (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    dob DATE,
    address VARCHAR(255)
);
-- Tạo bảng customers
CREATE TABLE customers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    dob DATE,
    phone VARCHAR(15),
    address VARCHAR(255),
    email VARCHAR(255)
);
-- Tạo bảng orders
CREATE TABLE orders (
    id INT AUTO_INCREMENT PRIMARY KEY,
    payment_method VARCHAR(50),
    customer_id INT NOT NULL,
    employee_id INT NOT NULL,
    order_date DATE NOT NULL,
    delivery_date DATE,
    delivery_address VARCHAR(255),
    FOREIGN KEY (customer_id) REFERENCES customers(id),
    FOREIGN KEY (employee_id) REFERENCES employees(id)
);
-- Tạo bảng order_details
CREATE TABLE order_details (
    id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(id),
    FOREIGN KEY (product_id) REFERENCES products(id)
);
INSERT INTO products (name, price, discount, stock)
VALUES
    ('Product A', 120, '10%', 50),
    ('Product B', 150, '5%', 30),
    ('Product C', 200, '15%', 100),
    ('Product D', 300, '20%', 200),
    ('Product E', 110, '10%', 70),
    ('Product F', 140, '5%', 40),
    ('Product G', 180, '15%', 90),
    ('Product H', 250, '20%', 60),
    ('Product I', 160, '10%', 80),
    ('Product J', 220, '15%', 120);
    INSERT INTO employees (name, dob, address)
VALUES
    ('Alice', '1990-05-15', '123 Main Street'),
    ('Bob', '1985-03-20', '456 Elm Street'),
    ('Charlie', '1992-07-10', '789 Oak Avenue'),
    ('David', '1988-09-25', '101 Pine Lane'),
    ('Emma', '1995-12-30', '234 Maple Road'),
    ('Frank', '1980-02-10', '345 Birch Street'),
    ('Grace', '1983-04-18', '567 Cedar Drive'),
    ('Henry', '1998-11-05', '678 Spruce Way'),
    ('Ivy', '1993-06-22', '890 Willow Court'),
    ('Jack', '1986-08-14', '901 Redwood Circle');
    INSERT INTO customers (name, dob, phone, address, email)
VALUES
    ('John Doe', '1990-01-15', '123456789', '123 Main St', 'john@example.com'),
    ('Jane Smith', '1985-02-20', '987654321', '456 Elm St', 'jane@example.com'),
    ('Robert Brown', '1992-03-25', '123123123', '789 Oak St', 'robert@example.com'),
    ('Emily Davis', '1988-04-30', '321321321', '101 Pine St', 'emily@example.com'),
    ('Michael Wilson', '1995-05-10', '456456456', '234 Maple St', 'michael@example.com'),
    ('Sarah Lee', '1980-06-15', '654654654', '345 Birch St', 'sarah@example.com'),
    ('William King', '1983-07-20', '789789789', '567 Cedar St', 'william@example.com'),
    ('Linda Scott', '1998-08-25', '987987987', '678 Spruce St', 'linda@example.com'),
    ('James White', '1993-09-30', '123789123', '890 Willow St', 'james@example.com'),
    ('Patricia Hall', '1986-10-05', '321987321', '901 Redwood St', 'patricia@example.com');
    INSERT INTO orders (payment_method, customer_id, employee_id, order_date, delivery_date, delivery_address)
VALUES
    ('Credit Card', 1, 2, '2025-01-01', '2025-01-05', '123 Main St'),
    ('Cash', 3, 4, '2025-01-02', '2025-01-06', '456 Elm St'),
    ('PayPal', 5, 6, '2025-01-03', '2025-01-07', '789 Oak St'),
    ('Credit Card', 7, 8, '2025-01-04', '2025-01-08', '101 Pine St'),
    ('Cash', 9, 10, '2025-01-05', '2025-01-09', '234 Maple St'),
    ('PayPal', 2, 3, '2025-01-06', '2025-01-10', '345 Birch St'),
    ('Credit Card', 4, 5, '2025-01-07', '2025-01-11', '567 Cedar St'),
    ('Cash', 6, 7, '2025-01-08', '2025-01-12', '678 Spruce St'),
    ('PayPal', 8, 9, '2025-01-09', '2025-01-13', '890 Willow St'),
    ('Credit Card', 10, 1, '2025-01-10', '2025-01-14', '901 Redwood St');
    INSERT INTO order_details (order_id, product_id, quantity)
VALUES
    (1, 1, 2),
    (1, 2, 1),
    (2, 3, 5),
    (2, 4, 3),
    (3, 5, 1),
    (3, 6, 2),
    (4, 7, 4),
    (4, 8, 2),
    (5, 9, 6),
    (5, 10, 3),
    (6, 1, 2),
    (6, 3, 4),
    (7, 5, 1),
    (7, 7, 2),
    (8, 9, 5),
    (8, 2, 3),
    (9, 4, 6),
    (9, 6, 3),
    (10, 8, 2),
    (10, 10, 4);











