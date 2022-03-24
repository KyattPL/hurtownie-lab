SELECT ISNULL("Name", '') "Name", ISNULL("Rok", '') "Rok", ISNULL("Procent", 100) "Procent" FROM (
SELECT PC.Name, STR(YEAR(SOH.OrderDate)) "Rok", 
		SUM(SOD.UnitPrice * SOD.OrderQty * (1 - SOD.UnitPriceDiscount)) OVER (PARTITION BY YEAR(SOH.OrderDate))
			/ SUM(SOD.UnitPrice * SOD.OrderQty * (1 - SOD.UnitPriceDiscount)) OVER()*100 "Procent"
	FROM Sales.SalesOrderHeader SOH
	JOIN Sales.SalesOrderDetail SOD ON SOH.SalesOrderID=SOD.SalesOrderID
	JOIN Production.Product P ON P.ProductID=SOD.ProductID
	JOIN Production.ProductSubcategory PSC ON P.ProductSubcategoryID=PSC.ProductSubcategoryID
	JOIN Production.ProductCategory PC ON PC.ProductCategoryID=PSC.ProductCategoryID
	WHERE PC.Name='Accessories') INSIDE
GROUP BY GROUPING SETS (
	("Name", "Rok", "Procent"),
	()
);