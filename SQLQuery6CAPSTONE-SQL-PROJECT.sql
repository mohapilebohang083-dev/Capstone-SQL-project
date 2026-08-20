CREATE DATABASE SuperMart_Db; --CREATED A DATABASE

USE SuperMart_Db
GO
 
 --CREATE A TABLE NAME "CUSTOMERS" 
CREATE TABLE Customers
(CustomerId INT NOT NULL PRIMARY KEY,
FirstName VARCHAR (50) NOT NULL,
LastName VARCHAR (50) NOT NULL,
City VARCHAR (50) NOT NULL,
Phone VARCHAR (20) NULL ,
Emails VARCHAR (100) NOT NULL);

--CREATE THE SECOND TABLE NAMES "ORDERS" 
CREATE TABLE Orders
(OrderId INT NOT NULL PRIMARY KEY,
CustomerId INT NOT NULL,
OrderDate DATE NOT NULL ,
StatusCode CHAR (1) NOT NULL ,
TotalAmount DECIMAL(10,2) NOT NULL,
FOREIGN KEY (CustomerId) REFERENCES Customers(CustomerId));

--INSERT 7 CUSTOMERS
--ADD ATLEAST 3 CITIES
INSERT INTO Customers (CustomerId,FirstName,LastName,City,Phone,Emails)
VALUES
(1, 'Ndumiso', 'Kubheka', 'Vanderbijlpark', '0716582455', 'ndumi@gmail.com'),
(2, 'Lizwi', 'Mabece', 'Centurion', '0682545655', 'lizwi@gmail.com'),
(3, 'Luwo' , 'Duwo','Palm Sorings', '0795484551', 'luwo@gmail.com'),
(4, 'Vusi' , 'Hlongwane', 'Orange Farm', '0829455529', 'vusi@gmail.com'),
(5, 'Dumisane', 'Ntuli', 'Orange farm', '0654585551', 'dumisane@gmail.com'),
(6, 'Xolani', 'Nkonyane', 'Soweto', '0661796314', 'xolani@gmail.com'),
(7, 'Karabo', 'Zibi', 'Savannah City', '0781654396', 'karabo@gmail.com');

--INSERT 10 ORDERS BETWEEN THE DATE OF 01 JAN 2026 AND 31 DEC 2026
INSERT INTO Orders
(OrderId, CustomerId, OrderDate, StatusCode, TotalAmount)
VALUES 
(101, 1, '2026-02-10', 'D',1250.50),
(102, 2, '2026-03-25', 'P',1500.60),
(103, 3, '2026-06-11', 'C', 900.25),
(104, 4, '2026-01-31', 'D', 1874.92),
(105, 5, '2026-08-04', 'D', 2000.00),
(106, 6, '2026-05-12', 'C', 694.55),
(107, 7, '2026-07-26', 'D', 2268.45),
(108, 5, '2026-08-08', 'P', 1200.22),
(109, 4, '2026-09-18', 'D', 1655.58),
(110, 1,'2026-04-09', 'D',1845.33);

--UPDATE CITY 
UPDATE Customers
SET City = 'Johannesburg'
WHERE CustomerId = 1;

--VIEW DATA 
SELECT * FROM Customers;

--UPDATE THE CUSTOMER TABLE 
UPDATE Customers
SET City = 'Cape Town'
WHERE CustomerId = 5;

--VIEW DATA FROM TABLE CUSTOMER
SELECT * FROM Customers;

UPDATE Customers
SET City = 'Pretoria'
WHERE CustomerId = 4;

--VIEW DATA FROM BOTH TABLES 
SELECT * FROM Customers;
SELECT * FROM Orders;

UPDATE Orders
SET CustomerId = 7
WHERE OrderId = 103;

SELECT * FROM Orders;

UPDATE Customers
SET Phone = NULL
WHERE CustomerId = 5;

SELECT * FROM Customers;

UPDATE Customers
SET Phone = NULL
WHERE CustomerId = 7;

SELECT * FROM Customers;

--ALTER TABLE  "CUSTOMERS" BY ADDING THE COUNTRY COLUMN SINCE ITS NEEDED
ALTER TABLE Customers
ADD Country VARCHAR(50) NOT NULL DEFAULT 'South Africa';
SELECT * FROM Customers;

--CONCAT THE NAMES TO CUSTOMER NAME AND COALESCE THE PHONE NUMBER TO "NO PHONE NUMBER"
--WHEN A CUSTOMER DOESNT HAVE THE PHONE NUMBER
SELECT CustomerId AS [Customer ID],
CONCAT (FirstName, ' ', LastName) AS[Customer Name],
Country,
City,
COALESCE (Phone, 'No Phone Number') AS [Phone Number]
FROM Customers
ORDER BY CustomerId;

--filtering data 
--Used the IN Operator ,the IN Operator let us
--check for multiple cities in one go instead OF OR OR 
SELECT CONCAT(FirstName, ' ', LastName) 
AS [Full Name],
Emails,
City
FROM Customers
WHERE City IN ('Johannesburg','Pretoria');

--USED THE BETWEEN OPERATOR
--Between includes both start and end dates 
SELECT 
OrderId AS [Order ID],
CustomerId AS [Customer ID],
OrderDate AS [Order Date],
StatusCode AS [Status], 
TotalAmount
    FROM Orders
	WHERE OrderDate BETWEEN '2026-01-01' AND '2026-03-31';

	--SQL JOINS
	--Inner Join shows Customers that match in both tables
SELECT CONCAT(c.FirstName,' ',c.LastName) AS [Customer Name],
o.OrderId AS [Order ID],
o.OrderDate AS [Order Date],
o.TotalAmount 
FROM Customers c INNER JOIN Orders o ON c.CustomerId = o.CustomerId
ORDER BY o.OrderDate;

--Left Join 
--Shows Everyone.if no order,Order column will be Null
SELECT CONCAT (c.FirstName,' ',c.LastName) AS [Customer Name],
c.Emails,
o.OrderId AS [Order ID],
o.OrderDate AS [Order Date],
o.TotalAmount 
FROM Customers c LEFT JOIN Orders o ON c.CustomerId = o.CustomerId
ORDER BY c.CustomerId;

--used the Right Join Operator and concatenated the customers names
--and emails
-- joined the orders with the Customers to get the Total Amount
SELECT CONCAT (c.FirstName,' ',c.LastName) AS [Customer Name],
c.Emails,
o.OrderId AS [Order ID],
o.OrderDate AS [Order Date],
o.TotalAmount 
FROM Customers c RIGHT JOIN Orders o ON c.CustomerId = o.CustomerId
ORDER BY c.CustomerId;

--implemented the FULL JOIN on the orders to the customers 
--and other orders were giving null
SELECT CONCAT (c.FirstName,' ',c.LastName) AS [Customer Name],
c.Emails,
o.OrderId AS [Order ID],
o.OrderDate AS [Order Date],
o.TotalAmount 
FROM Customers c FULL JOIN Orders o ON c.CustomerId = o.CustomerId
ORDER BY c.CustomerId;

--ACTIVITY 6
--CUSTOMER DIRECTORY
--TASK 1 EMPLEMENTING UPPERCASE
SELECT UPPER (CONCAT (FirstName,' ',LastName)) AS [Customer Name],
Country,
LEN(FirstName) AS [Length of First Name]
FROM Customers
ORDER BY FirstName ASC;

-- TASK 2
--customer distribution by Country
-- ARRANGING BY DESCENDING ORDER
SELECT Country,
COUNT(CustomerId) AS [Total Customer]
FROM Customers
GROUP BY Country
ORDER BY COUNT(CustomerID) DESC;

--Task 3 
--Total Everage,Average,Highest,Lowest order amount
--order summary report for finance
SELECT COUNT(OrderID ) AS [Total Number of Orders],
AVG(TotalAmount) AS [Average Order Amount],
MAX(TotalAmount) AS [Highest Order Amount],
MIN(TotalAmount) AS [Lowest Order Amount]
FROM Orders;

--Task 4
--Order activity for Operations Manager
--OrderID,OderDate,year,Month,Days since order,sort by Highest amount
SELECT 
OrderId AS [Order ID],
OrderDate AS[Order Date],
YEAR(OrderDate) AS [Order Year],
MONTH(OrderDate) AS [Order Month],
DATEDIFF(DAY, OrderDate, GETDATE()) AS [Days Since Order],
TotalAmount
FROM Orders 
ORDER BY TotalAmount;

--ACTIVITY 7
--Section A
--Query 1 Using IN operator resulting in CustomerName and
--country on the table
SELECT 
CustomerId AS [Customer ID],
CONCAT(FirstName,' ',LastName) AS [Customer Name],
Country
FROM Customers
WHERE CustomerId IN (SELECT CustomerId FROM Orders);

--Query 2
--Using EXISTS operator,concating the Customers names and their
--Country
SELECT C.CustomerId AS [Customer ID],
CONCAT(C.FirstName, ' ',C.LastName) AS [Customer Name],
C.Country 
FROM Customers C
WHERE EXISTS (SELECT 1 FROM Orders O WHERE O.CustomerId = C.CustomerId);

--SECTION B
--REUSABLE REPORT
--Create a viewed named CustomerOrder 
CREATE VIEW CustomerOrders AS 
SELECT CONCAT(C.FirstName , ' ', C.LastName)
AS [Customer Name],
O.OrderDate AS [Order Date],
O.TotalAmount AS [Total Amount]
FROM Customers C 
JOIN Orders O ON C.CustomerId = O.CustomerId;
--TO REUSE IT LATER :SELECT * FROM CustomerOrders;

--CTE For Total number of orders per customer
--Based on"calculate the total number of orders" that was cut off at the bottom
WITH OrderCount AS
(SELECT
CustomerId, COUNT(OrderId) AS  [Total Orders]
FROM Orders 
GROUP BY CustomerId)
SELECT 
CONCAT(C.FirstName, ' ', C.LastName) 
AS [Customer Name],
OC.[Total Orders]
FROM Customers C 
JOIN OrderCount OC ON C.CustomerId = OC.CustomerId; 

--SECTION B.2:CTE - Total amount of orders per customers
--The CTE CustomerOrderCount counts order per CustomerId,
--then we join to customer to get the name .
WITH CustomerOrderCount AS 
(SELECT CustomerId,COUNT(OrderId) AS [Number of Orders]
FROM Orders
GROUP BY CustomerId)
SELECT 
CONCAT(C.FirstName, ' ',C.LastName) 
AS [Customer name],
COC.[Number of Orders]
FROM Customers C
JOIN CustomerOrderCount COC ON C.CustomerId = COC.CustomerId
ORDER BY COC. [Number of Orders] DESC;

--SECTION C : STORED PROCEDURE
--Altered the table
ALTER TABLE Orders
ADD OrderStatus VARCHAR (50) 
SELECT * FROM Orders;

--procedure that takes CustomerID and returns all 
--orders for that customer
SELECT 
OrderId AS [Order ID],
OrderDate AS [Order Date],
OrderStatus AS [Order Status],
TotalAmount AS [Total Amount]
FROM Orders 
WHERE CustomerId = CustomerID
ORDER BY OrderDate DESC;