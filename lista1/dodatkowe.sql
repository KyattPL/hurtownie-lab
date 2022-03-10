SELECT ST.CountryRegionCode 'Region', DateDiff(YEAR, E.BirthDate, SYSDATETIME()) 'Wiek',
	SUM(LineTotal) 'Suma sprzedana' FROM Sales.SalesOrderDetail SOD
	JOIN Sales.SalesOrderHeader SOH ON SOD.SalesOrderID=SOH.SalesOrderID
	JOIN Sales.SalesTerritory ST ON ST.TerritoryID=SOH.TerritoryID
	JOIN Sales.SalesPerson SP ON SP.TerritoryID=ST.TerritoryID
	JOIN HumanResources.Employee E ON E.BusinessEntityID=SP.BusinessEntityID
	GROUP BY ST.CountryRegionCode, DateDiff(YEAR, E.BirthDate, SYSDATETIME())
	ORDER BY 3;