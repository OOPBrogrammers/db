USE uni;
SELECT 
    wg.GruppenNr,
    wg.GruppenName AS Warengruppe,
    SUM(ap.Bestellmenge * ap.Verkaufspreis) AS WGUmsatz
FROM 
    Warengruppen wg
JOIN 
    Artikel a ON wg.GruppenNr = a.GruppenNr
JOIN 
    Auftragspositionen ap ON a.ArtikelNr = ap.ArtikelNr
GROUP BY 
    wg.GruppenNr, wg.GruppenName;

