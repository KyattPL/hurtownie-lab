SELECT DISTINCT DC.CountryRegionCode " ", COUNT(DC.CustomerID) "Customer ID Distinct Count"
	FROM Pynka.DIM_CUSTOMER DC
	GROUP BY DC.CountryRegionCode
	ORDER BY 1;