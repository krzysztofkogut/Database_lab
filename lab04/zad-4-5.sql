/* baza danych: cukiernia

Napisz zapytanie w języku SQL wyświetlające informacje na temat pudełek z czekoladkami (nazwa, opis, cena),
które (uwaga: może być konieczne użycie konstrukcji z poprzednich laboratoriów): */


/* 1. zawierają czekoladki o wartości klucza głównego d09 */
select p.nazwa as "Nazwa pudełka", p.opis as "Opis pudełka", p.cena, c.idczekoladki
	from cukiernia.pudelka p
		join cukiernia.zawartosc z using(idpudelka)
		join cukiernia.czekoladki c using(idczekoladki)
			where c.idczekoladki='d09';


/* 2. zawierają przynajmniej jedną czekoladkę, której nazwa zaczyna się na S, */
select distinct on (p.nazwa) p.nazwa as "Nazwa pudełka", p.opis as "Opis pudełka", p.cena, p.idpudelka, z.idczekoladki, c.nazwa as "Nazwa czekoladki"
	from cukiernia.pudelka p
		join cukiernia.zawartosc z using(idpudelka)
		join cukiernia.czekoladki c using(idczekoladki)
			where c.nazwa like 'S%';

-- distinct ----------------------------> unikalne rekordy według wszystkich kolumn
-- distinct on (kolumna1, kolumna2) ----> unikalne rekordy według podanych kolumn
-- distinct on (kolumna1) --------------> unikalne rekordy POSORTOWANE według kolumna1 rosnąco


/* 3. zawierają przynajmniej 4 sztuki czekoladek jednego gatunku (o takim samym kluczu głównym), */
select distinct on (p.nazwa) p.nazwa as "Nazwa pudełka", p.opis as "Opis pudełka", p.cena, z.sztuk
	from cukiernia.pudelka p
		join cukiernia.zawartosc z using(idpudelka)
		join cukiernia.czekoladki c using(idczekoladki)
			where z.sztuk >= 4;


/* 4. zawierają czekoladki z nadzieniem truskawkowym, */
select distinct on (p.nazwa) p.nazwa as "Nazwa pudełka", p.opis as "Opis pudełka", p.cena, c.nadzienie
	from cukiernia.pudelka p
		join cukiernia.zawartosc z using(idpudelka)
		join cukiernia.czekoladki c using(idczekoladki)
			where c.nadzienie='truskawki';


/* 5. nie zawierają czekoladek w gorzkiej czekoladzie, */
select distinct on (p.nazwa) p.nazwa as "Nazwa pudełka", p.opis as "Opis pudełka", p.cena
	from cukiernia.pudelka p
		join cukiernia.zawartosc z using(idpudelka)
		join cukiernia.czekoladki c using(idczekoladki)
except
select distinct on (p.nazwa) p.nazwa as "Nazwa pudełka", p.opis as "Opis pudełka", p.cena
	from cukiernia.pudelka p
		join cukiernia.zawartosc z using(idpudelka)
		join cukiernia.czekoladki c using(idczekoladki)
			where c.czekolada='gorzka';

-- PROTIP for PostgreSQL: jak używasz except to cały row musi być taki sam w obu selectach - dlatego też nie ma tuta c.czekolada
-- PROTIP for DBeaver: pomiedzy selectem i exceptem nie może być pustej linii


/* 6. zawierają co najmniej 3 sztuki czekoladki Gorzka truskawkowa, */
select p.nazwa as "Nazwa pudełka", p.opis as "Opis pudełka", p.cena, z.sztuk, c.czekolada, c.nadzienie, c.nazwa
	from cukiernia.pudelka p
		join cukiernia.zawartosc z using(idpudelka)
		join cukiernia.czekoladki c using(idczekoladki)
			where z.sztuk >= 3 and c.nazwa='Gorzka truskawkowa';

/* to tylko sposób na formatowanie kolumn */
select p.nazwa || ' - ' || p.opis as "Pudełko", p.cena, z.sztuk || ' - ' || c.czekolada || ' - ' || c.nadzienie as "Zawartość"
	from cukiernia.pudelka p
		join cukiernia.zawartosc z using(idpudelka)
		join cukiernia.czekoladki c using(idczekoladki)
			where z.sztuk >= 3 and c.nazwa='Gorzka truskawkowa';


/* 7. nie zawierają czekoladek z orzechami, */
select distinct on(p.nazwa) p.nazwa as "Nazwa pudełka", p.opis as "Opis pudełka", p.cena
	from cukiernia.pudelka p
		join cukiernia.zawartosc z using(idpudelka)
		join cukiernia.czekoladki c using(idczekoladki)
except
select distinct on(p.nazwa) p.nazwa as "Nazwa pudełka", p.opis as "Opis pudełka", p.cena
	from cukiernia.pudelka p
		join cukiernia.zawartosc z using(idpudelka)
		join cukiernia.czekoladki c using(idczekoladki)
			where c.orzechy is not null;

-- UWAGA: "distinct on(p.nazwa) ..." działa tutaj tak samo jak "distinct ... order by p.nazwa;"


/* 8. zawierają czekoladki Gorzka truskawkowa, */
select p.nazwa as "Nazwa pudełka", p.opis as "Opis pudełka", p.cena, c.nazwa
	from cukiernia.pudelka p
		join cukiernia.zawartosc z using(idpudelka)
		join cukiernia.czekoladki c using(idczekoladki)
			where c.nazwa='Gorzka truskawkowa';


/* 9. zawierają przynajmniej jedną czekoladkę bez nadzienia. */
select distinct on (p.nazwa) p.nazwa as "Nazwa pudełka", p.opis, p.cena, c.nadzienie
	from cukiernia.pudelka p
		join cukiernia.zawartosc z using(idpudelka)
		join cukiernia.czekoladki c using(idczekoladki)
			where c.nadzienie is null;
