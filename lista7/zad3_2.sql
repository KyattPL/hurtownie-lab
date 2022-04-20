SELECT * FROM
	(SELECT DISTINCT DC.CountryRegionCode " ", DT.Rok [Rok], DC.CustomerID [Klient]
		FROM Pynka.DIM_CUSTOMER DC
		JOIN Pynka.FACT_SALES FS ON FS.CustomerID=DC.CustomerID
		JOIN Pynka.DIM_TIME DT ON DT.PK_TIME=FS.OrderDate
		WHERE DT.Rok=2012 OR DT.Rok=2013) I
	PIVOT(COUNT([Klient]) FOR I.[Rok] IN ([2012], [2013])) X
	ORDER BY 1;