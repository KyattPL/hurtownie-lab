SELECT *
	FROM (SELECT TotalDue, Year(OrderDate) 'rok', DATENAME(WEEKDAY, OrderDate) 'Dzieñ tygodnia'
		FROM Sales.SalesOrderHeader) S
	PIVOT(SUM(TotalDue) FOR S.rok IN ([2011], [2012], [2013], [2014])) AS X
	ORDER BY CASE
		WHEN X.[Dzieñ tygodnia]='Sunday' THEN 7
		WHEN X.[Dzieñ tygodnia]='Monday' THEN 1
		WHEN X.[Dzieñ tygodnia]='Tuesday' THEN 2
		WHEN X.[Dzieñ tygodnia]='Wednesday' THEN 3
		WHEN X.[Dzieñ tygodnia]='Thursday'THEN 4
		WHEN X.[Dzieñ tygodnia]='Friday' THEN 5
		WHEN X.[Dzieñ tygodnia]='Saturday' THEN 6
	END;
