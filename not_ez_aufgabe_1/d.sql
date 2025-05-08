USE uni;
SELECT 
    a.ArtikelNr,
    a.Artikelname,
    COALESCE(SUM(ap.Bestellmenge), 0) AS Menge,
    COALESCE(SUM(ap.Bestellmenge * ap.Verkaufspreis), 0) AS Umsatz
FROM Artikel a
LEFT JOIN Auftragspositionen ap ON a.ArtikelNr = ap.ArtikelNr
WHERE a.Massstab = '1:18'
GROUP BY a.ArtikelNr, a.Artikelname
ORDER BY Menge ASC;
