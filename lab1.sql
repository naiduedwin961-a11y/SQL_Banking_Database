CREATE TABLE Persons(
ID int NOT NULL,
LastName Varchar(255) NOT NULL,
FirstName Varchar(255) NOT NULL,
Age int
);

desc Persons;
-- Add null Constraints to 'Age" Column --
ALTER table Persons modify column Age INT NOT NULL;

desc Persons;

insert into Persons values(1,'Pandey','Hitesh',33);

Select FirstName,LastName,concat(FirstName,"_",LastName) as 'Employee Name' from Persons;


-- Unique --
Alter table Persons add column Email Varchar(200);

ALTER table Persons modify column Email Varchar(200) unique;

desc Persons;

ALTER table Persons modify column ID int Primary Key;

-- CHECK() CONSTRAINT ON 'age' column --
alter table Persons modify column age int check(age>18);

select *from Persons;

insert into Persons values(5,'Gandhi','Rahul',25,'gandhi_rahul154@gmail.com');

