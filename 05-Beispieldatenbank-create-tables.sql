DROP SCHEMA IF EXISTS `beispieldatenbank` ;
CREATE SCHEMA IF NOT EXISTS `beispieldatenbank` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `beispieldatenbank` ;

CREATE  TABLE IF NOT EXISTS `Kunde` (
	`Kundennummer` VARCHAR(20) NOT NULL ,
	`Name` VARCHAR(45) NOT NULL ,
	`Wohnort` VARCHAR(45) NOT NULL ,
	`Bonität` INT NOT NULL ,
	PRIMARY KEY (`Kundennummer`) 
);

CREATE  TABLE IF NOT EXISTS `Artikel` (
	`Artikelnummer` VARCHAR(20) NOT NULL ,
	`Bezeichner` VARCHAR(45) NOT NULL ,
	`Preis` DOUBLE NOT NULL ,
	PRIMARY KEY (`Artikelnummer`) 
);

CREATE  TABLE IF NOT EXISTS `Filiale` (
	`Filialnummer` VARCHAR(10) NOT NULL ,
	`Ort` VARCHAR(45) NOT NULL ,
	PRIMARY KEY (`Filialnummer`) 
);

CREATE  TABLE IF NOT EXISTS `Kauf` (
	`Kundennummer` VARCHAR(20) NOT NULL ,
	`Artikelnummer` VARCHAR(20) NOT NULL ,
	`Filialnummer` VARCHAR(10) NOT NULL ,
	`Menge` INT NOT NULL ,
	`Datum` DATE NOT NULL ,
	PRIMARY KEY (`Kundennummer`, `Artikelnummer`, `Filialnummer`) ,
	FOREIGN KEY (`Kundennummer` ) REFERENCES `Kunde` (`Kundennummer` ),
	FOREIGN KEY (`Artikelnummer` ) REFERENCES `Artikel` (`Artikelnummer` ),
	FOREIGN KEY (`Filialnummer` ) REFERENCES `Filiale` (`Filialnummer` )
);

INSERT INTO `Kunde` (`Kundennummer`, `Name`, `Wohnort`, `Bonität`) VALUES ('K1', 'Becker', 'Stuttgart', 55);
INSERT INTO `Kunde` (`Kundennummer`, `Name`, `Wohnort`, `Bonität`) VALUES ('K2', 'Fischer', 'Stuttgart', 17);
INSERT INTO `Kunde` (`Kundennummer`, `Name`, `Wohnort`, `Bonität`) VALUES ('K3', 'Maier', 'Frankfurt', 56);
INSERT INTO `Kunde` (`Kundennummer`, `Name`, `Wohnort`, `Bonität`) VALUES ('K4', 'Müller', 'Mannheim', 25);
INSERT INTO `Kunde` (`Kundennummer`, `Name`, `Wohnort`, `Bonität`) VALUES ('K5', 'Schulze', 'Karlsruhe', 17);
INSERT INTO `Kunde` (`Kundennummer`, `Name`, `Wohnort`, `Bonität`) VALUES ('K6', 'Wagner', 'Karlsruhe', 10);

INSERT INTO `Artikel` (`Artikelnummer`, `Bezeichner`, `Preis`) VALUES ('A1', 'Computer', 1000);
INSERT INTO `Artikel` (`Artikelnummer`, `Bezeichner`, `Preis`) VALUES ('A2', 'HiFi-Anlage', 500);
INSERT INTO `Artikel` (`Artikelnummer`, `Bezeichner`, `Preis`) VALUES ('A3', 'Fernseher', 1500);
INSERT INTO `Artikel` (`Artikelnummer`, `Bezeichner`, `Preis`) VALUES ('A4', 'Digitalkamera', 200);

INSERT INTO `Filiale` (`Filialnummer`, `Ort`) VALUES ('F1', 'Stuttgart');
INSERT INTO `Filiale` (`Filialnummer`, `Ort`) VALUES ('F2', 'Mannheim');
INSERT INTO `Filiale` (`Filialnummer`, `Ort`) VALUES ('F3', 'Karlsruhe');

INSERT INTO `Kauf` (`Kundennummer`, `Artikelnummer`, `Filialnummer`, `Menge`, `Datum`) VALUES ('K1', 'A1', 'F1', 4, '2006-01-10');
INSERT INTO `Kauf` (`Kundennummer`, `Artikelnummer`, `Filialnummer`, `Menge`, `Datum`) VALUES ('K1', 'A2', 'F1', 2, '2006-01-10');
INSERT INTO `Kauf` (`Kundennummer`, `Artikelnummer`, `Filialnummer`, `Menge`, `Datum`) VALUES ('K1', 'A3', 'F2', 1, '2006-02-11');
INSERT INTO `Kauf` (`Kundennummer`, `Artikelnummer`, `Filialnummer`, `Menge`, `Datum`) VALUES ('K1', 'A4', 'F3', 5, '2006-03-22');
INSERT INTO `Kauf` (`Kundennummer`, `Artikelnummer`, `Filialnummer`, `Menge`, `Datum`) VALUES ('K2', 'A1', 'F1', 1, '2006-02-22');
INSERT INTO `Kauf` (`Kundennummer`, `Artikelnummer`, `Filialnummer`, `Menge`, `Datum`) VALUES ('K2', 'A2', 'F1', 1, '2006-02-22');
INSERT INTO `Kauf` (`Kundennummer`, `Artikelnummer`, `Filialnummer`, `Menge`, `Datum`) VALUES ('K2', 'A4', 'F3', 2, '2006-03-11');
INSERT INTO `Kauf` (`Kundennummer`, `Artikelnummer`, `Filialnummer`, `Menge`, `Datum`) VALUES ('K3', 'A1', 'F2', 5, '2006-04-08');
INSERT INTO `Kauf` (`Kundennummer`, `Artikelnummer`, `Filialnummer`, `Menge`, `Datum`) VALUES ('K3', 'A3', 'F2', 2, '2006-04-08');
INSERT INTO `Kauf` (`Kundennummer`, `Artikelnummer`, `Filialnummer`, `Menge`, `Datum`) VALUES ('K3', 'A4', 'F1', 3, '2006-04-29');
INSERT INTO `Kauf` (`Kundennummer`, `Artikelnummer`, `Filialnummer`, `Menge`, `Datum`) VALUES ('K4', 'A1', 'F2', 3, '2006-03-22');
INSERT INTO `Kauf` (`Kundennummer`, `Artikelnummer`, `Filialnummer`, `Menge`, `Datum`) VALUES ('K4', 'A2', 'F3', 1, '2006-03-25');
INSERT INTO `Kauf` (`Kundennummer`, `Artikelnummer`, `Filialnummer`, `Menge`, `Datum`) VALUES ('K5', 'A3', 'F3', 1, '2006-01-14');
INSERT INTO `Kauf` (`Kundennummer`, `Artikelnummer`, `Filialnummer`, `Menge`, `Datum`) VALUES ('K5', 'A4', 'F3', 2, '2006-02-04');
INSERT INTO `Kauf` (`Kundennummer`, `Artikelnummer`, `Filialnummer`, `Menge`, `Datum`) VALUES ('K6', 'A2', 'F3', 2, '2006-03-25');
