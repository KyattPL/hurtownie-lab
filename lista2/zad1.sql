SELECT SOH.SalesPersonID "pracID", SOD.ProductID "prodID", P.Name "Nazwa produktu", Year(SOH.OrderDate) "Rok",
	COUNT(SOD.OrderQty) "Liczba" FROM Sales.SalesOrderHeader SOH 
	JOIN Sales.SalesOrderDetail SOD ON SOH.SalesOrderID=SOD.SalesOrderID
	JOIN Production.Product P ON P.ProductID=SOD.ProductID
	GROUP BY SOH.SalesPersonID, SOD.ProductID, P.Name, Year(SOH.OrderDate);