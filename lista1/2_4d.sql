SELECT T.Name 'Region', COUNT(SP.TerritoryID) 'Liczba sprzedawc�w' 
	FROM Sales.SalesPerson SP JOIN Sales.SalesTerritory T ON T.TerritoryID=SP.TerritoryID
	GROUP BY T.Name;