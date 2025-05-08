USE uni;
SELECT k.Land, COUNT(DISTINCT ap.ArtikelNr) AS AnzahlArtikel
FROM Kunden k
JOIN Auftraege a ON k.KundenNr = a.KundenNr
JOIN Auftragspositionen ap ON a.AuftragsNr = ap.AuftragsNr
WHERE k.Land IN ('Deutschland', 'Frankreich', 'England')
GROUP BY k.Land;

