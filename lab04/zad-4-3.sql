/* baza danych: cukiernia

Napisz zapytanie w języku SQL wyświetlające informacje na temat klientów (nazwa, ulica, miejscowość), którzy: */

/* 1. złożyli zamówienia z datą realizacji nie starszą niż sprzed pięciu lat, */
/* I sposób: */
select nazwa, ulica, miejscowosc, z.datarealizacji from cukiernia.klienci natural join cukiernia.zamowienia z
	where miejscowosc='KrakÃ³w' and z.datarealizacji > now() - interval '5 years';
/* II sposób: */
select nazwa, ulica, miejscowosc, z.datarealizacji from cukiernia.klienci k inner join cukiernia.zamowienia z on z.idklienta=k.idklienta
	where miejscowosc='KrakÃ³w' and z.datarealizacji > now() - interval '5 years';

/* 2. zamówili pudełko Kremowa fantazja lub Kolekcja jesienna, */
/* I sposób: */
select k.nazwa, k.ulica, k.miejscowosc, p.nazwa from cukiernia.klienci k
	natural join cukiernia.zamowienia z
	natural join cukiernia.artykuly a
	join cukiernia.pudelka p using(idpudelka)
		where p.nazwa in ('Kremowa fantazja','Kolekcja jesienna');
/* II spodób: */
select k.nazwa, k.ulica, k.miejscowosc, p.nazwa from cukiernia.klienci k
	inner join cukiernia.zamowienia z on z.idklienta=k.idklienta
	inner join cukiernia.artykuly a on a.idzamowienia=z.idzamowienia
	inner join cukiernia.pudelka p on p.idpudelka=a.idpudelka
		where p.nazwa in ('Kolekcja jesienna', 'Kremowa fantazja');

/* 3. złożyli wiecej niż jedno zamówienie, */
select k.nazwa, k.ulica, k.miejscowosc, a.sztuk from cukiernia.klienci k
	inner join cukiernia.zamowienia z on z.idklienta=k.idklienta
	inner join cukiernia.artykuly a on a.idzamowienia=z.idzamowienia
		where a.sztuk > 1;

/* 4. nie złożyli żadnych zamówień, */
select k.nazwa, k.ulica, k.miejscowosc, a.sztuk from cukiernia.klienci k
	inner join cukiernia.zamowienia z on z.idklienta=k.idklienta
	inner join cukiernia.artykuly a on a.idzamowienia=z.idzamowienia
		where a.sztuk < 1;

/* 5. złożyli zamówienia z datą realizacji w listopadzie 2013, */
select k.nazwa, k.ulica, k.miejscowosc, z.datarealizacji from cukiernia.klienci k
	inner join cukiernia.zamowienia z on z.idklienta=k.idklienta
		where extract(year from z.datarealizacji)='2013' and extract(month from z.datarealizacji)='11';

/* 6. zamówili co najmniej 2 sztuki pudełek Kremowa fantazja lub Kolekcja jesienna w ramach jednego zamówienia, */
select k.nazwa, k.ulica, k.miejscowosc, a.sztuk, p.nazwa from cukiernia.klienci k
	inner join cukiernia.zamowienia z using(idklienta)
	inner join cukiernia.artykuly a using(idzamowienia)
	inner join cukiernia.pudelka p using(idpudelka)
		where a.sztuk >= 2 and p.nazwa in ('Kremowa fantazja','Kolekcja jesienna');

/* TIP:
 * using(param1, param2) to to samo co: on a.param1=b.param1 and a.param2=b.param2 :)
 */

/* 7. zamówili pudełka, które zawierają czekoladki z migdałami. */
select k.nazwa, k.ulica, k.miejscowosc, z.orzechy from cukiernia.klienci k
	inner join cukiernia.zamowienia using(idklienta)
	inner join cukiernia.artykuly using(idzamowienia)
	inner join cukiernia.zawartosc using(idpudelka)
	inner join cukiernia.czekoladki z using(idczekoladki)
		where z.orzechy = 'migdaÅ‚y';
