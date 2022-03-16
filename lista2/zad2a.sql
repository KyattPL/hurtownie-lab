SELECT * FROM (
	SELECT DISTINCT YEAR(OrderDate) "Rok", MONTH(OrderDate) "Miesiac", CustomerID "Rozni klienci"
		FROM Sales.SalesOrderHeader
	) S PIVOT(COUNT([Rozni klienci]) 
	FOR S.[Miesiac] IN ([1], [2], [3], [4], [5], [6], [7], [8], [9], [10], [11], [12])) X
	ORDER BY 1;