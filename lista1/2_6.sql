SELECT PC.Name, PSC.Name, MIN(P.Name) FROM
	(SELECT ProductID FROM Production.Product
	EXCEPT SELECT ProductID FROM Sales.SalesOrderDetail) PID
LEFT JOIN Production.Product P ON P.ProductID=PID.ProductID
LEFT JOIN Production.ProductSubcategory PSC ON PSC.ProductSubcategoryID=P.ProductSubcategoryID
LEFT JOIN Production.ProductCategory PC ON PC.ProductCategoryID=PSC.ProductCategoryID
GROUP BY PC.Name, PSC.Name;