SELECT DENSE_RANK() OVER(ORDER BY COUNT(SOD.OrderQty) DESC) "Ranga",
	P.FirstName + ' ' + P.LastName "Imiê i nazwisko", COUNT(SOD.OrderQty) "Liczba transakcji"
	FROM Sales.SalesOrderHeader SOH
	JOIN Sales.SalesOrderDetail SOD ON SOH.SalesOrderID=SOD.SalesOrderID
	JOIN Sales.Customer C ON C.CustomerID=SOH.CustomerID
	JOIN Person.Person P ON P.BusinessEntityID=C.PersonID
	GROUP BY P.FirstName + ' ' + P.LastName;