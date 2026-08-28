create database tips_analysis;
use tips_analysis;
select * from tips;
desc tips;

-- CHANGE SEX COLUMN NAME AS GENDER
Alter table tips rename column sex to gender;
select * from tips;
-- 1.GET FEMALE RECORDS
Select * from tips 
where gender="Female";

-- 2.FIND MALE RECORDS
Select * from tips 
where gender = "Male";

-- 3.FIND DINNER ITEM FEMALE RECORDS
Select * from tips
 where gender="Female" and time="dinner";
 
 -- 4.FIND THE SIZE 2 RECORDS
Select * from tips
where size=2;

-- 5.FIND MALE SMOKER RECORDS
Select * from tips
where gender="Male" and smoker="Yes";

-- 6.GET THE NON-SMOKER FEMALE RECORDS
Select * from tips 
where gender="Female" and smoker="No";

-- 7.GET THE DINNER TIME IN MALE RECORDS
Select * from tips 
where gender="Male" and time="Dinner";

-- 8.GET THE FEMALE RECORDS IN DESCENDING ORDER AS PER THE TOTAL_BILL
select * from tips 
where gender="Female"
Order By total_bill desc;

-- 9.GET THE TOP 5 MALE TOTAL BILLS
SELECT * FROM tips 
where gender="male" 
Order By total_bill desc 
Limit 5;

-- 10.GET BOTH SIZE 2 AND 3 RECORDS
Select * from tips
where size=2 or size=3;

-- 11.GET THE RECORDS WHOSE TOTAL BILL IN THE RANGE OF 10 TO 20
Select * from tips 
where total_bill between 10 and 20;

-- 12.GET SIZE 2 3 AND 4 RECORDS
Select * from tips
where size in (2,3,4);

Select * from tips
where size=2 or size=3 or size=4;

Select * from tips
where size between 2 and 4;

-- SECOND HIGHEST TOTAL BILL RECORD
Select * from tips 
order by total_bill desc
LIMIT 1 OFFSET 1;

-- SECOND AND THIRD HIGHEST
Select * from tips 
order by total_bill desc
LIMIT 2 OFFSET 1;

-- RETURN TOTAL RECORDS IN TIPS TABLE
Select COUNT(*) from tips;

-- RETURN TOTAL MALE SMOKER COUNT
Select Count(*) from tips
 where gender="Male" and smoker="Yes";
 
 Select gender,smoker,Count(*) from tips 
where gender="Male" and smoker="Yes";
-- RETURN TOTAL TIP
Select Sum(tip) from tips;

-- RETURN FEMALE NON SMOKER COUNT
Select Count(*) from tips
where gender="Female" and smoker="No";

-- RETURN MINIMUM AND MAXIMUM TOTAL BILL
Select Min(total_bill),Max(total_bill) from tips;