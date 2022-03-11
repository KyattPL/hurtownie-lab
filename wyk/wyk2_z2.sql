SELECT X.Miesi¹c, X.[1] '<45', X.[2] '45-60', X.[3] '>60' 
	FROM (SELECT DISTINCT SOH.CustomerID, DATENAME(MONTH, SOH.OrderDate) 'Miesi¹c',  
	(CASE WHEN DATEDIFF(YEAR, PD.BirthDate, SYSDATETIME()) < 45 THEN 1
		WHEN DATEDIFF(YEAR, PD.BirthDate, SYSDATETIME()) < 60 THEN 2
		ELSE 3 END) 'wiekGrupa'
		FROM Sales.SalesOrderHeader SOH
		JOIN Sales.Customer C ON C.CustomerID=SOH.CustomerID
		JOIN Person.Person P ON P.BusinessEntityID=C.PersonID
		JOIN Sales.vPersonDemographics PD ON PD.BusinessEntityID=P.BusinessEntityID) T
	PIVOT(COUNT(CustomerID) FOR T.wiekGrupa IN([1], [2], [3])) AS X
	ORDER BY CASE
		WHEN X.Miesi¹c='January' THEN 1
		WHEN X.Miesi¹c='February' THEN 2
		WHEN X.Miesi¹c='March' THEN 3
		WHEN X.Miesi¹c='April' THEN 4
		WHEN X.Miesi¹c='May' THEN 5
		WHEN X.Miesi¹c='June' THEN 6
		WHEN X.Miesi¹c='July' THEN 7
		WHEN X.Miesi¹c='August' THEN 8
		WHEN X.Miesi¹c='September' THEN 9
		WHEN X.Miesi¹c='October' THEN 10
		WHEN X.Miesi¹c='November' THEN 11
		WHEN X.Miesi¹c='December' THEN 12
	END;
