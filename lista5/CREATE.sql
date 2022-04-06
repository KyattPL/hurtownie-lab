CREATE TABLE Pynka.DIM_CUSTOMER (
	CustomerID INT NOT NULL,
	FirstName NVARCHAR(50),
	LastName NVARCHAR(50),
	Title NVARCHAR(8),
	City NVARCHAR(30),
	TerritoryName NVARCHAR(50),
	CountryRegionCode NVARCHAR(3),
	[Group] NVARCHAR(50)
);

CREATE TABLE Pynka.DIM_PRODUCT (
	ProductID INT NOT NULL,
	Name NVARCHAR(50) NOT NULL,
	ListPrice MONEY NOT NULL,
	Color NVARCHAR(15),
	SubCategoryName NVARCHAR(50),
	CategoryName NVARCHAR(50),
	Weight DECIMAL(8,2),
	Size NVARCHAR(5),
	IsPurchased BIT NOT NULL
);

CREATE TABLE Pynka.DIM_SALESPERSON (
	SalesPersonID INT NOT NULL,
	FirstName NVARCHAR(50) NOT NULL,
	LastName NVARCHAR(50) NOT NULL,
	Title NVARCHAR(8),
	Gender NCHAR(1) NOT NULL,
	CountryRegionCode NVARCHAR(3),
	[Group] NVARCHAR(50)
);

CREATE TABLE Pynka.FACT_SALES (
	ProductID INT NOT NULL,
	CustomerID INT NOT NULL,
	SalesPersonID INT,
	OrderDate INT NOT NULL,
	ShipDate INT NOT NULL,
	OrderQty SMALLINT NOT NULL,
	UnitPrice MONEY NOT NULL,
	UnitPriceDiscount MONEY NOT NULL,
	LineTotal NUMERIC(38,6) NOT NULL
);

CREATE TABLE Pynka.ENUM_MONTHS (
	Miesiac INT PRIMARY KEY,
	Miesiac_slownie VARCHAR(11) NOT NULL
);

CREATE TABLE Pynka.ENUM_WEEKDAYS (
	Dzien INT PRIMARY KEY,
	Dzien_tygodnia VARCHAR(12) NOT NULL
);

CREATE TABLE Pynka.DIM_TIME (
	PK_TIME INT PRIMARY KEY,
	Rok INT NOT NULL,
	Kwartal INT NOT NULL,
	Miesiac INT NOT NULL,
	Miesiac_slownie VARCHAR(11) NOT NULL,
	Dzien_tygodnia VARCHAR(12) NOT NULL,
	Dzien_miesiaca INT NOT NULL
);