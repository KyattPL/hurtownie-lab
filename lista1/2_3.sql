SELECT Year(DueDate) 'Rok' , SUM(TotalDue) 'Roczna kwota transakcji'
	FROM Sales.SalesOrderHeader GROUP BY Year(DueDate);