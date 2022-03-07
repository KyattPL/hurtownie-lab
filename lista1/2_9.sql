SELECT Month(SOH.OrderDate) 'Miesi¹c', AVG(SOH.SalesOrderID) 'Œrednia liczba sztuk'
	FROM Sales.SalesOrderHeader SOH
	GROUP BY Month(SOH.OrderDate) ORDER BY Month(SOH.OrderDate);