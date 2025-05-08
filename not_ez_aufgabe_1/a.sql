USE uni;
SELECT Land, COUNT(*) as Anzahl_Kunden FROM Kunden GROUP BY Land;
