INSERT INTO Adres VALUES(1, 'Wroc³aw', 'Wroc³aw', 'wroc³awski', 'dolnoœl¹skie', 'Kardyna³a Stefana Wyszyñskiego', 50332, 19, NULL);

INSERT INTO Kategoria VALUES('zdrowie');
INSERT INTO Kategoria VALUES('elektronika');
INSERT INTO Kategoria VALUES('meble');
INSERT INTO Kategoria VALUES('zabawki');

INSERT INTO Klient VALUES(1, 'Jan', 'Brzechwa', NULL, 23, 'jbrze@onet.pl', 'F$AFJGA$GAG!j32i4b', NULL);

INSERT INTO Sklep VALUES(1, 'H&M', 1);

INSERT INTO Produkt VALUES(1, 'lalka Barbie', 'zabawki', 19.95, 50, 2017);

INSERT INTO ProduktSklepowy VALUES(1, 1, 1);

INSERT INTO RobiZakupy VALUES(1, 1, 1, '19:43', '2022-01-20', NULL, NULL, 79.8); 

INSERT INTO Nabywa VALUES(1, 1, 1, 4, 19.95);

SELECT * FROM Adres;
SELECT * FROM Kategoria;
SELECT * FROM Klient;
SELECT * FROM Sklep;
SELECT * FROM Produkt;
SELECT * FROM ProduktSklepowy;
SELECT * FROM RobiZakupy;
SELECT * FROM Nabywa;

DROP TABLE ProduktSklepowy;
DROP TABLE Nabywa;
DROP TABLE Produkt;
DROP TABLE RobiZakupy;
DROP TABLE Sklep;
DROP TABLE Klient;
DROP TABLE Kategoria;
DROP TABLE Adres;