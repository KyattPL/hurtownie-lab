SELECT PSC.Name 'Produkt',
MIN(SO.DiscountPct * P.ListPrice) 'Najmniejsza obnizka',
MAX(SO.DiscountPct * P.ListPrice) 'Najwieksza obnizka'
FROM Production.Product P 
	JOIN Production.ProductSubcategory PSC ON PSC.ProductSubcategoryID=P.ProductSubcategoryID
	JOIN Sales.SpecialOfferProduct SOP ON SOP.ProductID=P.ProductID
	JOIN Sales.SpecialOffer SO ON SO.SpecialOfferID=SOP.SpecialOfferID
WHERE SO.DiscountPct > 0
GROUP BY PSC.Name;

/* Zak³adam, ¿e obni¿kê 0% pomijamy */