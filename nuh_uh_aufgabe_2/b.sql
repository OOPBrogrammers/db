USE uni;
SELECT 
    KundenNr,
    Auftragsdatum,
    Lieferdatum,
    DATEDIFF(Lieferdatum, Auftragsdatum) AS Lieferzeit,
    CASE 
        WHEN DATEDIFF(Lieferdatum, Auftragsdatum) >= 4 THEN 'langsam'
        ELSE 'schnell'
    END AS Lieferklasse
FROM 
    Auftraege
WHERE 
    Lieferdatum IS NOT NULL;

