SuperMart T-SQL Capstone Project
📌 Project Overview

This project is a T-SQL database development capstone project based on a business scenario for SuperMart, a retail company opening a new branch in Johannesburg, South Africa.

The purpose of this project is to design and implement a small relational database using Microsoft SQL Server and demonstrate fundamental and intermediate T-SQL skills, including database creation, data manipulation, querying, joins, aggregation, views, Common Table Expressions (CTEs), stored procedures, transactions, and error handling.

The project was developed as part of an Introduction to T-SQL course.

🏢 Business Scenario

SuperMart is opening a new branch in Johannesburg.

As a Junior Database Developer in the company's Data Cluster, I was tasked with creating a small database that can be used by the sales and customer service departments to manage customer and order information.

The database stores information about:

Customers
Customer contact details
Orders
Order dates
Order statuses
Order amounts

The database also provides reports that allow management to analyse customer and sales activity.

🎯 Project Objectives

The main objectives of this project are to demonstrate the ability to:

Create and modify database tables using DDL statements
Insert, update, and delete records using DML statements
Retrieve information using SELECT
Use column aliases and string concatenation
Use COALESCE() to handle NULL values
Filter data using:
WHERE
DISTINCT
LIKE
IN
BETWEEN
IS NULL
AND
OR
<>
Retrieve related information using SQL joins
Sort and group data
Use aggregate functions
Use SQL date and string functions
Create and use subqueries
Create database views
Create and use Common Table Expressions (CTEs)
Create and execute stored procedures
Implement IF...ELSE logic
Implement transactions
Handle errors using TRY...CATCH
🗄️ Database Structure

The database is named:

SuperMart_Db


The project contains two main tables:

Customers

The Customers table stores customer information.

Column	Description
CustomerId	Unique identifier for each customer
FirstName	Customer's first name
LastName	Customer's surname
City	Customer's city
Phone	Customer's phone number; NULL values are permitted
Email	Customer's email address
Orders

The Orders table stores information about customer orders.

Column	Description
OrderId	Unique identifier for each order
CustomerId	References the customer who placed the order
OrderDate	Date the order was placed
StatusCode	Order status: P = Pending, D = Delivered, C = Canceled
TotalAmount	Total value of the order
Relationship

The database uses a one-to-many relationship between Customers and Orders.

One customer can have multiple orders, while each order belongs to a customer.

Customers
    |
    | 1
    |
    |------< Orders
             Many


The CustomerId column in the Orders table is a foreign key referencing Customers.CustomerId.

📊 Sample Data

The database is populated with:

7 customers
10 orders
Customers from multiple South African locations
Customers from Gauteng, including Johannesburg and Pretoria
Customers from Cape Town
Customers with NULL phone numbers
Orders with different dates throughout 2026
Orders with different amounts
Orders with different statuses
At least two customers who have not placed any orders

Order status codes are:

Code	Status
P	Pending
D	Delivered
C	Canceled
🔎 Project Activities
Activity 1 – Database Creation

The project creates the SuperMart_Db database and the required Customers and Orders tables.

Primary keys and the foreign key relationship are also implemented.

Activity 2 – Database Population

Sample customer and order records are inserted into the database to allow the required queries and reports to be tested.

Activity 3 – Basic Data Retrieval

A customer contact report is created using:

Column aliases
String concatenation
COALESCE()

The report displays each customer's full name and replaces missing phone numbers with:

No Phone Number

Activity 4 – Filtering Data

The project demonstrates filtering using:

IN to identify customers from Johannesburg and Pretoria
BETWEEN to retrieve orders placed during the first quarter of 2026
Activity 5 – SQL Joins

The following SQL joins are demonstrated:

INNER JOIN
LEFT JOIN
RIGHT JOIN
FULL OUTER JOIN

These queries are used to analyse relationships between customers and orders, including customers without orders and unmatched records.

Activity 6 – Sorting, Aggregation, Date and String Functions

The project demonstrates:

UPPER()
LEN()
YEAR()
MONTH()
DATEDIFF()
COUNT()
AVG()
MAX()
MIN()
GROUP BY
ORDER BY

These functions are used to create customer directories, customer distribution reports, order summaries, and order activity reports.

Activity 7 – Advanced Queries and Stored Procedures

Advanced SQL techniques demonstrated include:

Subqueries

Subqueries are used to identify customers who have placed at least one order.

View

A view named:

CustomerOrders


is created to provide reusable customer order information.

Common Table Expression

A CTE is created to calculate the number of orders placed by each customer.

Stored Procedure

A stored procedure named:

GetCustomerOrders


is created to retrieve all orders belonging to a specified customer.

The procedure accepts CustomerID as an input parameter.

Example:

EXEC GetCustomerOrders @CustomerID = 1;

🔐 Transactions and Error Handling

The project also demonstrates transaction management and error handling using:

BEGIN TRANSACTION
COMMIT
ROLLBACK
TRY...CATCH

These features help ensure that database operations can be safely completed or rolled back when an error occurs.

🛠️ Technologies Used
Microsoft SQL Server
SQL Server Management Studio (SSMS)
T-SQL
Git
GitHub
📁 Repository Structure

The repository contains the following main deliverables:

SuperMart-TSQL-Capstone/
│
├── SuperMart_Capstone.sql
│
├── README.md
│
└── Execution Report
    └── SuperMart_TSQL_Execution_Report.docx

SQL Script

The .sql file contains:

Database creation
Table creation
Primary and foreign keys
Sample data
Data retrieval queries
Filtering queries
Join queries
Aggregate queries
Date and string functions
Subqueries
View creation
CTE
Stored procedure
Transactions
Error handling
Comments and documentation
Execution Report

The execution report contains screenshots from SQL Server Management Studio (SSMS) demonstrating the successful execution of each project section.

Screenshots are clearly labelled according to their corresponding activity.

▶️ How to Run the Project
1. Clone the Repository

Clone this repository to your local machine using Git.

git clone <your-repository-url>

2. Open SQL Server Management Studio

Open SQL Server Management Studio (SSMS) and connect to your SQL Server instance.

3. Open the SQL Script

Open:

SuperMart_Capstone.sql

4. Execute the Script

Run the script in SSMS.

The script will:

Create the SuperMart_Db database
Create the required tables
Create primary and foreign keys
Insert sample data
Execute the required queries
Create the CustomerOrders view
Create the GetCustomerOrders stored procedure
Demonstrate transactions and error handling
5. Test the Stored Procedure

After the procedure has been created, execute:

USE SuperMart_Db;

EXEC GetCustomerOrders @CustomerID = 1;

🧪 Testing

The database and queries were tested using SQL Server Management Studio.

Testing includes:

Verifying that the database is created successfully
Confirming that all tables are created
Checking primary and foreign key relationships
Confirming that sample records are inserted
Testing customer and order queries
Testing all required joins
Testing aggregate functions
Testing the view
Testing the CTE
Executing the stored procedure
Testing transaction behaviour
Testing error handling
📸 Execution Evidence

The project includes an execution report containing screenshots of the SQL queries being successfully executed in SSMS.

Examples of documented sections include:

Part 1 – Database Creation
Part 2 – Data Population
Part 3 – Basic Data Retrieval
Part 4 – Filtering Data
Part 5 – SQL Joins
Part 6 – Sorting, Aggregation, Date and String Functions
Part 7 – Advanced Queries and Stored Procedures
Transactions and Error Handling
📚 Learning Outcomes Demonstrated

This capstone demonstrates practical knowledge of T-SQL, including both basic and advanced SQL concepts.

The project shows how SQL Server can be used to:

Design relational databases
Maintain data integrity
Manipulate data
Generate business reports
Analyse customer behaviour
Analyse sales activity
Create reusable database objects
Handle database errors
Safely manage database transactions
👨‍💻 Author

Manese Mohapi

Introduction to T-SQL Capstone Project

Completed

This project was developed as a practical demonstration of T-SQL database development skills using Microsoft SQL Server.
