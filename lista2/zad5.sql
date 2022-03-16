SELECT CASE 
		WHEN MONTH(SOH.OrderDate)=1 THEN 'Styczeñ'
		WHEN MONTH(SOH.OrderDate)=2 THEN 'Luty'
		WHEN MONTH(SOH.OrderDate)=3 THEN 'Marzec'
		WHEN MONTH(SOH.OrderDate)=4 THEN 'Kwiecieñ'
		WHEN MONTH(SOH.OrderDate)=5 THEN 'Maj'
		WHEN MONTH(SOH.OrderDate)=6 THEN 'Czerwiec'
		WHEN MONTH(SOH.OrderDate)=7 THEN 'Lipiec'
		WHEN MONTH(SOH.OrderDate)=8 THEN 'Sierpieñ'
		WHEN MONTH(SOH.OrderDate)=9 THEN 'Wrzesieñ'
		WHEN MONTH(SOH.OrderDate)=10 THEN 'PaŸdziernik'
		WHEN MONTH(SOH.OrderDate)=11 THEN 'Listopad'
		WHEN MONTH(SOH.OrderDate)=12 THEN 'Grudzieñ'
	END "Miesi¹c", SUM(SOH.SubTotal) "Suma", 
	COUNT(DISTINCT SOD.ProductID) "Liczba ró¿nych produktów"
	FROM Sales.SalesOrderHeader SOH
	JOIN Sales.SalesOrderDetail SOD ON SOH.SalesOrderID=SOD.SalesOrderID
	GROUP BY MONTH(SOH.OrderDate) ORDER BY MONTH(SOH.OrderDate);