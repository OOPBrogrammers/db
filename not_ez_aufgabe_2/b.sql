USE uni;
SELECT a.ArtikelNr, a.Artikelname, b.Bestellmenge, b.Umsatz
FROM Artikel a
JOIN ArtikelUmsatz b ON a.ArtikelNr = b.ArtikelNr
WHERE a.Massstab = "1:18";
-- Nein, aggregation ist nicht nötig, weil wir ja einfach den view verwenden können.
