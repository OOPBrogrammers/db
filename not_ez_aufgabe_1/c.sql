USE uni;
SELECT Land, COUNT(DISTINCT Ort) AS Anzahl_Orte FROM Kunden GROUP BY Land ORDER BY Land ASC;
