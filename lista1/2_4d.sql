SELECT T.Name 'Region', COUNT(SP.TerritoryID) 'Liczba sprzedawców' 
	FROM Sales.SalesPerson SP JOIN Sales.SalesTerritory T ON T.TerritoryID=SP.TerritoryID
	GROUP BY T.Name;