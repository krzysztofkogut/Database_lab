/* baza danych: cukiernia

Napisz zapytanie w języku SQL wyświetlające informacje na temat: */

/* 1. łącznej liczby czekoladek w bazie danych, */
select count(*) from cukiernia.czekoladki;

/* 2. łącznej liczby czekoladek z nadzieniem (na 2 sposoby) - podpowiedź: count(*), count(nazwaKolumny), */
select count(*) from cukiernia.czekoladki where nadzienie is not null;
select count(nadzienie) from cukiernia.czekoladki;

/* 3. pudełka, w którym jest najwięcej czekoladek (uwaga: konieczne jest użycie LIMIT), */
select idpudelka as "Pudełko", sum(sztuk) as "Suma czekoladek w pudełku" from cukiernia.zawartosc group by idpudelka order by "Suma czekoladek w pudełku" desc limit 1;

/* 4. łącznej liczby czekoladek w poszczególnych pudełkach, */
select idpudelka, sum(sztuk) from cukiernia.zawartosc group by idpudelka;

/* 5. łącznej liczby czekoladek bez orzechów w poszczególnych pudełkach, */
select z.idpudelka, sum(z.sztuk) as "Razem sztuk", sum(c.masa) as "Masa razem" from cukiernia.zawartosc z
	join cukiernia.czekoladki c using(idczekoladki)
		where c.orzechy  is null
			group by z.idpudelka;

/* 6. łącznej liczby czekoladek w mlecznej czekoladzie w poszczególnych pudełkach. */
select idpudelka, sum(sztuk) from cukiernia.zawartosc z
	join cukiernia.czekoladki c using(idczekoladki)
		where c.czekolada='mleczna'
			group by z.idpudelka;
