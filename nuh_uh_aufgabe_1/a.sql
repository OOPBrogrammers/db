USE uni;
SELECT 
    a.ArtikelNr,
    a.ArtikelName AS Artikel,
    a.GruppenNr,
    SUM(ap.Bestellmenge * ap.Verkaufspreis) AS Umsatz
FROM 
    Artikel a
JOIN 
    Auftragspositionen ap ON a.ArtikelNr = ap.ArtikelNr
GROUP BY 
    a.ArtikelNr, a.ArtikelName, a.GruppenNr;

