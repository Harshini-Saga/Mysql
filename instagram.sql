create database StudentInstagramDB;
use StudentInstagramDB;

Create table Users(
	UserID INT PRIMARY KEY AUTO_INCREMENT,
    Username Varchar(50) unique not null,
    Email Varchar(100) Unique Not NUll,
    Password Varchar(20) Not null,
    Bio text,
    CreatedAt datetime default current_timestamp
);
desc Users;
Create Table Posts(
	PostID Bigint primary key auto_increment,
    UserID INT,
    Caption Text,
    LikesCount INT Default 0,
    CreatedAt timestamp default current_timestamp,
    Foreign Key (UserID) REFERENCES Users(UserID)
);
desc Posts;
Create Table Comments(
	CommentID INT Primary key auto_increment,
    PostID BIGINT,
    UserID INT,
    CommentText Varchar(255),
    CreatedAt datetime default current_timestamp,
    Foreign key(PostID)References Posts(PostID),
    Foreign key(UserID)References Users(UserID)
);
desc Comments;
-- ALTER TABLE - ADD COLUMN
Alter table Users add column Phonenumber Varchar(15);

-- ALTER TABLE - MODIFY COLUMN
Alter Table Users modify column Phonenumber Varchar(30);

-- ALTER TABLE - RENAME COLUMN
Alter Table Users rename column Bio to Biography;
-- Truncate table
Truncate table posts;
-- Drop Table
Drop table Comments;