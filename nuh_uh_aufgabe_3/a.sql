USE uni;
SELECT 
    bw.KundenNr,
    bw.Bestellwert,
    COALESCE(z.Gesamtzahlung, 0) AS Gesamtzahlung,
    bw.Bestellwert - COALESCE(z.Gesamtzahlung, 0) AS Differenz
FROM (
    SELECT 
        a.KundenNr,
        SUM(ap.Bestellmenge * ap.Verkaufspreis) AS Bestellwert
    FROM 
        Auftraege a
    JOIN 
        Auftragspositionen ap ON a.AuftragsNr = ap.AuftragsNr
    WHERE 
        a.Status IN ('in Bearbeitung', 'zugestellt')
    GROUP BY 
        a.KundenNr
) AS bw
LEFT JOIN (
    SELECT 
        KundenNr,
        SUM(Zahlungsbetrag) AS Gesamtzahlung
    FROM 
        Bezahlungen
    GROUP BY 
        KundenNr
) AS z ON bw.KundenNr = z.KundenNr
WHERE 
    bw.Bestellwert > COALESCE(z.Gesamtzahlung, 0);
