SELECT * FROM
	(SELECT PC.Name, ST.CountryRegionCode, P.ProductID FROM Sales.SalesOrderDetail SOD
	JOIN Production.Product P ON P.ProductID=SOD.ProductID
	JOIN Production.ProductSubcategory PSC ON PSC.ProductSubcategoryID=P.ProductSubcategoryID
	JOIN Production.ProductCategory PC ON PC.ProductCategoryID=PSC.ProductCategoryID
	JOIN Sales.SalesOrderHeader SOH ON SOH.SalesOrderID=SOD.SalesOrderID
	JOIN Sales.SalesTerritory ST ON ST.TerritoryID=SOH.TerritoryID) Z
	PIVOT(COUNT(ProductID) FOR Name IN([Accessories], [Bikes], [Clothing], [Components])) AS X;