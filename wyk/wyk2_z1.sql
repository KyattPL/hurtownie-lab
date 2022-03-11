SELECT *
	FROM (SELECT TotalDue, Year(OrderDate) 'rok', DATENAME(WEEKDAY, OrderDate) 'Dzie� tygodnia'
		FROM Sales.SalesOrderHeader) S
	PIVOT(SUM(TotalDue) FOR S.rok IN ([2011], [2012], [2013], [2014])) AS X
	ORDER BY CASE
		WHEN X.[Dzie� tygodnia]='Sunday' THEN 7
		WHEN X.[Dzie� tygodnia]='Monday' THEN 1
		WHEN X.[Dzie� tygodnia]='Tuesday' THEN 2
		WHEN X.[Dzie� tygodnia]='Wednesday' THEN 3
		WHEN X.[Dzie� tygodnia]='Thursday'THEN 4
		WHEN X.[Dzie� tygodnia]='Friday' THEN 5
		WHEN X.[Dzie� tygodnia]='Saturday' THEN 6
	END;
