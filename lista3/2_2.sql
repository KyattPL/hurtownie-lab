SELECT P.FirstName + ' ' + P.LastName "Klient", YEAR(SOH.DueDate) "Rok",
		MAX(COUNT(SOH.SalesOrderID)) OVER(PARTITION BY SOH.CustomerID, YEAR(SOH.DueDate)
			ORDER BY SOH.CustomerID, YEAR(SOH.DueDate) ROWS UNBOUNDED PRECEDING) "Suma transakcji"
	FROM Sales.SalesOrderHeader SOH
	JOIN Sales.Customer C ON C.CustomerID=SOH.CustomerID
	JOIN Person.Person P ON P.BusinessEntityID=C.PersonID
	GROUP BY P.FirstName + ' ' + P.LastName, YEAR(SOH.DueDate), SOH.CustomerID
	ORDER BY 1,2;