USE uni;
SELECT a.AuftragsNr, a.Plantermin from Auftraege a
WHERE a.Status != "Zugestellt" AND EXISTS (
  SELECT * FROM Auftragspositionen ap 
  JOIN Artikel ar ON ap.ArtikelNr = Ar.ArtikelNr
  JOIN Warengruppen w ON ap.GruppenNr = w.GruppenNr
  WHERE ap.AuftragsNr = a.AuftragsNr AND w.GruppenName = "Planes"
)
