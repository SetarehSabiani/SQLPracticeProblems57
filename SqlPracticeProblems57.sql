
--1

SELECT	*
FROM	Shippers
GO

--2

SELECT	CategoryName, [Description]
FROM	Categories
GO

--3

SELECT	FirstName, LastName, HireDate
FROM	Employees
WHERE	Title = 'Sales Representative'
GO

--4

SELECT	LastName, FirstName, HireDate
FROM	Employees
WHERE	Title = 'Sales Representative' 
AND		Country = 'USA'
GO

--5

SELECT	OrderID, OrderDate
FROM	Orders
WHERE	EmployeeID = 5
GO

--6

SELECT	SupplierID, ContactName,ContactTitle
FROM	Suppliers
WHERE	ContactTitle != 'Marketing Manager'
GO

--7

SELECT	ProductID , ProductName
FROM	Products
WHERE	ProductName LIKE '%queso%'


--8

SELECT	OrderID , CustomerID , ShipCountry
FROM	Orders
WHERE	ShipCountry = 'France'
OR		ShipCountry = 'Belgium'
GO

--9

SELECT	OrderID, CustomerID, OrderDate, ShipCountry
FROM	Orders
WHERE	ShipCountry IN('Brazil','Mexico','Argentina','Venezuela')
GO

--10

SELECT		FirstName, LastName, Title, BirthDate
FROM		Employees
ORDER BY	BirthDate ASC
GO

--11

SELECT		FirstName, LastName, Title, CONVERT(varchar, BirthDate, 23) AS BirthDate
FROM		Employees
ORDER BY	BirthDate ASC
GO

--12

SELECT	FirstName, LastName, CONCAT(FirstName,' ',LastName) AS FullName
FROM	Employees
GO

--13

