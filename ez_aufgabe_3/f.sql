USE uni;
SELECT * FROM Kunden WHERE Land = "Deutschland" AND (PLZ LIKE "8%" OR PLZ LIKE "9%") ORDER BY Firma;
