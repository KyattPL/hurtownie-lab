SELECT YEAR(SOH.OrderDate) "Rok", MONTH(SOH.OrderDate) "Miesi¹c", DAY(SOH.OrderDate) "Dzieñ",
	SUM(SOH.TotalDue) "Suma", COUNT(DISTINCT SOD.ProductID) "Liczba ró¿nych produktów"
	FROM Sales.SalesOrderHeader SOH
	JOIN Sales.SalesOrderDetail SOD ON SOH.SalesOrderID=SOD.SalesOrderID
	GROUP BY YEAR(SOH.OrderDate), MONTH(SOH.OrderDate), DAY(SOH.OrderDate)
	ORDER BY 1, 2, 3;