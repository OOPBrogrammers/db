USE uni;
SELECT 
    KundenNr,
    Auftragsdatum,
    Lieferdatum,
    DATEDIFF(Lieferdatum, Auftragsdatum) AS Lieferzeit
FROM 
    Auftraege
WHERE
    Lieferdatum IS NOT NULL;

