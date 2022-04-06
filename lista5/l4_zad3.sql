INSERT INTO Pynka.DIM_CUSTOMER
SELECT DISTINCT C.CustomerID, P.FirstName, P.LastName, P.Title, MIN(A.City), MIN(ST.Name), MIN(ST.CountryRegionCode), MIN(ST.[Group])
	FROM Sales.Customer C
	JOIN Person.Person P ON P.BusinessEntityID=C.PersonID
	LEFT JOIN Person.BusinessEntityAddress BEA ON BEA.BusinessEntityID=P.BusinessEntityID
	LEFT JOIN Person.Address A ON A.AddressID=BEA.AddressID
	LEFT JOIN Sales.SalesTerritory ST ON ST.TerritoryID=C.TerritoryID
	GROUP BY C.CustomerID, P.FirstName, P.LastName, P.Title;

INSERT INTO Pynka.DIM_PRODUCT
SELECT DISTINCT P.ProductID, P.Name, P.ListPrice, P.Color, PSC.Name, PC.Name, P.Weight, P.Size,
	CASE
		WHEN (SELECT COUNT(*) FROM Sales.SalesOrderDetail SOD WHERE SOD.ProductID=P.ProductID) > 0 THEN 1 ELSE 0
	END "IsPurchased"
	FROM Production.Product P
	LEFT JOIN Production.ProductSubcategory PSC ON PSC.ProductSubcategoryID=P.ProductSubcategoryID
	LEFT JOIN Production.ProductCategory PC ON PC.ProductCategoryID=PSC.ProductCategoryID
	WHERE (SELECT COUNT(*) FROM Sales.SalesOrderDetail SOD WHERE SOD.ProductID=P.ProductID) > 0;

INSERT INTO Pynka.DIM_SALESPERSON
SELECT DISTINCT SP.BusinessEntityID, P.FirstName, P.LastName, P.Title, E.Gender, ST.CountryRegionCode, ST.[Group]
	FROM Sales.SalesPerson SP
	LEFT JOIN Person.Person P ON P.BusinessEntityID=SP.BusinessEntityID
	LEFT JOIN HumanResources.Employee E ON E.BusinessEntityID=SP.BusinessEntityID
	LEFT JOIN Sales.SalesTerritory ST ON ST.TerritoryID=SP.TerritoryID;

INSERT INTO Pynka.FACT_SALES
SELECT SOD.ProductID, SOH.CustomerID, SOH.SalesPersonID,
	CAST(FORMAT(SOH.OrderDate, 'yyyy') + FORMAT(SOH.OrderDate, 'MM') + FORMAT(SOH.OrderDate, 'dd') AS INT), 
	CAST(FORMAT(SOH.ShipDate, 'yyyy') + FORMAT(SOH.ShipDate, 'MM') + FORMAT(SOH.ShipDate, 'dd') AS INT),
	SOD.OrderQty, SOD.UnitPrice, SOD.UnitPriceDiscount, SOD.LineTotal
	FROM Sales.SalesOrderHeader SOH
	LEFT JOIN Sales.SalesOrderDetail SOD ON SOD.SalesOrderID=SOH.SalesOrderID;