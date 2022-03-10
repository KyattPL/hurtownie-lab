SELECT ST.CountryRegionCode 'Kod kraju', AVG(CAST(DATEDIFF(DAY, OrderDate, ShipDate) AS FLOAT)) 'Dni oczekiwania'
	FROM Sales.SalesOrderHeader SOH
	LEFT JOIN Sales.SalesTerritory ST ON ST.TerritoryID=SOH.TerritoryID
	GROUP BY ST.CountryRegionCode;