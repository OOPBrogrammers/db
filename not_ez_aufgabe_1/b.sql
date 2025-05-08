USE uni;
SELECT Land, COUNT(*) as Anzahl_Kunden FROM Kunden GROUP BY Land HAVING COUNT(*) >= 5 ORDER BY COUNT(*) DESC;
