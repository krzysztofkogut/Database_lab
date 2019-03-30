/* baza danych: cukiernia

Napisz zapytanie w języku SQL wyświetlające informacje na temat: */

/* 1. łącznej masy wszystkich pudełek czekoladek znajdujących się w cukierni, */
select sum(stan * sztuk * masa)
from cukiernia.pudelka join cukiernia.zawartosc using(idpudelka) join cukiernia.czekoladki using(idczekoladki);

/* 2. łącznej wartości wszystkich pudełek czekoladek znajdujących się w cukierni. */
select sum(cena * stan) from cukiernia.pudelka; 