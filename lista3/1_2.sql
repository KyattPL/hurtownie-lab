SELECT PC.Name "Kategoria", P.Name "Produkt", ISNULL(STR(YEAR(SOH.DueDate)), '') "Rok",
	SUM(SOD.UnitPrice * SOD.UnitPriceDiscount * SOD.OrderQty) "Kwota"
	FROM Sales.SalesOrderHeader SOH
	JOIN Sales.SalesOrderDetail SOD ON SOH.SalesOrderID=SOD.SalesOrderID
	JOIN Production.Product P ON P.ProductID=SOD.ProductID
	JOIN Production.ProductSubcategory PSC ON PSC.ProductSubcategoryID=P.ProductSubcategoryID
	JOIN Production.ProductCategory PC ON PC.ProductCategoryID=PSC.ProductCategoryID
	GROUP BY GROUPING SETS (
		(PC.Name, P.Name, YEAR(SOH.DueDate)),
		(PC.Name, P.Name)
	) ORDER BY 1, 2;