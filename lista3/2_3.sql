SELECT "Imi� i nazwisko", "Rok", "Miesi�c", "W miesi�cu", "W roku",
	MAX("W roku narastaj�co") "W roku narastaj�co" , 
	ISNULL(LAG("W miesi�cu") OVER (ORDER BY "Imi� i nazwisko", "Rok", "Miesi�c"), 0) + "W miesi�cu" "Obecny i poprzedni miesi�c"
	FROM (SELECT P.FirstName + ' ' + P.LastName "Imi� i nazwisko", 
		YEAR(SOH.OrderDate) "Rok", MONTH(SOH.OrderDate) "Miesi�c",
		COUNT(SOH.SalesOrderID) OVER (PARTITION BY SOH.SalesPersonID, YEAR(SOH.OrderDate), MONTH(SOH.OrderDate)) "W miesi�cu",
		COUNT(SOH.SalesOrderID) OVER (PARTITION BY SOH.SalesPersonID, YEAR(SOH.OrderDate)) "W roku",
		COUNT(SOH.SalesOrderID)
	OVER (PARTITION BY SOH.SalesPersonID, YEAR(SOH.OrderDate) ORDER BY SOH.SalesPersonID, YEAR(SOH.OrderDate) ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) "W roku narastaj�co"
	FROM Sales.SalesOrderHeader SOH JOIN Sales.SalesPerson SP ON SP.BusinessEntityID = SOH.SalesPersonID
	JOIN Person.Person P ON P.BusinessEntityID = SP.BusinessEntityID) INSIDE
GROUP BY "Imi� i nazwisko", "Rok", "Miesi�c", "W miesi�cu", "W roku"
ORDER BY 1,2,3;
