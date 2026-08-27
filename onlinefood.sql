create database online_food_delivery;
use online_food_delivery;
-- Customers Table
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(15) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    gender ENUM('Male','Female','Other'),
    date_of_birth DATE,
    city VARCHAR(50),
    state VARCHAR(50),
    pincode VARCHAR(10),
    address TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status ENUM('Active','Blocked','Inactive') DEFAULT 'Active'
);
desc Customers;
--  Restaurants Table
CREATE TABLE Restaurants (
    restaurant_id INT PRIMARY KEY AUTO_INCREMENT,
    restaurant_name VARCHAR(100) NOT NULL,
    owner_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(15) UNIQUE NOT NULL,
    city VARCHAR(50),
    address TEXT,
    opening_time TIME,
    closing_time TIME,
    rating DECIMAL(2,1) DEFAULT 0.0,
    gst_number VARCHAR(20) UNIQUE,
    status ENUM('Open','Closed','Temporarily Closed') DEFAULT 'Open'
);
desc restaurants;
--  Categories Table
CREATE TABLE Categories (
    category_id INT PRIMARY KEY AUTO_INCREMENT,
    category_name VARCHAR(50) NOT NULL UNIQUE,
    description TEXT
);
desc categories;
--  Menu Table
CREATE TABLE Menu (
    menu_id INT PRIMARY KEY AUTO_INCREMENT,
    restaurant_id INT NOT NULL,
    category_id INT NOT NULL,
    item_name VARCHAR(100) NOT NULL,
    description TEXT,
    price DECIMAL(10,2) NOT NULL,
    is_veg BOOLEAN DEFAULT TRUE,
    preparation_time INT,
    availability BOOLEAN DEFAULT TRUE,
    FOREIGN KEY (restaurant_id) REFERENCES Restaurants(restaurant_id),
    FOREIGN KEY (category_id) REFERENCES Categories(category_id)
);
desc Menu;
--  Delivery Partners Table
CREATE TABLE Delivery_Partners (
    partner_id INT PRIMARY KEY AUTO_INCREMENT,
    partner_name VARCHAR(100) NOT NULL,
    phone VARCHAR(15) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE,
    vehicle_number VARCHAR(20) UNIQUE,
    vehicle_type VARCHAR(30),
    license_number VARCHAR(30) UNIQUE,
    joining_date DATE,
    city VARCHAR(50),
    status ENUM('Available','Busy','Offline','On Leave') DEFAULT 'Available'
);
desc Delivery_Partners;
--  Orders Table
CREATE TABLE Orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT NOT NULL,
    restaurant_id INT NOT NULL,
    delivery_partner_id INT,
    order_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    total_amount DECIMAL(10,2) NOT NULL,
    delivery_charge DECIMAL(10,2) DEFAULT 0,
    discount DECIMAL(10,2) DEFAULT 0,
    tax DECIMAL(10,2) DEFAULT 0,
    final_amount DECIMAL(10,2) NOT NULL,
    order_status ENUM('Pending','Preparing','Out for Delivery','Delivered','Cancelled') DEFAULT 'Pending',
    payment_status ENUM('Pending','Paid','Failed') DEFAULT 'Pending',
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (restaurant_id) REFERENCES Restaurants(restaurant_id),
    FOREIGN KEY (delivery_partner_id) REFERENCES Delivery_Partners(partner_id)
);
desc orders;
--  Order Items Table
CREATE TABLE Order_Items (
    order_item_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT NOT NULL,
    menu_id INT NOT NULL,
    quantity INT NOT NULL,
    item_price DECIMAL(10,2) NOT NULL,
    total_price DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (menu_id) REFERENCES Menu(menu_id)
);
desc Order_Items;
--  Payments Table
CREATE TABLE Payments (
    payment_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT NOT NULL,
    payment_method ENUM('Cash','UPI','Debit Card','Credit Card','Wallet') NOT NULL,
    payment_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    transaction_id VARCHAR(100) UNIQUE,
    amount DECIMAL(10,2) NOT NULL,
    payment_status ENUM('Success','Failed','Pending','Refunded') DEFAULT 'Pending',
    FOREIGN KEY (order_id) REFERENCES Orders(order_id)
);
desc Payments;
--  Ratings Table
CREATE TABLE Ratings (
    rating_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT NOT NULL,
    restaurant_id INT NOT NULL,
    order_id INT NOT NULL,
    rating INT CHECK (rating BETWEEN 1 AND 5),
    review TEXT,
    review_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (restaurant_id) REFERENCES Restaurants(restaurant_id),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id)
);
desc ratings;





