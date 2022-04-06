INSERT INTO Pynka.DIM_CUSTOMER
SELECT DISTINCT C.CustomerID, P.FirstName, P.LastName, P.Title, MIN(A.City), MIN(ST.Name), MIN(ST.CountryRegionCode), MIN(ST.[Group])
	FROM Sales.Customer C
	JOIN Person.Person P ON P.BusinessEntityID=C.PersonID
	LEFT JOIN Person.BusinessEntityAddress BEA ON BEA.BusinessEntityID=P.BusinessEntityID
	LEFT JOIN Person.Address A ON A.AddressID=BEA.AddressID
	LEFT JOIN Sales.SalesTerritory ST ON ST.TerritoryID=C.TerritoryID
	GROUP BY C.CustomerID, P.FirstName, P.LastName, P.Title;

INSERT INTO Pynka.DIM_PRODUCT
SELECT DISTINCT P.ProductID, P.Name, P.ListPrice, P.Color, PSC.Name, PC.Name, P.Weight, P.Size,
	CASE
		WHEN (SELECT COUNT(*) FROM Sales.SalesOrderDetail SOD WHERE SOD.ProductID=P.ProductID) > 0 THEN 1 ELSE 0
	END "IsPurchased"
	FROM Production.Product P
	LEFT JOIN Production.ProductSubcategory PSC ON PSC.ProductSubcategoryID=P.ProductSubcategoryID
	LEFT JOIN Production.ProductCategory PC ON PC.ProductCategoryID=PSC.ProductCategoryID
	WHERE (SELECT COUNT(*) FROM Sales.SalesOrderDetail SOD WHERE SOD.ProductID=P.ProductID) > 0;

INSERT INTO Pynka.DIM_SALESPERSON
SELECT DISTINCT SP.BusinessEntityID, P.FirstName, P.LastName, P.Title, E.Gender, ST.CountryRegionCode, ST.[Group]
	FROM Sales.SalesPerson SP
	LEFT JOIN Person.Person P ON P.BusinessEntityID=SP.BusinessEntityID
	LEFT JOIN HumanResources.Employee E ON E.BusinessEntityID=SP.BusinessEntityID
	LEFT JOIN Sales.SalesTerritory ST ON ST.TerritoryID=SP.TerritoryID;

INSERT INTO Pynka.FACT_SALES
SELECT SOD.ProductID, SOH.CustomerID, SOH.SalesPersonID,
	CAST(FORMAT(SOH.OrderDate, 'yyyy') + FORMAT(SOH.OrderDate, 'MM') + FORMAT(SOH.OrderDate, 'dd') AS INT), 
	CAST(FORMAT(SOH.ShipDate, 'yyyy') + FORMAT(SOH.ShipDate, 'MM') + FORMAT(SOH.ShipDate, 'dd') AS INT),
	SOD.OrderQty, SOD.UnitPrice, SOD.UnitPriceDiscount, SOD.LineTotal
	FROM Sales.SalesOrderHeader SOH
	LEFT JOIN Sales.SalesOrderDetail SOD ON SOD.SalesOrderID=SOH.SalesOrderID;

INSERT INTO Pynka.ENUM_MONTHS VALUES(1, 'styczeń');
INSERT INTO Pynka.ENUM_MONTHS VALUES(2, 'luty');
INSERT INTO Pynka.ENUM_MONTHS VALUES(3, 'marzec');
INSERT INTO Pynka.ENUM_MONTHS VALUES(4, 'kwiecień');
INSERT INTO Pynka.ENUM_MONTHS VALUES(5, 'maj');
INSERT INTO Pynka.ENUM_MONTHS VALUES(6, 'czerwiec');
INSERT INTO Pynka.ENUM_MONTHS VALUES(7, 'lipiec');
INSERT INTO Pynka.ENUM_MONTHS VALUES(8, 'sierpień');
INSERT INTO Pynka.ENUM_MONTHS VALUES(9, 'wrzesień');
INSERT INTO Pynka.ENUM_MONTHS VALUES(10, 'październik');
INSERT INTO Pynka.ENUM_MONTHS VALUES(11, 'listopad');
INSERT INTO Pynka.ENUM_MONTHS VALUES(12, 'grudzień');

INSERT INTO Pynka.ENUM_WEEKDAYS VALUES(7, 'poniedziałek');
INSERT INTO Pynka.ENUM_WEEKDAYS VALUES(2, 'wtorek');
INSERT INTO Pynka.ENUM_WEEKDAYS VALUES(3, 'środa');
INSERT INTO Pynka.ENUM_WEEKDAYS VALUES(4, 'czwartek');
INSERT INTO Pynka.ENUM_WEEKDAYS VALUES(5, 'piątek');
INSERT INTO Pynka.ENUM_WEEKDAYS VALUES(6, 'sobota');
INSERT INTO Pynka.ENUM_WEEKDAYS VALUES(1, 'niedziela');

INSERT INTO Pynka.DIM_TIME
SELECT CAST(FORMAT(DateRec, 'yyyy') + FORMAT(DateRec, 'MM') + FORMAT(DateRec, 'dd') AS INT),
	YEAR(DateRec), DATEPART(quarter, DateRec), MONTH(DateRec), EM.Miesiac_slownie,
	EW.Dzien_tygodnia, DAY(DateRec)
	FROM (
		SELECT DISTINCT OrderDate "DateRec" FROM Sales.SalesOrderHeader
		UNION SELECT ShipDate FROM Sales.SalesOrderHeader) I
	JOIN Pynka.ENUM_MONTHS EM ON EM.Miesiac=MONTH(DateRec)
	JOIN Pynka.ENUM_WEEKDAYS EW ON EW.Dzien=DATEPART(WEEKDAY, DateRec);