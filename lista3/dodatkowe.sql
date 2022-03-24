SELECT "Kolor", "Miesi¹c", "Dzieñ miesi¹ca", MAX("Liczba transakcji") "Liczba transakcji",
	MAX("narast") "Liczba transakcji narastaj¹co"
FROM (SELECT P.Color "Kolor", MONTH(SOH.OrderDate) "Miesi¹c", DAY(SOH.OrderDate) "Dzieñ miesi¹ca",
		COUNT(SOD.SalesOrderID) OVER(PARTITION BY P.Color, MONTH(SOH.OrderDate), DAY(SOH.OrderDate)) "Liczba transakcji",
		COUNT(SOD.SalesOrderID) OVER(PARTITION BY P.Color, MONTH(SOH.OrderDate) ORDER BY P.Color, MONTH(SOH.OrderDate), DAY(SOH.OrderDate) ROWS UNBOUNDED PRECEDING) "narast"
		FROM Sales.SalesOrderHeader SOH
		JOIN Sales.SalesOrderDetail SOD ON SOD.SalesOrderID=SOH.SalesOrderID
		JOIN Production.Product P ON P.ProductID=SOD.ProductID
		WHERE P.Color IS NOT NULL) INSIDE
GROUP BY "Kolor", "Miesi¹c", "Dzieñ miesi¹ca"
ORDER BY 1,2,3;