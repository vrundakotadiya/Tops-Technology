create database MarketCo;

use MarketCo;

-- company table
create table Company(companyId int , companyName varchar(30),street varchar(45),city varchar(45),state varchar(10),Zip varchar(10));

-- contact table
create table contact(contactId int,companyId int, firstName varchar(45),lastName varchar(45),street varchar(45),city varchar(45),state varchar(40),
zip varchar(40),isMain boolean,email varchar(45),phone varchar(30));

-- Contact Employee table
create table contactEmployee(contactEmployeeId int ,contactId int, employeeId int, contactDate date,description varchar(150));

-- employee table
create table employee(employeeId int,firstName varchar(50),lastName varchar(40),salary decimal(10,2),hireDate date,
jobTitle varchar(25),email varchar(30),phone varchar(20));

INSERT INTO Company (CompanyID, CompanyName, State, City, Street, Zip)
VALUES
(1, 'Toll Brothers', 'PA', 'Philadelphia', '123 Market St', '19103'),
(2, 'Urban Outfitters, Inc.', 'PA', 'Philadelphia', '500 Walnut St', '19106');

INSERT INTO Contact (ContactID, CompanyID, FirstName, LastName, Street, City, State, Zip, IsMain, Email, Phone)
VALUES
(101, 1, 'Dianne', 'Connor', '45 Main St', 'Philadelphia', 'PA', '19103', TRUE, 'dianne.connor@toll.com', '215-555-1111'),
(102, 2, 'Jack', 'Lee', '60 Broad St', 'Philadelphia', 'PA', '19106', FALSE, 'jack.lee@urban.com', '215-555-2222');

INSERT INTO Employee (EmployeeID, FirstName, LastName, Salary, HireDate, JobTitle, Email, Phone)
VALUES
(201, 'Lesley', 'Bland', 60000.00, '2015-03-15', 'Sales Manager', 'lesley.bland@company.com', '215-555-1234'),
(202, 'John', 'Smith', 55000.00, '2016-06-10', 'Account Executive', 'john.smith@company.com', '215-555-5678'),
(203, 'Jack', 'Lee', 70000.00, '2014-07-22', 'Director', 'jack.lee@company.com', '215-555-2222');

INSERT INTO ContactEmployee (ContactEmployeeID, ContactID, EmployeeID, ContactDate, Description)
VALUES
(301, 101, 202, '2023-05-12', 'Dianne Connor contacted John Smith regarding project updates'),
(302, 101, 203, '2023-06-01', 'Dianne Connor met Jack Lee about new proposals'),
(303, 102, 201, '2023-07-18', 'Jack Lee discussed partnership with Lesley Bland');

SET SQL_SAFE_UPDATES = 0;


UPDATE Employee 
SET Phone = '215-555-8800' 
WHERE FirstName = 'Lesley' AND LastName = 'Bland';

UPDATE Company 
SET CompanyName = 'Urban Outfitters' 
WHERE CompanyName = 'Urban Outfitters, Inc.';

DELETE FROM ContactEmployee
WHERE ContactEmployeeID = 302;

SELECT DISTINCT E.FirstName, E.LastName
FROM Employee E
JOIN ContactEmployee CE ON E.EmployeeID = CE.EmployeeID
JOIN Contact C ON CE.ContactID = C.ContactID
JOIN Company Co ON C.CompanyID = Co.CompanyID
WHERE Co.CompanyName = 'Toll Brothers';


-- 8) What is the significance of “%” and “_” operators in the LIKE statement?
-- % (percent sign) → Matches zero or more characters.
	SELECT * FROM Employee WHERE FirstName LIKE 'J%';
-- _ (underscore) → Matches exactly one character.
	SELECT * FROM Employee WHERE FirstName LIKE 'J_n';
    
-- 9) Explain normalization in the context of databases.
-- Normalization is the process of structuring a database to minimize redundancy and improve data integrity.
-- 1NF (First Normal Form): Eliminate repeating groups, store atomic values only.
-- 2NF (Second Normal Form): No partial dependency (every non-key column depends on the whole primary key).
-- 3NF (Third Normal Form): Remove transitive dependencies (non-key attributes should not depend on other non-key attributes).
-- Benefits: Reduces duplicate data, ensures consistency, improves query performance.

-- 10) What does a join in MySQL mean?
-- A JOIN is used in MySQL to combine rows from two or more tables based on a related column (usually a foreign key).

-- 11) What do you understand about DDL, DCL, and DML in MySQL?

-- DDL (Data Definition Language): Defines database structure.
-- Commands: CREATE, ALTER, DROP, TRUNCATE.
-- DML (Data Manipulation Language): Manages data inside tables.
-- Commands: SELECT, INSERT, UPDATE, DELETE.
-- DCL (Data Control Language): Controls access and permissions.
-- Commands: GRANT, REVOKE.

-- 12) What is the role of the MySQL JOIN clause in a query, and what are some
-- common types of joins? 

-- Role: The JOIN clause retrieves data from multiple tables by matching related columns. It allows combining relational data into a single result set.
-- Common Types of Joins:
-- INNER JOIN: Returns rows with matching values in both tables.
-- LEFT JOIN (LEFT OUTER JOIN): Returns all rows from the left table + matching rows from the right.
-- RIGHT JOIN (RIGHT OUTER JOIN): Returns all rows from the right table + matching rows from the left.
-- FULL OUTER JOIN: Returns all rows when there is a match in either table (not directly supported in MySQL, but can be simulated with UNION).
-- CROSS JOIN: Returns Cartesian product (all combinations).

