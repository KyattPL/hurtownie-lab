SELECT X.Miesi�c, X.[1] '<45', X.[2] '45-60', X.[3] '>60' 
	FROM (SELECT DISTINCT SOH.CustomerID, DATENAME(MONTH, SOH.OrderDate) 'Miesi�c',  
	(CASE WHEN DATEDIFF(YEAR, PD.BirthDate, SYSDATETIME()) < 45 THEN 1
		WHEN DATEDIFF(YEAR, PD.BirthDate, SYSDATETIME()) < 60 THEN 2
		ELSE 3 END) 'wiekGrupa'
		FROM Sales.SalesOrderHeader SOH
		JOIN Sales.Customer C ON C.CustomerID=SOH.CustomerID
		JOIN Person.Person P ON P.BusinessEntityID=C.PersonID
		JOIN Sales.vPersonDemographics PD ON PD.BusinessEntityID=P.BusinessEntityID) T
	PIVOT(COUNT(CustomerID) FOR T.wiekGrupa IN([1], [2], [3])) AS X
	ORDER BY CASE
		WHEN X.Miesi�c='January' THEN 1
		WHEN X.Miesi�c='February' THEN 2
		WHEN X.Miesi�c='March' THEN 3
		WHEN X.Miesi�c='April' THEN 4
		WHEN X.Miesi�c='May' THEN 5
		WHEN X.Miesi�c='June' THEN 6
		WHEN X.Miesi�c='July' THEN 7
		WHEN X.Miesi�c='August' THEN 8
		WHEN X.Miesi�c='September' THEN 9
		WHEN X.Miesi�c='October' THEN 10
		WHEN X.Miesi�c='November' THEN 11
		WHEN X.Miesi�c='December' THEN 12
	END;
