SELECT YEAR(DueDate) 'Rok', COUNT(SalesOrderID) 'Liczba transakcji' FROM Sales.SalesOrderHeader
GROUP BY YEAR(DueDate) ORDER BY 1;