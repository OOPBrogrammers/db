--  -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -
--  Für das Anlegen einer eigenen Datenbank
--  -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -

-- DROP DATABASE IF EXISTS toymodels;
-- CREATE DATABASE IF NOT EXISTS toymodels;
-- USE toymodels;

-- Ihren DB-Namen (mit Suffix _tm) hier eintragen
USE uni;


--  -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -
--  Table Produktgruppen
--  -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -

CREATE TABLE IF NOT EXISTS Warengruppen (
	GruppenNr INT NOT NULL,
	GruppenName VARCHAR(50) NOT NULL,
	Beschreibung VARCHAR(4000),
	PRIMARY KEY (GruppenNr)
);

--  -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -
--  Table Produkte
--  -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -

CREATE TABLE IF NOT EXISTS Artikel (
	ArtikelNr VARCHAR(15) NOT NULL,
	ArtikelName VARCHAR(70) NOT NULL,
	GruppenNr INT NOT NULL,
	Massstab VARCHAR(10) NOT NULL,
	Lieferant VARCHAR(50) NOT NULL,
	Beschreibung TEXT NOT NULL,
	Bestandsmenge INT NOT NULL,
	Einkaufspreis DECIMAL(5,2) NOT NULL,
	Listenpreis DECIMAL(5,2) NOT NULL,
	PRIMARY KEY (ArtikelNr),
	FOREIGN KEY (GruppenNr) REFERENCES Warengruppen (GruppenNr)
	ON DELETE NO ACTION
	ON UPDATE CASCADE
);


--  -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -
--  Table Filialen
--  -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -

CREATE TABLE IF NOT EXISTS Filialen (
	FilialNr VARCHAR(10) NOT NULL,
	TelefonNr VARCHAR(50) NOT NULL,
	Strasse VARCHAR(50) NOT NULL,
	PLZ VARCHAR(15) NOT NULL,
	Ort VARCHAR(50) NOT NULL,
	Land VARCHAR(50) NOT NULL,
	PRIMARY KEY (FilialNr)
);

--  -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -
--  Table Mitarbeiter
--  -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -

CREATE TABLE IF NOT EXISTS Mitarbeiter (
	PersonalNr INT NOT NULL,
	FilialNr VARCHAR(10) NOT NULL,
	Nachname VARCHAR(50) NOT NULL,
	Vorname VARCHAR(50) NOT NULL,
	Telefon VARCHAR(10) NOT NULL,
	Email VARCHAR(100) NOT NULL,
	Vorgesetzter INT,
	PRIMARY KEY (PersonalNr),
	FOREIGN KEY (FilialNr) REFERENCES Filialen (FilialNr),
	FOREIGN KEY (Vorgesetzter) REFERENCES Mitarbeiter (PersonalNr) ON DELETE SET NULL ON UPDATE SET NULL
);

--  -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -
--  Table Kunden
--  -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -

CREATE TABLE IF NOT EXISTS Kunden (
	KundenNr INT NOT NULL,
	Firma VARCHAR(50) NOT NULL,
	Nachname VARCHAR(50),
	Vorname VARCHAR(50),
	Telefon VARCHAR(50) NOT NULL,
	Strasse VARCHAR(50) NOT NULL,
	Ort VARCHAR(50) NOT NULL,
	PLZ VARCHAR(15)NOT NULL,
	Land VARCHAR(50) NOT NULL,
	Kundenbetreuer INT NOT NULL, 
	Kreditlimit DECIMAL(7),
	PRIMARY KEY (KundenNr),
    FOREIGN KEY (Kundenbetreuer) REFERENCES Mitarbeiter (PersonalNr)
 );

--  -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -
--  Table Kundenauftraege
--  -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -

CREATE TABLE IF NOT EXISTS Auftraege (
	AuftragsNr INT NOT NULL,
	Auftragsdatum DATE NOT NULL,
	Plantermin DATE NOT NULL,
	Lieferdatum DATE,
	Status VARCHAR(15) NOT NULL,
	Bemerkungen TEXT,
	KundenNr INT NOT NULL ,
	PRIMARY KEY (AuftragsNr),
	FOREIGN KEY (KundenNr) REFERENCES Kunden (KundenNr)
);

--  -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -
--  Table Kundenauftragspositionen
--  -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -

CREATE TABLE IF NOT EXISTS Auftragspositionen (
	AuftragsNr INT NOT NULL,
	ArtikelNr VARCHAR(15) NOT NULL,
	Bestellmenge INT NOT NULL,
	Verkaufspreis DECIMAL(7,2) NOT NULL,
	PositionsNr INT NOT NULL,
	PRIMARY KEY (AuftragsNr, ArtikelNr),
	UNIQUE (AuftragsNr, PositionsNr),
	FOREIGN KEY (AuftragsNr) REFERENCES Auftraege (AuftragsNr),
    FOREIGN KEY (ArtikelNr) REFERENCES Artikel (ArtikelNr)
 );

--  -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -
--  Table Bezahlungen
--  -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -

CREATE TABLE IF NOT EXISTS Bezahlungen (
	ZahlungsNr VARCHAR(15) NOT NULL,
	KundenNr INT NOT NULL ,
	Zahlungsdatum DATE NOT NULL,
	Zahlungsbetrag DECIMAL(8,2) NOT NULL,
	PRIMARY KEY (ZahlungsNr),
	FOREIGN KEY(KundenNr) REFERENCES Kunden (KundenNr)
);

