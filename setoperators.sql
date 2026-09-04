use classicmodels;
-- SET OPERATORS
select * from employees;
select * from orders;
select * from customers;

-- GET THE CUSTOMER NUMBERS WHO PLACED AN ORDER
(select customernumber from customers)
INTERSECT
(select customernumber from orders);

-- GET THE CUSTOMER NUMBERS WHO DIDNT PLACED ANY ORDER
(select customernumber from customers)
EXCEPT
(select customernumber from orders);

-- RETURN THE MANAGER ID'S FROM EMPLOYEES
(select reportsto  from employees)
INTERSECT
(select employeeNumber from employees)
