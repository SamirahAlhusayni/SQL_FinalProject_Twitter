-- create database 
CREATE DATABASE twitter;
USE twitter;

-- Create the tables with the relationships
CREATE TABLE User(
id INT AUTO_INCREMENT PRIMARY KEY,
user_name VARCHAR(225),
email VARCHAR(225),
passwordIncript BINARY(64) 
);


CREATE TABLE Tweets(
create_date TIME,
likes INT,
tweet_id VARCHAR(225),
content VARCHAR(225),
id INT ,
foreign key (id) REFERENCES User(id)
);




-- create table for the profile
create table Profilee(
fullname  VARCHAR(225),
bio VARCHAR(225),
create_date DATE ,
followers INT,
ffollowing INT,
likes INT,
tweets INT,
prof_id INT,
FOREIGN KEY (prof_id) REFERENCES User(id)
);


-- insert values to users table
INSERT INTO user (user_name, email, passwordIncript)  
values("Samab","samabe@gmail.com",md5("Ssss_12")),
 ("ALI","ALii@gmail.com",md5("Ali_1212"));
Select * from User;

-- insert values for the profile
insert into Profilee(fullname,bio,create_date,followers,ffollowing,likes,tweets,prof_id)
values("Ahmed Alotaibi","Doctor at KSU",NOW(),2,3,4,5,1);
Select * from Profilee;


-- insert values for tweets 
insert into Tweets(create_date,likes,tweet_id, content,id)
values(CURTIME(),3,1,"Hello from .NET Bootcamp",1);
Select * from tweets;



-- createAccount PROCEDURE
delimiter //
CREATE PROCEDURE createAccount(In email varchar(255),In passwordIncript binary(64), In fullname varchar(255),In user_name varchar(255))
BEGIN
INSERT INTO user (user_name, email,passwordIncript) 
VALUES (user_name,email, md5(passwordIncript));
INSERT INTO Profilee (fullname, create_date) 
values (fullname,curdate());
END;
call createAccount('SAMi@gmail.com','sam8090','Sami Abed','sami');
SELECT * FROM User;

-- create procedure User_Follow
create table user_follow(You int not null,Follow int not null)
delimiter //
create procedure User_Follow(user_name varchar(255),ffollowing varchar(255))
begin
INSERT INTO user_follow (YOu, Follow) 
VALUES (
(select id from user where user.user_name=user_name)
,(select id from user where user.user_name=ffollowing));
end;
DROP PROCEDURE User_Follow;
Call User_Follow ('Samab', 'ALI');
SELECT * FROM User_Follow;

-- return the count of tweets for one user
SELECT COUNT(tweet_id)
FROM Tweets createAccount
WHERE id= 1;

