SELECT IN1.Kraj " ", [2012 Count] "2012 Klienci", [2012 Suma] "2012 Sztuki", [2013 Count] "2013 Klienci", [2013 Suma] "2013 Sztuki" FROM (
	SELECT [Kraj], [2012] [2012 Count], [2013] [2013 Count] FROM (
		SELECT DISTINCT DC.CountryRegionCode [Kraj], DT.Rok [Rok], DC.CustomerID [Klient]
			FROM Pynka.DIM_CUSTOMER DC
			JOIN Pynka.FACT_SALES FS ON FS.CustomerID=DC.CustomerID
			JOIN Pynka.DIM_TIME DT ON DT.PK_TIME=FS.OrderDate
			WHERE DT.Rok=2012 OR DT.Rok=2013) I
	PIVOT(COUNT([Klient]) FOR I.[Rok] IN ([2012], [2013])) PIV1) IN1
JOIN (
	SELECT [Kraj], [2012] [2012 Suma], [2013] [2013 Suma] FROM (
		SELECT DC.CountryRegionCode [Kraj], DT.Rok [Rok], FS.OrderQty [Sztuki]
			FROM Pynka.DIM_CUSTOMER DC
			JOIN Pynka.FACT_SALES FS ON FS.CustomerID=DC.CustomerID
			JOIN Pynka.DIM_TIME DT ON DT.PK_TIME=FS.OrderDate
			WHERE DT.Rok=2012 OR DT.Rok=2013) I
	PIVOT(SUM([Sztuki]) FOR I.[Rok] IN ([2012], [2013])) PIV2) IN2
ON IN1.Kraj=IN2.Kraj
ORDER BY 1;