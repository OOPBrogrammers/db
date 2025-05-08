USE uni;
CREATE VIEW ArtikelUmsatz AS
SELECT 
    ap.ArtikelNr,
    SUM(ap.Bestellmenge) AS Bestellmenge,
    SUM(ap.Bestellmenge * ap.Verkaufspreis) AS Umsatz
FROM Auftragspositionen ap
GROUP BY ap.ArtikelNr;

