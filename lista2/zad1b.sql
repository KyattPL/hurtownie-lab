SELECT * FROM (
SELECT SOH.SalesPersonID "pracID", Year(SOH.OrderDate) "Rok", P.ProductID "NrProd",
	SOD.OrderQty FROM Sales.SalesOrderHeader SOH 
	JOIN Sales.SalesOrderDetail SOD ON SOH.SalesOrderID=SOD.SalesOrderID
	JOIN Production.Product P ON P.ProductID=SOD.ProductID
	WHERE P.ProductID IN (SELECT ProductID FROM (SELECT DISTINCT TOP 5 SOD.ProductID, MAX(SOD.OrderQty) "Liczba"
		FROM Sales.SalesOrderDetail SOD
		GROUP BY SOD.ProductID
		ORDER BY 2 DESC) AS Subquery)) S
	PIVOT(COUNT(OrderQty) FOR S.NrProd IN ([863], [869], [867], [864], [709])) X
	ORDER BY 2;

/* SELECT DISTINCT TOP 5 SOD.ProductID, MAX(SOD.OrderQty) FROM Sales.SalesOrderDetail SOD
	GROUP BY SOD.ProductID ORDER BY 2 DESC; */