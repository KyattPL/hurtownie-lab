SELECT * FROM (
SELECT PER.FirstName "Imie", PER.LastName "Nazwisko", COUNT(DISTINCT SOH.SalesOrderID) "Liczba", 
	SUM(DISTINCT SOH.TotalDue) "Kwota", CASE
		WHEN (SELECT TOP 1 COUNT(DISTINCT SOH_2.SalesOrderID)
				FROM Sales.Customer C_2
				JOIN Sales.SalesOrderHeader SOH_2 ON SOH_2.CustomerID=C_2.CustomerID
				WHERE C_2.CustomerID=C.CustomerID
				GROUP BY YEAR(SOH_2.DueDate)
				ORDER BY COUNT(DISTINCT SOH_2.SalesOrderID)
			) >= 2 AND (SELECT COUNT(*) FROM (SELECT COUNT(DISTINCT SOH_2.SalesOrderID) "test123"
				FROM Sales.Customer C_2
				JOIN Sales.SalesOrderHeader SOH_2 ON SOH_2.CustomerID=C_2.CustomerID
				WHERE C_2.CustomerID=C.CustomerID
				GROUP BY YEAR(SOH_2.DueDate)) something)=4
			AND (SELECT TOP 1 COUNT(DISTINCT SOH_2.SalesOrderID) FROM Sales.SalesOrderHeader SOH_2
					WHERE SOH_2.CustomerID=C.CustomerID AND
						SOH_2.TotalDue > 1.5 * (SELECT AVG(SOH_3.TotalDue) FROM Sales.SalesOrderHeader SOH_3)
					GROUP BY YEAR(SOH_2.DueDate) ORDER BY 1) >=	 2
			THEN 'Platynowa'
		WHEN (SELECT COUNT(DISTINCT SOH_2.SalesOrderID) FROM Sales.SalesOrderHeader SOH_2
					WHERE SOH_2.CustomerID=C.CustomerID AND SOH_2.TotalDue > 1.5 *	
						(SELECT AVG(SOH_3.TotalDue) FROM Sales.SalesOrderHeader SOH_3)) >= 2
			THEN 'Z³ota'
		WHEN COUNT(DISTINCT SOH.SalesOrderID) >= 5 THEN 'Srebrna'
	END "Karta" FROM Sales.Customer C
	JOIN Sales.SalesOrderHeader SOH ON SOH.CustomerID=C.CustomerID
	JOIN Person.Person PER ON PER.BusinessEntityID=C.PersonID
	JOIN Sales.SalesOrderDetail SOD ON SOD.SalesOrderID=SOH.SalesOrderID
	GROUP BY PER.FirstName, PER.LastName, C.CustomerID) MAIN 
	WHERE Karta IS NOT NULL
	ORDER BY 2, 1;

/*
SELECT * FROM Person.Person WHERE LastName='Adams'; /* 293 */
SELECT * FROM Sales.Customer WHERE PersonID=301; /* 29845 */

SELECT YEAR(SOH.DueDate), SUM(CASE WHEN SOH.CustomerID=29489 THEN 1 ELSE 0 END)
				FROM Sales.SalesOrderHeader SOH
				GROUP BY YEAR(SOH.DueDate)
				ORDER BY 1;

SELECT * FROM Sales.SalesOrderHeader WHERE CustomerID=29845;
/*
SELECT TOP 1 COUNT(TotalDue) FROM Sales.SalesOrderHeader
	WHERE TotalDue > 1.5 * (SELECT AVG(SOH.TotalDue) FROM Sales.SalesOrderHeader SOH)
	GROUP BY YEAR(DueDate)
	ORDER BY 1; */

/*
SELECT COUNT(SOH_2.SalesOrderID) FROM Sales.SalesOrderHeader SOH_2
			JOIN Sales.Customer C2 ON C2.CustomerID=SOH_2.CustomerID
			JOIN Person.Person PER2 ON PER2.BusinessEntityID=C2.PersonID
			WHERE SOH_2.TotalDue > 1.5*(SELECT AVG(TotalDue) FROM Sales.SalesOrderHeader)
				AND SOH_2.CustomerID=234
			GROUP BY PER2.BusinessEntityID; */ */