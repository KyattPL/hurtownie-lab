SELECT T.Name 'Region', COUNT(C.CustomerID) 'Liczba klient�w' 
	FROM Sales.Customer C LEFT JOIN Sales.SalesTerritory T ON T.TerritoryID=C.TerritoryID
	GROUP BY T.Name;