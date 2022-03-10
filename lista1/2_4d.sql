SELECT T.Name 'Region', COUNT(SP.BusinessEntityID) 'Liczba sprzedawców' 
	FROM Sales.SalesPerson SP LEFT JOIN Sales.SalesTerritory T ON T.TerritoryID=SP.TerritoryID
	GROUP BY T.Name;