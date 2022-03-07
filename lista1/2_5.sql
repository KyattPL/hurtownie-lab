SELECT T.rok 'Rok', COUNT(TransactionID) 'Liczba transakcji' FROM
	(SELECT Year(TransactionDate) rok, TransactionID FROM Production.TransactionHistory
	UNION SELECT Year(TransactionDate), TransactionID FROM Production.TransactionHistoryArchive) T
GROUP BY T.rok;