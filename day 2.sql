create database BankingDB;

USE BankingDB;
CREATE table IF NOT exists Customers(
customberID int, FirstName varchar(50),
LastName varchar(50), Email VARCHAR(100),
Phone VARCHAR(20)
);

desc Customers;


ALTER TABLE Customers
Add AccountCeationDate Date;

insert into Custombers
(CustomberID,FirstName,LastName,Email,Phone,AcountCreationDate)
value(101,"Edwin"



 







