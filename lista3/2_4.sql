SELECT "Kategoria", SUM("Kwota") "Suma maksymalnych" FROM (
SELECT DISTINCT PC.Name "Kategoria", MAX(P.ListPrice) OVER(PARTITION BY PSC.ProductSubcategoryID) "Kwota"
	FROM Production.ProductCategory PC
	JOIN Production.ProductSubcategory PSC ON PSC.ProductCategoryID=PC.ProductCategoryID
	JOIN Production.Product P ON P.ProductSubcategoryID=PSC.ProductSubcategoryID) INSIDE
	GROUP BY "Kategoria";