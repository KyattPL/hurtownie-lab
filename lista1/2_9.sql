SELECT Month(SOH.OrderDate) 'Miesi�c', AVG(SOH.SalesOrderID) '�rednia liczba sztuk'
	FROM Sales.SalesOrderHeader SOH
	GROUP BY Month(SOH.OrderDate) ORDER BY Month(SOH.OrderDate);