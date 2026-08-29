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

INSERT INTO Customers VALUES
(1,'Harshini','Saga','harshini1@gmail.com','9876543210','pass123','Female','2004-05-10','Hyderabad','Telangana','500001','Madhapur','2026-08-01','Active'),
(2,'Ravi','Kumar','ravi@gmail.com','9876543211','pass123','Male','2003-02-15','Warangal','Telangana','506001','Hanamkonda','2026-08-02','Active'),
(3,'Priya','Reddy','priya@gmail.com','9876543212','pass123','Female','2002-07-20','Karimnagar','Telangana','505001','Main Road','2026-08-03','Active'),
(4,'Arjun','Sharma','arjun@gmail.com','9876543213','pass123','Male','2001-09-25','Nizamabad','Telangana','503001','Bus Stand Road','2026-08-04','Active'),
(5,'Sneha','Patel','sneha@gmail.com','9876543214','pass123','Female','2004-11-30','Khammam','Telangana','507001','Station Road','2026-08-05','Active'),
(6,'Kiran','Rao','kiran@gmail.com','9876543215','pass123','Male','2003-01-12','Hyderabad','Telangana','500002','Ameerpet','2026-08-06','Active'),
(7,'Divya','Reddy','divya@gmail.com','9876543216','pass123','Female','2002-06-18','Warangal','Telangana','506002','Kazipet','2026-08-07','Active'),
(8,'Vamsi','Krishna','vamsi@gmail.com','9876543217','pass123','Male','2001-08-28','Karimnagar','Telangana','505002','Tower Circle','2026-08-08','Active'),
(9,'Anjali','Singh','anjali@gmail.com','9876543218','pass123','Female','2004-03-05','Nalgonda','Telangana','508001','RTC Colony','2026-08-09','Active'),
(10,'Rakesh','Yadav','rakesh@gmail.com','9876543219','pass123','Male','2003-10-22','Adilabad','Telangana','504001','Market Road','2026-08-10','Active');

-- Restaurants (10 Records)

INSERT INTO Restaurants VALUES
(1,'Paradise','Ahmed Khan','paradise@gmail.com','9000000001','Hyderabad','Secunderabad','10:00:00','23:00:00',4.5,'GST001','Open'),
(2,'Mehfil','Raju Kumar','mehfil@gmail.com','9000000002','Hyderabad','Kukatpally','09:00:00','22:00:00',4.3,'GST002','Open'),
(3,'KFC','John Peter','kfc@gmail.com','9000000003','Warangal','Hanamkonda','10:00:00','23:00:00',4.2,'GST003','Open'),
(4,'Dominos','David Raj','dominos@gmail.com','9000000004','Karimnagar','Main Road','09:00:00','22:00:00',4.4,'GST004','Open'),
(5,'Pizza Hut','Mike Joseph','pizzahut@gmail.com','9000000005','Nizamabad','Station Road','10:00:00','23:00:00',4.1,'GST005','Open'),
(6,'Bawarchi','Suresh Reddy','bawarchi@gmail.com','9000000006','Hyderabad','RTC X Roads','09:00:00','23:30:00',4.6,'GST006','Open'),
(7,'Burger King','Arun Kumar','burgerking@gmail.com','9000000007','Khammam','Wyra Road','10:00:00','22:30:00',4.2,'GST007','Open'),
(8,'Subway','Naveen Rao','subway@gmail.com','9000000008','Nalgonda','Clock Tower','09:00:00','22:00:00',4.0,'GST008','Open'),
(9,'Cream Stone','Karthik','creamstone@gmail.com','9000000009','Adilabad','Market Road','11:00:00','23:00:00',4.7,'GST009','Open'),
(10,'Pista House','Imran Ali','pistahouse@gmail.com','9000000010','Hyderabad','Tolichowki','08:00:00','23:59:00',4.5,'GST010','Open');

-- Categories (10 Records)

INSERT INTO Categories VALUES
(1,'Pizza','Various Pizza Items'),
(2,'Biryani','Biryani Varieties'),
(3,'Burgers','Burger Items'),
(4,'Desserts','Sweet Items'),
(5,'Drinks','Beverages'),
(6,'South Indian','Dosa, Idli, Vada and more'),
(7,'North Indian','Paneer, Roti, Curry and more'),
(8,'Chinese','Noodles, Fried Rice and Manchuria'),
(9,'Fast Food','Quick Snacks and Meals'),
(10,'Ice Creams','Different Flavors of Ice Cream');

-- Delivery_Partners (10 Records)

INSERT INTO Delivery_Partners VALUES
(1,'Rahul Sharma','8888888801','rahul@gmail.com','TS01AB1234','Bike','DL001','2025-01-01','Hyderabad','Available'),
(2,'Kiran Kumar','8888888802','kiran@gmail.com','TS02AB2345','Scooter','DL002','2025-01-05','Warangal','Busy'),
(3,'Vamsi Krishna','8888888803','vamsi@gmail.com','TS03AB3456','Bike','DL003','2025-01-10','Karimnagar','Available'),
(4,'Ajay Reddy','8888888804','ajay@gmail.com','TS04AB4567','Bicycle','DL004','2025-01-15','Nizamabad','Offline'),
(5,'Rakesh Yadav','8888888805','rakesh@gmail.com','TS05AB5678','Bike','DL005','2025-01-20','Khammam','Available'),
(6,'Sandeep Kumar','8888888806','sandeep@gmail.com','TS06AB6789','Scooter','DL006','2025-01-25','Hyderabad','Busy'),
(7,'Naveen Rao','8888888807','naveen@gmail.com','TS07AB7890','Bike','DL007','2025-02-01','Nalgonda','Available'),
(8,'Praveen Singh','8888888808','praveen@gmail.com','TS08AB8901','Scooter','DL008','2025-02-05','Adilabad','On Leave'),
(9,'Manoj Patel','8888888809','manoj@gmail.com','TS09AB9012','Bike','DL009','2025-02-10','Siddipet','Available'),
(10,'Arun Kumar','8888888810','arun@gmail.com','TS10AB0123','Bicycle','DL010','2025-02-15','Mahabubnagar','Offline');

-- Menu (10 Records)

INSERT INTO Menu VALUES
(1,1,2,'Chicken Biryani','Hyderabadi Chicken Biryani',250.00,0,30,1),
(2,1,5,'Coke','Chilled Coca Cola',40.00,1,2,1),
(3,4,1,'Veg Pizza','Cheesy Veg Pizza',199.00,1,20,1),
(4,3,3,'Chicken Burger','Crispy Chicken Burger',149.00,0,15,1),
(5,5,4,'Vanilla Ice Cream','Creamy Vanilla Ice Cream',80.00,1,5,1),
(6,6,2,'Mutton Biryani','Spicy Mutton Biryani',320.00,0,35,1),
(7,7,3,'Veg Burger','Fresh Veg Burger',120.00,1,10,1),
(8,8,8,'Veg Noodles','Hakka Veg Noodles',180.00,1,15,1),
(9,10,6,'Masala Dosa','South Indian Special Dosa',90.00,1,12,1),
(10,9,10,'Chocolate Ice Cream','Rich Chocolate Flavor',100.00,1,5,1);

-- Orders (10 Records)

INSERT INTO Orders VALUES
(1,1,1,1,'2026-08-20 12:00:00',250.00,30.00,0.00,15.00,295.00,'Delivered','Paid'),
(2,2,2,2,'2026-08-20 13:00:00',300.00,30.00,20.00,18.00,328.00,'Delivered','Paid'),
(3,3,3,3,'2026-08-21 14:00:00',150.00,20.00,0.00,9.00,179.00,'Preparing','Pending'),
(4,4,4,4,'2026-08-21 15:00:00',200.00,25.00,10.00,12.00,227.00,'Out for Delivery','Paid'),
(5,5,5,5,'2026-08-22 16:00:00',180.00,20.00,0.00,11.00,211.00,'Pending','Pending'),
(6,6,6,6,'2026-08-22 17:00:00',320.00,30.00,20.00,19.00,349.00,'Delivered','Paid'),
(7,7,7,7,'2026-08-23 11:30:00',120.00,20.00,0.00,7.00,147.00,'Delivered','Paid'),
(8,8,8,8,'2026-08-23 18:00:00',180.00,25.00,10.00,11.00,206.00,'Preparing','Pending'),
(9,9,9,9,'2026-08-24 19:00:00',100.00,20.00,0.00,6.00,126.00,'Out for Delivery','Paid'),
(10,10,10,10,'2026-08-24 20:00:00',90.00,15.00,0.00,5.00,110.00,'Pending','Pending');

-- Order_Items (10 Records)

INSERT INTO Order_Items VALUES
(1,1,1,2,250.00,500.00),
(2,1,2,1,40.00,40.00),
(3,2,3,1,199.00,199.00),
(4,3,4,2,149.00,298.00),
(5,4,5,3,80.00,240.00),
(6,5,6,1,320.00,320.00),
(7,6,7,2,120.00,240.00),
(8,7,8,1,180.00,180.00),
(9,8,9,2,90.00,180.00),
(10,9,10,1,100.00,100.00);

-- Payments (10 Records)

INSERT INTO Payments VALUES
(1,1,'UPI','2026-08-20 12:05:00','TXN001',295.00,'Success'),
(2,2,'Credit Card','2026-08-20 13:05:00','TXN002',328.00,'Success'),
(3,3,'Cash','2026-08-21 14:05:00','TXN003',179.00,'Pending'),
(4,4,'Debit Card','2026-08-21 15:05:00','TXN004',227.00,'Success'),
(5,5,'Wallet','2026-08-22 16:05:00','TXN005',211.00,'Pending'),
(6,6,'UPI','2026-08-22 17:05:00','TXN006',349.00,'Success'),
(7,7,'Cash','2026-08-23 11:35:00','TXN007',147.00,'Success'),
(8,8,'Credit Card','2026-08-23 18:05:00','TXN008',206.00,'Pending'),
(9,9,'Debit Card','2026-08-24 19:05:00','TXN009',126.00,'Success'),
(10,10,'Wallet','2026-08-24 20:05:00','TXN010',110.00,'Pending');

-- Ratings (10 Records)

INSERT INTO Ratings VALUES
(1,1,1,1,5,'Excellent food and fast delivery','2026-08-20 18:00:00'),
(2,2,2,2,4,'Good taste and quality','2026-08-20 19:00:00'),
(3,3,3,3,3,'Average service','2026-08-21 20:00:00'),
(4,4,4,4,5,'Loved the pizza','2026-08-21 21:00:00'),
(5,5,5,5,4,'Nice experience','2026-08-22 22:00:00'),
(6,6,6,6,5,'Best biryani in town','2026-08-22 22:30:00'),
(7,7,7,7,4,'Burger was tasty','2026-08-23 12:00:00'),
(8,8,8,8,3,'Food was okay','2026-08-23 19:00:00'),
(9,9,9,9,5,'Excellent service and delivery','2026-08-24 20:00:00'),
(10,10,10,10,4,'Good food and packaging','2026-08-24 21:00:00');

-- WHERE — 12 Questions
-- 1. Find all customers whose account status is Active.
Select * from Customers
where status="Active";
-- 2. Find all restaurants whose status is Open.
Select * from Restaurants
where status="open";
-- 3. Find all restaurants located in a particular city.
Select * from Restaurants
where address="Secunderabad";
-- 4. Find all menu items whose price is greater than ₹300.
Select * from Menu
where price>300;
-- 5. Find all available vegetarian menu items.
Select * from Menu
where is_veg=1 and availability=1;
-- 6. Find all menu items whose preparation time is less than 20 minutes.
select * from Menu
where preparation_time<20;
-- 7. Find all delivery partners who are currently Available.
select * from Delivery_Partners
where status="available";
-- 8. Find all orders whose status is Delivered.
select * from orders
where order_status="delivered";
-- 9. Find all orders where the final amount is greater than ₹1,000.
select * from orders
where final_amount>1000;
-- 10.Find all successful payments made using UPI or Credit Card.
select * from Payments
where payment_status="success" and payment_method in ("UPI","Credit Card");
-- 11. Find all ratings where the rating is 1 or 2 stars.
select * from ratings
where rating in (1,2);
-- 12.Find all customers whose first name starts with A, ignoring case.
select * from customers
where first_name like 'a%';

-- 2. DISTINCT — 5 Questions
-- 13.Display all unique customer cities.
select distinct city 
from customers;
-- 14.Display all unique restaurant cities.
select distinct city 
from restaurants;
-- 15.Display all unique food categories.
select distinct category_name 
from categories;
-- 16.Display all unique vehicle types used by delivery partners.
select distinct vehicle_type
 from Delivery_partners;
-- 17.Display all unique payment methods.
select distinct payment_method from payments;


-- 3. ORDER BY — 10 Questions
-- 18.Display restaurants from highest to lowest rating.
select * from restaurants
order by rating desc;
-- 19.Display menu items from cheapest to most expensive.
select * from menu
order by price asc;
-- 20.Display customers from newest to oldest registration date.
select * from Customers
order by created_at desc;
-- 21.Display delivery partners from newest to oldest joining date.
select * from delivery_partners
order by joining_date desc;
-- 22.Display orders from highest to lowest final amount.
select * from orders
order by final_amount desc;
-- 23.Display payments from newest to oldest payment date.
select * from payments
order by payment_date desc;
-- 24.Display restaurants alphabetically by city and then restaurant name.
select * from restaurants
order by city asc,restaurant_name asc;
-- 25.Display customers alphabetically by their complete name using CONCAT().
select *,CONCAT(first_name,'',last_name)as full_name
from customers
order by full_name asc;
-- 26.Display menu items from longest to shortest preparation time.
select * from menu
order by preparation_time desc;
-- 27.Display orders from highest to lowest discount amount.
select * from orders
order by discount desc;
-- 4. LIMIT / TOP-N — 8 Questions
-- 28.Find the 5 highest-rated restaurants.
select * from restaurants
order by rating desc 
limit 5;
-- 29.Find the 10 most expensive menu items.
select * from menu
order by price desc 
limit 6;
-- 30.Find the 5 cheapest menu items.
select * from menu
order by price asc 
limit 5;
-- 31.Find the 5 customers who registered most recently.
select * from customers
order by created_at desc 
limit 5;
-- 32.Find the 5 delivery partners who joined most recently.
select * from Delivery_partners
order by joining_date desc
limit 5;
-- 33.Find the 10 largest orders based on final amount.
select * from orders
order by final_amount desc
limit 5;
-- 34.Find the 5 restaurants with the highest rating.
select * from restaurants
order by rating desc 
limit 5;
-- 35.Find the 10 largest successful payments.
select * from payments
order by payment_status="Success" desc
limit 5;
-- 5. Aggregate Functions — 12 Questions
-- 36.Find the total number of customers.
select count(*) 
from customers;
-- 37.Find the total number of restaurants.
select count(*) 
from restaurants;
-- 38.Find the total number of menu items.
select count(*) 
from menu;
-- 39.Find the average restaurant rating, rounded to 2 decimal places.
select round(avg(rating),2)
 from restaurants;
-- 40.Find the cheapest and most expensive menu item.
select min(price),max(price) 
from Menu;
-- 41.Find the average menu item price.
select round(avg(price),2) 
from menu;
-- 42.Find the total number of orders.
select count(*) 
from orders;
-- 43.Find the total number of food items ordered.
select sum(quantity) 
from order_items;
-- 44.Calculate the total food revenue using Order_Items.total_price.
select sum(total_price)
 from order_items;
-- 45.Calculate the total delivery charges collected.
select sum(delivery_charge) 
from orders;
-- 46.Calculate the total discounts given to customers.
select sum(discount) from orders;
-- 47.Calculate the total successful payment amount and total refunded amount.
select * from payments;