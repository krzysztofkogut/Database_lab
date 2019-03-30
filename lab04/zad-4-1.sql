/* baza danych: cukiernia

Porównaj wyniki poniższych zapytań: */

SELECT k.nazwa FROM klienci k;
SELECT k.nazwa, z.idzamowienia FROM klienci k, zamowienia z;
SELECT k.nazwa, z.idzamowienia FROM klienci k, zamowienia z WHERE z.idklienta = k.idklienta;
SELECT k.nazwa, z.idzamowienia FROM klienci k NATURAL JOIN zamowienia z;
SELECT k.nazwa, z.idzamowienia FROM klienci k JOIN zamowienia z ON z.idklienta=k.idklienta;
SELECT k.nazwa, z.idzamowienia FROM klienci k JOIN zamowienia z USING (idklienta);

/*
1. W którym zapytaniu występuje iloczyn kartezjański?
ODP: w drugim

2. Które zapytanie dostarcza bezwartościowych danych?
yyyyyyy :(
*/
