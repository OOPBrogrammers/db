USE uni;
UPDATE Warengruppen SET GruppenNr = 20 WHERE GruppenName = "Ships";
-- Das funktioniert, weil ON UPDATE CASCADE. Beim updaten werden alle children mitgeupdated. Es verändert sich gar nichts
