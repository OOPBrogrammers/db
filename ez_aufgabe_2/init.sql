USE uni;
-- Foreign-Key-Checks abschalten, damit das ALTER TABLE funktioniert
SET foreign_key_checks=0;
ALTER TABLE Kunden MODIFY COLUMN KundenNr INT auto_increment;
-- Neuen Startwert setzen
ALTER TABLE Kunden AUTO_INCREMENT = 500;
-- Checks wieder einschalten
SET foreign_key_checks=1;

