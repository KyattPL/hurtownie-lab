CREATE TABLE Pynka.ENUM_MONTHS (
	Miesiac INT PRIMARY KEY,
	Miesiac_slownie VARCHAR(11) NOT NULL
);

INSERT INTO Pynka.ENUM_MONTHS VALUES(1, 'styczeñ');
INSERT INTO Pynka.ENUM_MONTHS VALUES(2, 'luty');
INSERT INTO Pynka.ENUM_MONTHS VALUES(3, 'marzec');
INSERT INTO Pynka.ENUM_MONTHS VALUES(4, 'kwiecieñ');
INSERT INTO Pynka.ENUM_MONTHS VALUES(5, 'maj');
INSERT INTO Pynka.ENUM_MONTHS VALUES(6, 'czerwiec');
INSERT INTO Pynka.ENUM_MONTHS VALUES(7, 'lipiec');
INSERT INTO Pynka.ENUM_MONTHS VALUES(8, 'sierpieñ');
INSERT INTO Pynka.ENUM_MONTHS VALUES(9, 'wrzesieñ');
INSERT INTO Pynka.ENUM_MONTHS VALUES(10, 'paŸdziernik');
INSERT INTO Pynka.ENUM_MONTHS VALUES(11, 'listopad');
INSERT INTO Pynka.ENUM_MONTHS VALUES(12, 'grudzieñ');

CREATE TABLE Pynka.ENUM_WEEKDAYS (
	Dzien INT PRIMARY KEY,
	Dzien_tygodnia VARCHAR(12) NOT NULL
);

INSERT INTO Pynka.ENUM_WEEKDAYS VALUES(7, 'poniedzia³ek');
INSERT INTO Pynka.ENUM_WEEKDAYS VALUES(2, 'wtorek');
INSERT INTO Pynka.ENUM_WEEKDAYS VALUES(3, 'œroda');
INSERT INTO Pynka.ENUM_WEEKDAYS VALUES(4, 'czwartek');
INSERT INTO Pynka.ENUM_WEEKDAYS VALUES(5, 'pi¹tek');
INSERT INTO Pynka.ENUM_WEEKDAYS VALUES(6, 'sobota');
INSERT INTO Pynka.ENUM_WEEKDAYS VALUES(1, 'niedziela');

CREATE TABLE Pynka.DIM_TIME (
	PK_TIME INT PRIMARY KEY,
	Rok INT NOT NULL,
	Kwartal INT NOT NULL,
	Miesiac INT NOT NULL,
	Miesiac_slownie VARCHAR(11) NOT NULL,
	Dzien_tygodnia VARCHAR(12) NOT NULL,
	Dzien_miesiaca INT NOT NULL
);

INSERT INTO Pynka.DIM_TIME
SELECT CAST(FORMAT(DateRec, 'yyyy') + FORMAT(DateRec, 'MM') + FORMAT(DateRec, 'dd') AS INT),
	YEAR(DateRec), DATEPART(quarter, DateRec), MONTH(DateRec), EM.Miesiac_slownie,
	EW.Dzien_tygodnia, DAY(DateRec)
	FROM (
		SELECT DISTINCT OrderDate "DateRec" FROM Sales.SalesOrderHeader
		UNION SELECT ShipDate FROM Sales.SalesOrderHeader) I
	JOIN Pynka.ENUM_MONTHS EM ON EM.Miesiac=MONTH(DateRec)
	JOIN Pynka.ENUM_WEEKDAYS EW ON EW.Dzien=DATEPART(WEEKDAY, DateRec);