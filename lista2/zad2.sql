SELECT YEAR(SOH.OrderDate) "Rok", MONTH(SOH.OrderDate) "Miesiac", COUNT(DISTINCT SOH.CustomerID) "Rozni klienci"
	FROM Sales.SalesOrderHeader SOH
	GROUP BY YEAR(SOH.OrderDate), MONTH(SOH.OrderDate)
	ORDER BY 1, 2;