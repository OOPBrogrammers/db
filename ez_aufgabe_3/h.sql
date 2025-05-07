USE uni;
SELECT ArtikelNr, ArtikelName, GruppenName FROM Artikel INNER JOIN Warengruppen ON Artikel.GruppenNr = Warengruppen.GruppenNr;
