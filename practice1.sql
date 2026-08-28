Create database work;
use work;
Create Table Employee(
	emp_id int primary key,
    emp_name varchar(50),
    salary int,
    department varchar(30),
    city varchar(50));
INSERT INTO Employee VALUES
(101, 'Ravi', 30000, 'IT', 'Hyderabad'),
(102, 'Priya', 45000, 'HR', 'Bangalore'),
(103, 'Arun', 25000, 'IT', 'Chennai'),
(104, 'Sneha', 50000, 'Finance', 'Hyderabad'),
(105, 'Kiran', 35000, 'HR', 'Chennai');
Insert into Employee values(106,"Rahul",40000,"IT","Banglore");
INSERT INTO Employee VALUES
(107, 'Harshini', 70000, 'IT', 'Noida'),
(108, 'Lasya', 45000, 'HR', 'Bangalore');
-- WHERE CLAUSE
select * from Employee where department="IT";
Select * from EMployee where salary>35000;
Select * from EMployee where city="Hyderabad";
Select * from EMployee where salary between 30000 and 45000;
Select * from Employee where department="HR" and city="Chennai";
-- UPDATE CLAUSE
Set sql_safe_updates=0;
Update Employee SET Salary=28000 where emp_id=103;
Update Employee SET Salary=Salary+5000 where department="IT";
Update Employee SET City="Hyderabad" where emp_id=102;

-- DELETE CLAUSE
Delete from Employee where emp_id=105;
Delete from Employee where salary<30000;
Delete from Employee where department="HR";

Select * from Employee;