SELECT * FROM (
	SELECT Per.FirstName + ' ' + Per.LastName "Imie i nazwisko", YEAR(SOH.OrderDate) "Rok", SOH.SalesOrderID
		FROM Sales.SalesOrderHeader SOH
		JOIN Sales.SalesPerson SP ON SOH.SalesPersonID=SP.BusinessEntityID
		JOIN Person.Person Per ON Per.BusinessEntityID=SP.BusinessEntityID
	) S PIVOT(COUNT(SalesOrderID) FOR S.Rok IN ([2011], [2012], [2013], [2014])) X;