SELECT * FROM (
	SELECT DP.CategoryName " ", DP.SubCategoryName "`", FS.OrderQty [Sztuki], DC.CountryRegionCode [Kraj]
		FROM Pynka.FACT_SALES FS
		JOIN Pynka.DIM_CUSTOMER DC ON DC.CustomerID=FS.CustomerID
		JOIN Pynka.DIM_PRODUCT DP ON DP.ProductID=FS.ProductID) I
PIVOT(SUM([Sztuki]) FOR I.[Kraj] IN ([AU], [CA], [DE], [FR], [GB], [US])) X
WHERE (SELECT COUNT(DISTINCT FS.ProductID) FROM Pynka.FACT_SALES FS
	JOIN Pynka.DIM_PRODUCT DP ON DP.ProductID=FS.ProductID
	WHERE DP.CategoryName=X.[ ] AND DP.SubCategoryName=X.[`]) >= 10
ORDER BY 1, ISNULL([AU], 0) + ISNULL([CA], 0) + ISNULL([DE], 0) + 
	ISNULL([FR], 0) + ISNULL([GB], 0) + ISNULL([US], 0) DESC;