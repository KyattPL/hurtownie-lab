CREATE TABLE Adres (
	idA INTEGER PRIMARY KEY,
	miejscowosc VARCHAR(50) NOT NULL,
	gmina VARCHAR(50) NOT NULL,
	powiat VARCHAR(50) NOT NULL,
	wojewodztwo VARCHAR(50) NOT NULL,
	ulica VARCHAR(50) NOT NULL,
	kodPocztowy INTEGER NOT NULL,
	nrDomu INTEGER NOT NULL,
	nrMieszkania INTEGER
);

CREATE TABLE Klient (
	idK INTEGER PRIMARY KEY,
	imie VARCHAR(50) NOT NULL,
	nazwisko VARCHAR(50) NOT NULL,
	nrRachunku VARCHAR(20) UNIQUE,
	wiek INTEGER,
	email VARCHAR(30) NOT NULL UNIQUE,
	hashHasla VARCHAR(256) NOT NULL UNIQUE,
	adresDostawy INTEGER FOREIGN KEY REFERENCES Adres(idA) UNIQUE
);

CREATE TABLE Sklep (
	idS INTEGER PRIMARY KEY,
	nazwaS VARCHAR(30) NOT NULL,
	adresSklepu INTEGER FOREIGN KEY REFERENCES Adres(idA) NOT NULL UNIQUE
);

CREATE TABLE Kategoria (
	nazwaKat VARCHAR(30) PRIMARY KEY
);

CREATE TABLE Produkt(
	idP INTEGER PRIMARY KEY,
	nazwaP VARCHAR(50) NOT NULL,
	kategoriaP VARCHAR(30) REFERENCES Kategoria(nazwaKat) NOT NULL,
	cenaP DECIMAL(30,4) NOT NULL,
	wagaP REAL,
	rokProdukcji INTEGER
);

CREATE TABLE ProduktSklepowy(
	idPS INTEGER PRIMARY KEY,
	idSklepu INTEGER REFERENCES Sklep(idS) NOT NULL,
	idProduktu INTEGER REFERENCES Produkt(idP) NOT NULL
);

CREATE TABLE RobiZakupy (
	nrTransakcji INTEGER PRIMARY KEY,
	idKlienta INTEGER REFERENCES Klient(idK) NOT NULL,
	idSklepu INTEGER REFERENCES Sklep(idS) NOT NULL,
	czasZ TIME NOT NULL,
	dataZamowienia DATE NOT NULL,
	dataOplacenia DATE,
	dataOdbioru DATE,
	calkowitaSuma DECIMAL(30,4) NOT NULL
);

CREATE TABLE Nabywa (
	idN INTEGER PRIMARY KEY,
	idZakupu INTEGER REFERENCES RobiZakupy(nrTransakcji) NOT NULL,
	idProd INTEGER REFERENCES Produkt(idP) NOT NULL,
	iloscN INTEGER NOT NULL,
	cenaN DECIMAL(30,4) NOT NULL
);