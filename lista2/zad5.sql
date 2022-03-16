SELECT CASE 
		WHEN MONTH(SOH.OrderDate)=1 THEN 'Stycze�'
		WHEN MONTH(SOH.OrderDate)=2 THEN 'Luty'
		WHEN MONTH(SOH.OrderDate)=3 THEN 'Marzec'
		WHEN MONTH(SOH.OrderDate)=4 THEN 'Kwiecie�'
		WHEN MONTH(SOH.OrderDate)=5 THEN 'Maj'
		WHEN MONTH(SOH.OrderDate)=6 THEN 'Czerwiec'
		WHEN MONTH(SOH.OrderDate)=7 THEN 'Lipiec'
		WHEN MONTH(SOH.OrderDate)=8 THEN 'Sierpie�'
		WHEN MONTH(SOH.OrderDate)=9 THEN 'Wrzesie�'
		WHEN MONTH(SOH.OrderDate)=10 THEN 'Pa�dziernik'
		WHEN MONTH(SOH.OrderDate)=11 THEN 'Listopad'
		WHEN MONTH(SOH.OrderDate)=12 THEN 'Grudzie�'
	END "Miesi�c", SUM(SOH.SubTotal) "Suma", 
	COUNT(DISTINCT SOD.ProductID) "Liczba r�nych produkt�w"
	FROM Sales.SalesOrderHeader SOH
	JOIN Sales.SalesOrderDetail SOD ON SOH.SalesOrderID=SOD.SalesOrderID
	GROUP BY MONTH(SOH.OrderDate) ORDER BY MONTH(SOH.OrderDate);