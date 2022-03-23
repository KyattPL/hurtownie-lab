SELECT "Imiê i nazwisko", "Rok", "Miesi¹c", "W miesi¹cu", "W roku",
	MAX("W roku narastaj¹co") "W roku narastaj¹co" , 
	ISNULL(LAG("W miesi¹cu") OVER (ORDER BY "Imiê i nazwisko", "Rok", "Miesi¹c"), 0) + "W miesi¹cu" "Obecny i poprzedni miesi¹c"
	FROM (SELECT P.FirstName + ' ' + P.LastName "Imiê i nazwisko", 
		YEAR(SOH.OrderDate) "Rok", MONTH(SOH.OrderDate) "Miesi¹c",
		COUNT(SOH.SalesOrderID) OVER (PARTITION BY SOH.SalesPersonID, YEAR(SOH.OrderDate), MONTH(SOH.OrderDate)) "W miesi¹cu",
		COUNT(SOH.SalesOrderID) OVER (PARTITION BY SOH.SalesPersonID, YEAR(SOH.OrderDate)) "W roku",
		COUNT(SOH.SalesOrderID)
	OVER (PARTITION BY SOH.SalesPersonID, YEAR(SOH.OrderDate) ORDER BY SOH.SalesPersonID, YEAR(SOH.OrderDate) ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) "W roku narastaj¹co"
	FROM Sales.SalesOrderHeader SOH JOIN Sales.SalesPerson SP ON SP.BusinessEntityID = SOH.SalesPersonID
	JOIN Person.Person P ON P.BusinessEntityID = SP.BusinessEntityID) INSIDE
GROUP BY "Imiê i nazwisko", "Rok", "Miesi¹c", "W miesi¹cu", "W roku"
ORDER BY 1,2,3;
