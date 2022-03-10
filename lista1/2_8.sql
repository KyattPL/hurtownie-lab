SELECT Name 'Produkt', ListPrice 'Cena' FROM Production.Product
	WHERE ListPrice > (SELECT AVG(ListPrice) FROM Production.Product);