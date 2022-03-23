SELECT P.Name "Nazwa produktu", AVG(SOD.OrderQty) "Œrednia liczba sztuk", 
	CASE NTILE(3) OVER(ORDER BY AVG(SOD.OrderQty) DESC)
		WHEN 1 THEN 'Najlepiej'
		WHEN 2 THEN 'Œrednio'
		WHEN 3 THEN 'Najs³abiej'
	END "Ranga sprzeda¿y"
	FROM Sales.SalesOrderHeader SOH
	JOIN Sales.SalesOrderDetail SOD ON SOD.SalesOrderID=SOH.SalesOrderID
	JOIN Production.Product P ON P.ProductID=SOD.ProductID
	GROUP BY P.Name
	ORDER BY 2 DESC;