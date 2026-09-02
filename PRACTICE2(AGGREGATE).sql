use work;
select * from employee;
-- FIND THE TOTAL SALARY OF ALL EMPLOYEES USING SUM()
select sum(salary) as total_salary
from employee;
-- FIND THE AVG SALARY OF ALL EMPLOYEES USING AVG()
select avg(salary) as avg_salary
from employee;
-- FIND THE HIGHEST SALARY USING MAX()
select max(salary) as highest_salary
from employee;
-- FIND THE LOWEST SALARY USING MIN()
select min(salary) as lowest_salary
from employee;
-- FIND THE NUMBER OF EMPLOYEES USING COUNT()
select count(*) as num_of_emp
from employee;
-- FIND THE AVERAGE SALARY DEPARTMENT WISE
select department,avg(salary) as avg_salary
from employee
group by department;
-- FIND THE HIGHEST SALARY IN EACH DEPARTMENT
select department,max(salary) as highest_salary
from employee
group by department;
-- FIND THE LOWEST SALARY IN EACH DEPARTMENT
select department,min(salary) as lowest_salary
from employee
group by department;
-- FIND NUMBER OF EMPLOYESS IN EACH DEPARTMENT
select department,count(*) as number_of_employees
from employee
group by department;
-- DISPLAY DEPARTMENTS HAVING MORE THAN 3 EMPLOYEES USING HAVING
select department,count(*) as number_of_employees
from employee
group by department
having number_of_employees>3;
-- DISPLAY DEPARTMENTS WHOSE AVG SALARY IS GREATER > 40000;
select department,AVG(salary) as avg_salary
from employee
group by department
having avg_salary>40000;
-- FIND THE DEPARTMENT HAVING HIGHEST TOTAL SALARY
select department,sum(salary) as highest_salary
from employee
group by department
order by highest_salary desc limit 1;
--  FIND THE DEPARTMENT HAVING LOWEST TOTAL SALARY
select department,avg(salary) as lowest_salary
from employee
group by department
order by lowest_salary asc limit 1;
-- DISPLAY THE CITY-WISE NUMBER OF EMPLOYEES, SORTED BY EMPLOYEE COUNT IN DESCENDING ORDER
select city,count(*)as total_count
from employee
group by city
order by total_count desc;
-- FIND THE DEPARTMENT-WISE TOTAL SALARY, BUT DISPLAY ONLY DEPARTMENTS WHERE TOTAL SALARY IS GREATER THAN 1,00,000
select department,sum(salary) as total_salary
from employee
group by department
having total_salary>100000;
-- DISPLAY EMPLOYEES SORTED BY SALARY IN DESCENDING ORDER USING ORDER BY
select * 
from employee
order by salary desc;
-- DISPLAY EMPLOYEES WHOSE SALARY IS GREATER THAN 30000 AND SORT THEM BY SALARY IN ASCENDING USING WHERE AND ORDER BY
select * from employee
where salary>30000
order by salary asc;
-- FIND THE SECOND HIGHEST SALARY USING ORDER BY AND LIMIT
select salary from employee
order by salary desc 
limit 1 offset 1;
-- FIND THE TOP 3 HIGHEST PAID EMPLOYEES USING ORDER BY AND LIMIT
select * from employee
order by salary desc  
limit 3;