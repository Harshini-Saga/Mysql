use classicmodels;
-- 1.GET THE CURRENT DATE AND TIME
select now();

-- 2.GET The current timestamp
select current_timestamp();
-- 3.GET THE CURRENT TIMESTAMP FORMAT AS (DAY-MONTH-YEAR 12h format time)
SELECT DATE_FORMAT(NOW(), '%d-%m-%Y %h:%i:%s %p') as current_datetime;
-- 4.HOW OLD ARE YOU (IN TERMS OF YEARS)
SELECT floor(datediff( now(),'2005-02-22')/365) AS age;
select * from orders;
-- 5.GET THE ORDER DETAILS WHICH ORDER COMMENTS IS NOT NULL
select * from orders
where comments is NOT NULL;
-- 6.GET THE ORDER DETAILS WHICH ORDER IS NOT ABLE TO DELIVER WITHIN REQUIRED DATE
select * from orders
where shippedDate>requiredDate;
-- FIND HOW MANY DAYS TAKEN FOR EVERY DELIVERY IN DESCENDING ORDER
select orderNumber,orderdate,shippeddate,datediff(shippedDate,orderDate) As Total_days
from orders
order by total_days desc;
-- find each year total successful deliveries count
select year(orderDate),count(*) as total_count 
from orders
where status = "shipped"
group by year(orderDate);