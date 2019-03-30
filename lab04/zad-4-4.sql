/* baza danych: cukiernia

Napisz zapytanie w języku SQL wyświetlające informacje na temat pudełek i ich zawartości (nazwa, opis, nazwa czekoladki, opis czekoladki): */

/* 1. wszystkich pudełek, */
select p.nazwa as "Nazwa pudełka", p.opis as "Opis pudełka", p.idpudelka, z.idczekoladki, c.nazwa as "Nazwa czekoladki", c.opis as "Opis czekoladaki"
	from cukiernia.pudelka p
		join cukiernia.zawartosc z using(idpudelka)
		join cukiernia.czekoladki c using(idczekoladki);

-- select kolumna as alias... -> alias MUSI być w cudzysłowie

/* 2. pudełka o wartości klucza głównego heav, */
select  p.nazwa as "Nazwa pudełka", p.opis as "Opis pudełka", p.idpudelka, z.idczekoladki, c.nazwa as "Nazwa czekoladki", c.opis as "Opis czekoladaki"
	from cukiernia.pudelka p
		join cukiernia.zawartosc z using(idpudelka)
		join cukiernia.czekoladki c using(idczekoladki)
			where idpudelka='heav';

/* 3. pudełek, których nazwa zawiera słowo Kolekcja. */
select p.nazwa as "Nazwa pudełka", p.opis as "Opis pudełka", p.idpudelka, z.idczekoladki, c.nazwa as "Nazwa czekoladki", c.opis as "Opis czekoladaki"
	from cukiernia.pudelka p
		join cukiernia.zawartosc z using(idpudelka)
		join cukiernia.czekoladki c using(idczekoladki)
			where p.nazwa like '%Kolekcja%';
