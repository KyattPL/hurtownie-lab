SELECT * FROM (
	SELECT SOH.SalesPersonID "pracID", SOD.ProductID "prodID", P.Name "Nazwa produktu", Year(SOH.OrderDate) "Rok",
		SOD.OrderQty "Liczba" FROM Sales.SalesOrderHeader SOH 
		JOIN Sales.SalesOrderDetail SOD ON SOH.SalesOrderID=SOD.SalesOrderID
		JOIN Production.Product P ON P.ProductID=SOD.ProductID) S
	PIVOT(COUNT(Liczba) FOR S.Rok IN ([2011], [2012], [2013], [2014])) AS X;