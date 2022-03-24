SELECT * FROM (
SELECT "Klient", "Rok", MAX("Suma transakcji") "Suma transakcji", RANK() OVER(ORDER BY "Suma klienta" DESC) "Ranga"
FROM (
	SELECT P.FirstName + ' ' + P.LastName "Klient", YEAR(SOH.DueDate) "Rok",
		COUNT(SOH.SalesOrderID) OVER(PARTITION BY SOH.CustomerID, YEAR(SOH.DueDate)
			ORDER BY SOH.CustomerID, YEAR(SOH.DueDate) ROWS UNBOUNDED PRECEDING) "Suma transakcji",
		COUNT(SOH.SalesOrderID) OVER(PARTITION BY SOH.CustomerID) "Suma klienta"
	FROM Sales.SalesOrderHeader SOH
	JOIN Sales.Customer C ON C.CustomerID=SOH.CustomerID
	JOIN Person.Person P ON P.BusinessEntityID=C.PersonID) INSIDE
	GROUP BY "Klient", "Rok", "Suma klienta") OUTSIDE
	WHERE "Ranga" <= 10
	ORDER BY 4,1,2;