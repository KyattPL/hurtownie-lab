SELECT ST.CountryRegionCode 'Kod kraju', AVG(DATEDIFF(DAY, OrderDate, ShipDate)) 'Dni oczekiwania'
	FROM Sales.SalesOrderHeader SOH
	JOIN Sales.SalesTerritory ST ON ST.TerritoryID=SOH.TerritoryID
	GROUP BY ST.CountryRegionCode;