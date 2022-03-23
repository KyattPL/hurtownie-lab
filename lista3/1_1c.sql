SELECT ISNULL(P.FirstName + ' ' + P.LastName, '') "Klient", ISNULL(STR(YEAR(SOH.DueDate)), '') "Rok",
	SUM(SOH.TotalDue) "Kwota"
	FROM Sales.SalesOrderHeader SOH
	JOIN Sales.Customer C ON C.CustomerID=SOH.CustomerID
	JOIN Person.Person P ON P.BusinessEntityID=C.PersonID
	GROUP BY ROLLUP (YEAR(SOH.DueDate), P.FirstName + ' ' + P.LastName)
	ORDER BY 1;