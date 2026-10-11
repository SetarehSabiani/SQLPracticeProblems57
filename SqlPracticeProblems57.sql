
--1

SELECT *
FROM Shippers
GO

--2

SELECT CategoryName, [Description]
FROM Categories
GO

--3

SELECT FirstName, LastName, HireDate
FROM Employees
WHERE Title = 'Sales Representative'
GO

--4

SELECT LastName, FirstName, HireDate
FROM Employees
WHERE Title = 'Sales Representative' 
AND   Country = 'USA'
GO

--5

