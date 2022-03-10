SELECT PSC.Name 'Podkategoria',
MIN(SOD.UnitPriceDiscount * SOD.OrderQty * SOD.UnitPrice) 'Najmniejsza obnizka',
MAX(SOD.UnitPriceDiscount * SOD.OrderQty * SOD.UnitPrice) 'Najwieksza obnizka'
FROM Production.Product P 
	LEFT JOIN Production.ProductSubcategory PSC ON PSC.ProductSubcategoryID=P.ProductSubcategoryID
	LEFT JOIN Sales.SalesOrderDetail SOD ON SOD.ProductID=P.ProductID
WHERE SOD.UnitPriceDiscount > 0
GROUP BY PSC.Name;

/* Zak³adam, ¿e obni¿kê 0% pomijamy */