SELECT SOD.SalesOrderID, SOH.Status, COUNT(SOD.SalesOrderID) FROM Sales.SalesOrderDetail SOD 
	JOIN Sales.SalesOrderHeader SOH ON SOD.SalesOrderID=SOH.SalesOrderID
	GROUP BY SOD.SalesOrderID, SOH.Status HAVING COUNT(SOD.SalesOrderID)>10;

WITH detale AS (
	SELECT SalesOrderID, COUNT(SalesOrderID) 'sprzedanych' FROM Sales.SalesOrderDetail
	GROUP BY SalesOrderID HAVING COUNT(SalesOrderID)>10
) SELECT D.SalesOrderID, SOH.Status, D.sprzedanych FROM detale D
	JOIN Sales.SalesOrderHeader SOH ON D.SalesOrderID=SOH.SalesOrderID;