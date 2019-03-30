/* baza danych: cukiernia

Napisz poniższe zapytania w języku SQL: */

/* 1. Wyświetl wartości kluczy głównych oraz nazwy czekoladek, których koszt jest większy od kosztu czekoladki o wartości klucza głównego równej d08. */
-- I SPOSÓB
select c.idczekoladki || ' - ' || c.nazwa as "Czekoladka", c.koszt as "Koszt czekoladki", d.koszt as "Koszt d08"
	from cukiernia.czekoladki c, cukiernia.czekoladki d
		where d.idczekoladki='d08' and c.koszt > d.koszt;

-- II SPOSÓB -> samozłączenie
select * from cukiernia.czekoladki a join cukiernia.czekoladki b on (b.idczekoladki = 'd08');

select * from cukiernia.klienci k1 natural join cukiernia.zamowienia z1 natural join cukiernia.artykuly a1
    join cukiernia.klienci k2 on (k2.idklienta='57') join cukiernia.zamowienia z2 on (z2.idklienta=k2.idklienta)
    join cukiernia.artykuly a2 on (a1.idpudelka=a2.idpudelka);

/* inny sposób */
select d.idczekoladki || ' - ' || d.nazwa as "Czekoladka", d.koszt as "Koszt czekoladki",
(select koszt from cukiernia.czekoladki where idczekoladki='d08') as "Koszt d08"
	from cukiernia.czekoladki d
		where d.koszt > (select koszt from cukiernia.czekoladki where idczekoladki='d08');


/* 2. Kto (nazwa klienta) złożył zamówienia na takie same czekoladki (pudełka) jak zamawiała Górka Alicja. */
select distinct on (k.nazwa) k.nazwa from cukiernia.klienci k
	natural join cukiernia.zamowienia z
	natural join cukiernia.artykuly a
		where a.idpudelka in (select distinct a.idpudelka
			from cukiernia.klienci k
				natural join cukiernia.zamowienia z
				natural join cukiernia.artykuly a
					where k.nazwa='GÃ³rka Alicja');
/*
 * PROTIP: jak chcesz przestestować czy działa to podmień Górke Alicje na SokÃ³Å‚ Alicja (id=37). ona zrobiła tylko jedno zamowienie o id=115.
 * jest to zamowienie na jedno pudelko id=heav
 * wynik powinien być taki sam jak po wywałaniu:

select distinct on (k.nazwa) k.nazwa from cukiernia.klienci k
	natural join cukiernia.zamowienia z
	natural join cukiernia.artykuly a
		where a.idpudelka='heav';
*/

/* 3. Kto (nazwa klienta, adres) złożył zamówienia na takie same czekoladki (pudełka) jak zamawiali klienci z Katowic. */
select distinct on(k.nazwa) k.nazwa as "Klient", k.ulica||', '||k.kod||', '||k.miejscowosc as "Adres"
	from cukiernia.klienci k
		natural join cukiernia.zamowienia z
		natural join cukiernia.artykuly a
			where a.idpudelka in (select distinct a.idpudelka
				from cukiernia.klienci k
					natural join cukiernia.zamowienia z
					natural join cukiernia.artykuly a
						where k.idklienta in (select idklienta from cukiernia.klienci where miejscowosc='Katowice')
		);

-- można używać zamiennie:
-- select distinct on (tabela) ... ; <-------> select distinct ... order by tabela;

-- ---------------------------------------------------------------------------------------------------------------------------------
-- TODO: sprawdź czy:
-- natural join {schema.table} <--- TO SAMO ---> join {schema.table} using ({PK})
