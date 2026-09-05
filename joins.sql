use classicmodels;
select * from customers;
select * from orders;
-- INNER JOIN
-- GET THE CUSTOMER DETAILS WHO PLACED AN ORDER
select c.customerNumber,customerName,orderNumber from customers c
INNER JOIN orders o
on c.customernumber=o.customernumber;
-- GET THE UNIQUE CUSTOMER DETAILS WHO PLACED AN ORDER
select DISTINCT c.customerNumber,customerName from customers c
INNER JOIN orders o
on c.customernumber=o.customernumber;
-- GET THE CUSTOMER DETAILS WHOSE ORDER IS SUCCESSFULLY SHIPPED
select DISTINCT c.customerNumber,customerName,orderNumber from customers c
INNER JOIN orders o
on c.customernumber=o.customernumber
WHERE o.status='shipped';
-- GET THE CUSTOMER DETAILS WHOSE ORDER IS  CANCELLED
select c.customerNumber,customerName,orderNumber from customers c
INNER JOIN orders o
on c.customernumber=o.customernumber
WHERE o.status='CANCELLED';

-- EQUI JOIN
-- GET THE CUSTOMER DETAILS WHOSE ORDER IS  CANCELLED
select c.customerNumber,customerName,orderNumber from customers c,orders o
WHERE c.customernumber=o.customernumber and o.status="CANCELLED";

-- GET THE EACH CUSTOMER TOTAL ORDER'S COUNT
select c.customerNumber,customerName,count(*) as total_orders from customers c
INNER JOIN orders o
on c.customernumber=o.customernumber
group by c.customerNumber
order by total_orders desc;

-- RETURN EACH CUSTOMER'S TOTAL ORDER COUNT WHICH ARE SUCCESSFULLY SHIPPED
select c.customerNumber,customerName,count(*) as total_orders from customers c
INNER JOIN orders o
on c.customernumber=o.customernumber
WHERE O.STATUS="SHIPPED"
group by c.customerNumber
order by total_orders desc;

-- RETURN EACH CUSTOMER'S TOTAL ORDER COUNT WHICH ARE GREATER THAN 3
select c.customerNumber,customerName,count(*) as total_orders from customers c
INNER JOIN orders o
on c.customernumber=o.customernumber
WHERE O.STATUS="SHIPPED"
group by c.customerNumber
having count(*)>3
order by total_orders desc;

-- NATURAL JOIN
-- GET THE CUSTOMER DETAILS WHOSE ORDER IS PLACED
select DISTINCT c.customernumber,customerName from customers c
NATURAL JOIN orders o;
-- AS THERE IS NO MATCHED RECORDS IT IS PERFORMED AS CROSS JOIN 
select customernumber,customerName,employeeNumber from customers c
NATURAL JOIN employees;
-- CROSS JOIN
select customernumber,customerName from customers c
CROSS JOIN employees;

-- LEFT JOIN



