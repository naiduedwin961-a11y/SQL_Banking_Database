SELECT * FROM bankingdb.customers;

use customers;

INSERT INTO customers
(FirstName, LastName, Email, Phone, DateOfBirth)
VALUES
('John', 'Smith', 'john@gmail.com', '9876543210', '1995-05-10');
select  *from  customers;


show table status;
update  customers set Phone=7559102548 where Phone;

SET SQL_SAFE_UPDATES = 0;

INSERT INTO Customers 
(FirstName, LastName, Email, Phone, DateOfBirth)
VALUES 
('Priya', 'Verma', 'priya.verma@gmail.com', '9812345678', '1997-08-22'); 




