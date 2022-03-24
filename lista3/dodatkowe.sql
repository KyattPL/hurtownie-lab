SELECT "Kolor", "Miesi�c", "Dzie� miesi�ca", MAX("Liczba transakcji") "Liczba transakcji",
	MAX("narast") "Liczba transakcji narastaj�co"
FROM (SELECT P.Color "Kolor", MONTH(SOH.OrderDate) "Miesi�c", DAY(SOH.OrderDate) "Dzie� miesi�ca",
		COUNT(SOD.SalesOrderID) OVER(PARTITION BY P.Color, MONTH(SOH.OrderDate), DAY(SOH.OrderDate)) "Liczba transakcji",
		COUNT(SOD.SalesOrderID) OVER(PARTITION BY P.Color, MONTH(SOH.OrderDate) ORDER BY P.Color, MONTH(SOH.OrderDate), DAY(SOH.OrderDate) ROWS UNBOUNDED PRECEDING) "narast"
		FROM Sales.SalesOrderHeader SOH
		JOIN Sales.SalesOrderDetail SOD ON SOD.SalesOrderID=SOH.SalesOrderID
		JOIN Production.Product P ON P.ProductID=SOD.ProductID
		WHERE P.Color IS NOT NULL) INSIDE
GROUP BY "Kolor", "Miesi�c", "Dzie� miesi�ca"
ORDER BY 1,2,3;