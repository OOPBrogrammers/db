USE uni;
DELETE FROM Warengruppen WHERE GruppenName = "Ships";
-- Das geht nicht, weil nur ON UPDATE CASCADE. Das heißt Artikel werden nur beim updaten mitgeändert
-- und man kann die Gruppe erst löschen wenn sie mit keinen Artikeln verbunden ist
