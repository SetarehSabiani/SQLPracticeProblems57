--Introductory Problems--


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
ORDER BY	BirthDate 
GO

--11

SELECT		FirstName, LastName, Title, CONVERT(varchar, BirthDate, 23) AS BirthDate
FROM		Employees
ORDER BY	BirthDate 
GO

--12

SELECT	FirstName, LastName, CONCAT(FirstName,' ',LastName) AS FullName
FROM	Employees
GO

--13

SELECT		OrderID, ProductID, UnitPrice,Quantity 
,			(Quantity * UnitPrice)	AS	TotalPrice	
FROM		[Order Details]
Order by	OrderID , ProductID
GO

--14

SELECT	COUNT(*) AS TotalCustumers
FROM	Customers
GO

--15

SELECT	MIN(OrderDate)
FROM	Orders
GO

--16

SELECT		Country
FROM		Customers
GROUP BY	Country
GO

--17

SELECT		ContactTitle
,			COUNT(*) AS TotalContactTitle
FROM		Customers
GROUP BY	ContactTitle
ORDER BY	COUNT(*) DESC
GO

--18

SELECT	Products.ProductID , Products.ProductName 
,		Suppliers.CompanyName AS SupplierCompany
FROM	Products
INNER JOIN 
		Suppliers
ON		Products.SupplierID = Suppliers.SupplierID
GO

--19

SELECT		OrderID, CONVERT(varchar, OrderDate, 23) as Date, CompanyName
FROM		Orders
INNER JOIN	
			Shippers
ON			Orders.ShipVia = Shippers.ShipperID
WHERE		OrderID < 10300
ORDER BY	OrderID 
GO

--Intermediate Problems--

--20

SELECT		CategoryName
,			COUNT(*) AS TotalProducts
FROM		Products
INNER JOIN	Categories
ON			Products.CategoryID = Categories.CategoryID
GROUP BY	CategoryName 
ORDER BY	TotalProducts DESC
GO

--21

SELECT		Country, City
,			COUNT(*) AS TotalCustomers
FROM		Customers
GROUP BY	Country, City
ORDER BY	TotalCustomers DESC
GO

--22

SELECT		ProductID, ProductName, UnitsInStock, ReorderLevel
FROM		Products
WHERE		UnitsInStock < ReorderLevel
ORDER BY	ProductID ASC
GO

--23

SELECT	ProductID, ProductName, UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued
FROM	Products
WHERE	(UnitsInStock + UnitsOnOrder) <= ReorderLevel
AND		Discontinued = 0
GO

--24

SELECT		CustomerID, CompanyName, Region
FROM		Customers
ORDER BY	IIF(Region IS NULL , 1 , 0)
,			Region
GO

--25

SELECT TOP 3 ShipCountry
,			 AVG(Freight) AS AverageFreight
FROM		 Orders
GROUP BY	 ShipCountry
ORDER BY	 AverageFreight DESC
GO

--26

SELECT TOP 3 ShipCountry, 
			 AVG(Freight) AS AverageFreight
FROM		 Orders
WHERE		 YEAR(OrderDate) = '2015'
GROUP BY	 ShipCountry
ORDER BY	 AverageFreight DESC
GO

--27

SELECT TOP 3 ShipCountry, AVG(Freight) AS AverageFreight
FROM		 Orders
WHERE		 OrderDate BETWEEN '1/1/2015' AND '01/01/2016'
GROUP BY	 ShipCountry
ORDER BY	 AverageFreight DESC
GO

--28

SELECT TOP 3 ShipCountry, AVG(Freight) AS AverageFreight
FROM		 Orders
WHERE		 OrderDate >= (YEAR((SELECT MAX(OrderDate) FROM Orders)-1))
GROUP BY	 ShipCountry
ORDER BY	 AverageFreight DESC
GO

--29

SELECT		Employees.EmployeeID, LastName, Orders.OrderID, ProductName, Quantity
FROM		Orders
INNER JOIN	[Order Details]
ON			[Order Details].OrderID = Orders.OrderID 
INNER JOIN	Employees
ON			Employees.EmployeeID = Orders.EmployeeID
INNER JOIN	Products
ON			Products.ProductID = [Order Details].ProductID
ORDER BY	Orders.OrderID, Products.ProductID 
GO

--30

SELECT		Customers.CustomerID, Orders.CustomerID
FROM		Customers
LEFT JOIN	Orders
ON			Customers.CustomerID = Orders.CustomerID
WHERE		Orders.CustomerID IS NULL
GO
