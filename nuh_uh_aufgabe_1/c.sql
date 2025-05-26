USE uni;
SELECT 
    a.ArtikelNr,
    a.Artikel,
    a.GruppenNr,
    wg.Warengruppe,
    a.Umsatz,
    wg.WGUmsatz,
    ROUND((a.Umsatz / wg.WGUmsatz) * 100, 2) AS Anteil
FROM 
    (
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
            a.ArtikelNr, a.ArtikelName, a.GruppenNr
    ) AS a
JOIN 
    (
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
            wg.GruppenNr, wg.GruppenName
    ) AS wg
ON a.GruppenNr = wg.GruppenNr
-- Für überprüfen: WHERE wg.Warengruppe = "Trains"
ORDER BY 
    wg.Warengruppe, a.ArtikelNr;

