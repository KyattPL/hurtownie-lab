SELECT * FROM (
	SELECT DP.CategoryName " ", DP.SubCategoryName "`", FS.OrderQty [Sztuki], DC.CountryRegionCode [Kraj]
		FROM Pynka.FACT_SALES FS
		JOIN Pynka.DIM_CUSTOMER DC ON DC.CustomerID=FS.CustomerID
		JOIN Pynka.DIM_PRODUCT DP ON DP.ProductID=FS.ProductID) I
PIVOT(SUM([Sztuki]) FOR I.[Kraj] IN ([AU], [CA], [DE], [FR], [GB], [US])) X
ORDER BY 1,2;