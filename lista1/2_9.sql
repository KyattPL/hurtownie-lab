SELECT Month(SOH.OrderDate) 'Miesi¹c', CAST(CAST(SUM(SOD.OrderQty) AS FLOAT) / COUNT(DISTINCT YEAR(OrderDate)) AS DECIMAL(10,2)) 'Œrednia liczba sztuk'
	FROM Sales.SalesOrderHeader SOH JOIN Sales.SalesOrderDetail SOD ON SOD.SalesOrderID=SOH.SalesOrderID
	GROUP BY Month(SOH.OrderDate) ORDER BY 1;