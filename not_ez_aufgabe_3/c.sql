USE uni;
SELECT * FROM Auftraege a 
LEFT JOIN Auftragspositionen b ON a.AuftragsNr = b.AuftragsNr
WHERE b.AuftragsNr IS NULL;
