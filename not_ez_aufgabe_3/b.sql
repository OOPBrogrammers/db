USE uni;
SELECT * FROM Auftraege a WHERE NOT EXISTS(
  SELECT 1 FROM Auftragspositionen ap WHERE a.AuftragsNr = ap.AuftragsNr
);
