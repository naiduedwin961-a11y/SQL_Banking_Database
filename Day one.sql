


-- 1. Table ko delete (drop) karein
DROP TABLE IF EXISTS employee;

-- 2. Clean structure ke saath fresh table banayein
CREATE TABLE employee (
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(100),
    Department VARCHAR(50),
    Salary DECIMAL(10, 2),
    JoiningDate DATE,
    City VARCHAR(50)
);

-- 3. Direct 101 se 110 tak ka clean data insert karein
INSERT INTO employee (EmployeeID, EmployeeName, Department, Salary, JoiningDate, City)
VALUES 
(101, 'Vansh', 'Computer', 80000.00, '2026-09-01', 'Nagpur'),
(102, 'Aarav Sharma', 'IT', 55000.00, '2026-09-02', 'Pune'),
(103, 'Neha Verma', 'HR', 48000.00, '2026-09-03', 'Delhi'),
(104, 'Rohan Gupta', 'Finance', 62000.00, '2026-09-04', 'Mumbai'),
(105, 'Priya Patel', 'Marketing', 50000.00, '2026-09-05', 'Nagpur'),
(106, 'Amit Kumar', 'IT', 58000.00, '2026-09-06', 'Bangalore'),
(107, 'Sneha Joshi', 'Operations', 45000.00, '2026-09-07', 'Pune'),
(108, 'Karan Mehta', 'Finance', 70000.00, '2026-09-08', 'Delhi'),
(109, 'Ananya Roy', 'HR', 52000.00, '2026-09-09', 'Mumbai'),
(110, 'Vikram Singh', 'Computer', 75000.00, '2026-09-10', 'Nagpur');

-- 4. Result check karein
SELECT * FROM employee;