-- Step 1: Create the Employees Table
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(50),
    Department VARCHAR(50),
    HireDate DATE
);

-- Step 2: Insert Sample Data
INSERT INTO Employees (EmployeeID, Name, Department, HireDate) VALUES
(1, 'Alice', 'HR', '2020-06-15'),
(2, 'Bob', 'Finance', '2019-08-21'),
(3, 'Charlie', 'IT', '2021-04-10'),
(4, 'David', 'Sales', '2018-12-05'),
(5, 'Eve', 'HR', '2022-01-11');
SELECT * FROM Employees;

-- Step 3: Modify Table Structure (Add New Columns)
ALTER TABLE Employees ADD COLUMN LastUpdated DATETIME DEFAULT CURRENT_TIMESTAMP;
ALTER TABLE Employees ADD COLUMN Status VARCHAR(10) DEFAULT 'Active';
SELECT * FROM Employees;

-- Step 4: Update New Columns
UPDATE Employees SET Status = 'Inactive' WHERE EmployeeID = 4;
UPDATE Employees SET LastUpdated = '2024-03-30 12:00:00' WHERE EmployeeID = 2;
SELECT * FROM Employees;

-- Step 5: Delete Records Based on Conditions(Remove records older than Jan 2023 or Inactive Employees)
DELETE FROM Employees WHERE Status = 'Inactive'; 
DELETE FROM Employees WHERE LastUpdated < '2023-01-01 00:00:00'; -- 


--  final table structure and records
SELECT * FROM Employees;
