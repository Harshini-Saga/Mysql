-- CREATING MOVIES DATABASE
CREATE DATABASE IF NOT EXISTS MOVIES;

CREATE DATABASE SONGS;

-- SELECTING DATABASE
-- SYNTAX: USE DatabaseName;
USE MOVIES;

-- REMOVE DATABASE
DROP DATABASE IF EXISTS SONGS;

-- Creating Table  
Create Table Telugumovies(
	ID INT,
    Moviename Varchar(30),
    Director Varchar(30),
    Duration Int
);

-- CHECK TABLE DESCRIPTION
-- SYNTAX: DESCRIBE TABLENAME;
describe Telugumovies;


-- CREATING STUDENT DATABASE
CREATE DATABASE SCHOOL; 
-- CREATING STUDENTS TABLE
Use SCHOOL;
CREATE TABLE Student(
	StuID INT PRIMARY KEY auto_increment,
	Name Varchar(30) NOT NULL,
    Gender Varchar(30) NOT NULL,
    Class INT
);
describe Student;

Create Table Marks(
	StuID INT,
    s1 INT,
    s2 INT,
    s3 INT,
    Percentage FLOAT(4,2),
    FOREIGN KEY(StuID) References Student(StuID)
);
    
desc Marks;
DROP TABLE MARKS;
-- ALTER COMMAND
-- ADD NEW AGE COLUMN
-- SYNTAX: ALTER TABLE TABLENAME ADD COLUMN COLUMNNAME DATATYPE [CONSTRAINTS]
ALTER TABLE STUDENT ADD COLUMN AGE INT CHECK(AGE>5);
ALTER TABLE STUDENT ADD COLUMN DOB DATE;
DESC STUDENT;

ALTER TABLE STUDENT ADD COLUMN LOCATION VARCHAR(50),
						ADD COLUMN ADDRESS VARCHAR(30);
-- DELETE COLUMNS
-- SYNTAX: ALTER TABLE TableName DROP COLUMN ColName;
ALTER TABLE STUDENT DROP COLUMN LOCATION,
						DROP COLUMN ADDRESS;
DESC STUDENT;
-- RENAME COLNAME
-- SYNTAX:ALTER TABLE TABLENAME RENAME COLUMN Old_Col_Name TO New_Col_Name;
ALTER TABLE STUDENT RENAME COLUMN StuID TO STDID;

-- CHANGE GENDER COLUMN DATATYPE
-- SYNTAX:ALTER TABLE TABLENAME MODIFY COLUMN Col_Name New_DATATYPE[CONSTRAINTS];
ALTER TABLE STUDENT MODIFY COLUMN GENDER ENUM("MALE","FEMALE");
ALTER TABLE STUDENT MODIFY COLUMN AGE TINYINT;
ALTER TABLE STUDENT MODIFY COLUMN CLASS TINYINT;

ALTER TABLE STUDENT MODIFY COLUMN CLASS TINYINT NOT NULL;

-- INSERT RECORDS INTO STUDENTS TABLE-1
Insert into student Values(101,"Ravi","MALE",6,11,"2015-01-01");
-- -2
Insert into student(name,gender,class,age,dob)
values("harshini","female",7,12,"2016-01-07");

Insert into student(name,gender,class,age,dob)
values("lasya","female",6,2,"2016-08-02");
-- fetch table data
select * from student;


Insert into student(name,gender,class,age,dob)
values("female",7,12,"2016-01-07");

Insert into student(name,gender,class,age,dob)
values("harshini","female",2,12,"2016-01-07");
  
Insert into student(name,gender,class,age,dob)
values("harshini","other",7,12,"2016-01-07");

Insert into student(stdid,name,gender,class,age,dob)
values(101,"harshini","female",7,12,"2016-01-07");


desc marks;
-- Inserting values into marks
insert into marks values(101,34,89,32,55.02),
	(102,54,98,93,88.09),(103,45,98,87,90.2);

insert into marks values(107,34,89,32,55.02);
select * from marks;
-- UPDATING values
-- UPDATE 5 MARKS FOR 101 STUDENT FOR S1
select * from marks
where StuID=101;
Update marks set s1=s1+5
where StuID=101;
-- UPDATE 5 MARKS FOR 102 STUDENT FOR S1 AND S2
select * from marks
where StuID=102;
Update marks set s1=s1+5,s2=s2+5
where StuID=102;

select * from marks;
-- UPDATING PERCENTAGE column as derived column
Alter table marks modify column Percentage Float(4,2) GENERATED ALWAYS AS ((s1+s2+s3)/3) stored;

-- ADDING TOTAL MARKS COLUMN
Alter table marks add column total_marks int Generated always as (s1+s2+s3) stored after s3;


