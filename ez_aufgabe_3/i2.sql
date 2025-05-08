USE uni;
SELECT a.AuftragsNr, a.Plantermin from Auftraege a
WHERE a.Status != "Zugestellt" AND EXISTS (
  SELECT 1 FROM Auftragspositionen ap 
  JOIN Artikel ar ON ap.ArtikelNr = ar.ArtikelNr
  JOIN Warengruppen w ON ar.GruppenNr = w.GruppenNr
  WHERE ap.AuftragsNr = a.AuftragsNr AND w.GruppenName = "Planes"
)
