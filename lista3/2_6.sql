SELECT P.Name "Nazwa produktu", AVG(SOD.OrderQty) "�rednia liczba sztuk", 
	CASE NTILE(3) OVER(ORDER BY AVG(SOD.OrderQty) DESC)
		WHEN 1 THEN 'Najlepiej'
		WHEN 2 THEN '�rednio'
		WHEN 3 THEN 'Najs�abiej'
	END "Ranga sprzeda�y"
	FROM Sales.SalesOrderHeader SOH
	JOIN Sales.SalesOrderDetail SOD ON SOD.SalesOrderID=SOH.SalesOrderID
	JOIN Production.Product P ON P.ProductID=SOD.ProductID
	GROUP BY P.Name
	ORDER BY 2 DESC;