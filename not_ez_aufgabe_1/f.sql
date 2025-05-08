USE uni;
SELECT 
k.KundenNr, 
k.Firma, 
SUM(ap.Bestellmenge * ap.Verkaufspreis) AS Umsatz,
SUM(ap.Bestellmenge * (ap.Verkaufspreis - ar.Einkaufspreis)) AS Gewinn,
COUNT(DISTINCT af.AuftragsNr) AS Anzahl_Auftraege 
FROM Kunden k
JOIN Auftraege af ON k.KundenNr = af.KundenNr
JOIN Auftragspositionen ap ON ap.AuftragsNr = af.AuftragsNr
JOIN Artikel ar ON ap.ArtikelNr = ar.ArtikelNr
GROUP BY k.KundenNr
HAVING SUM(ap.Bestellmenge * ap.Verkaufspreis) > 100000
ORDER BY Umsatz ASC;
