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

-- 13.SECOND HIGHEST TOTAL BILL RECORD
Select * from tips 
order by total_bill desc
LIMIT 1 OFFSET 1;

-- 14.SECOND AND THIRD HIGHEST
Select * from tips 
order by total_bill desc
LIMIT 2 OFFSET 1;

-- 15.RETURN TOTAL RECORDS IN TIPS TABLE
Select COUNT(*) from tips;

-- 16.RETURN TOTAL MALE SMOKER COUNT
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

select * from tips;
-- GROUP BY --
-- FIND THE SUNDAY RECORDS COUNT
Select count(*) from tips
group by day="Sun";
-- GET THE GENDER COLUMN UNIQUE VALUES
Select distinct(gender) from tips;
select gender from tips
group by gender;
-- GET THE DINNER TIME RECORDS COUNT
select count(*) from tips
where time="Dinner";

-- 21.GET THE TOTAL RECORDS COUNT AS PER THE GENDER COLUMN
Select gender,Count(*) from tips
group by gender;

-- 22.GET THE SMOKER AND NON-SMOKER COUNT
select smoker,Count(*) from tips 
group by smoker;

-- 23.GET THE SUNDAY TOTAL RECORDS AS PER THE GENDER 
Select day,gender,Count(*) from tips 
where day="Sun"
group by gender;

-- 24.GET THE SIZE 2'S TOTAL COUNT AS PER THE GENDER
Select size,gender,Count(*) from tips
where size=2
group by gender;

-- 25.GET THE EACH SIZE COUNT IN DESCENDING ORDER
select size,Count(*) as total_count from tips
group by size
Order by total_count desc;

-- 26.GET THE SIZE 2,3 AND 4 SMOKER AND NON-SMOKER COUNT
Select smoker,Count(*) from tips
where size in (2,3,4)
group by smoker;

-- 27.GET THE EACH SIZE COUNT AS PER THE GENDER
Select size,gender,Count(*) as total_count from tips
group by size,gender
order by size asc,total_count desc;

-- 28.FIND THE EACH SIZE MAX AND MIN TOTAL_BILL
select size,max(total_bill),min(total_bill) from tips
group by size;

-- 29.FIND THE MALE TOTAL RECORDS AS PER THE DAY IN DESCENDING ORDER
Select day,gender,count(*) as total_records from tips
where gender="Male"
group by day
order by total_records desc;

-- 31.GET EACH SIZE RECORDS WHICH THE TOTAL COUNT IS GREATER THAN 30
select size,count(*)as total_count from tips
group by size
having total_count>30;

-- 31.GET THE EACH SIZE GENDER COUNT WHICH IS MORETHAN 20
SELECT SIZE,COUNT(*) AS TOTAL_COUNT FROM TIPS 
GROUP BY GENDER
HAVING COUNT(*) >20
;
-- 32.GET THE SIZES WHICH IS MAXIMUM TOTAL_BILL AND MINIMUM TOTAL_BILL 
												-- DIFFERENCE IS LESSER THAN 10
SELECT SIZE,MAX(TOTAL_BILL),MIN(TOTAL_BILL) FROM TIPS
GROUP BY SIZE
HAVING MAX(TOTAL_BILL)-MIN(TOTAL_BILL)<30;