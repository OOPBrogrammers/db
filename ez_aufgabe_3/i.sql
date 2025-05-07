USE uni;
SELECT DISTINCT Auftraege.AuftragsNr, Plantermin FROM Auftraege 
INNER JOIN Auftragspositionen ON Auftraege.AuftragsNr = Auftragspositionen.AuftragsNr 
INNER JOIN Artikel ON Auftragspositionen.ArtikelNr = Artikel.ArtikelNr 
INNER JOIN Warengruppen ON Artikel.GruppenNr = Warengruppen.GruppenNr 
WHERE GruppenName = "Planes" AND Status != "Zugestellt";
