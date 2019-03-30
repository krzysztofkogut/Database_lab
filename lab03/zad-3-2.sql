/* baza danych: cukiernia

Napisz zapytanie w języku SQL wyświetlające informacje na temat czekoladek (idCzekoladki, nazwa, czekolada, orzechy, nadzienie), których nazwa: */

/* rozpoczyna się na literę 'S', */
select idczekoladki, nazwa, czekolada, orzechy, nadzienie from  cukiernia.czekoladki where nazwa like 'S%';

/* rozpoczyna się na literę 'S' i kończy się na literę 'i', */
select idczekoladki, nazwa, czekolada, orzechy, nadzienie from  cukiernia.czekoladki where nazwa like 'S%i';

/* rozpoczyna się na literę 'S' i zawiera słowo rozpoczynające się na literę 'm', */
select idczekoladki, nazwa, czekolada, orzechy, nadzienie from  cukiernia.czekoladki where nazwa like 'S% m%';

/* rozpoczyna się na literę 'A', 'B' lub 'C', */
select idczekoladki, nazwa, czekolada, orzechy, nadzienie from  cukiernia.czekoladki where (nazwa like 'A%') or (nazwa like 'B%') or (nazwa like 'C%');
select idczekoladki, nazwa, czekolada, orzechy, nadzienie from  cukiernia.czekoladki where nazwa similar to '(A|B|C)%';
select idczekoladki, nazwa, czekolada, orzechy, nadzienie from  cukiernia.czekoladki where nazwa ~ '^(A|B|C)';  -- porównanie z tyldą różni sie od like i similar tylko tym, że uzywamy standardowych regex-ów

/* zawiera rdzeń 'orzech' (może on wystąpić na początku i wówczas będzie pisany z wielkiej litery), */
select idczekoladki, nazwa, czekolada, orzechy, nadzienie from cukiernia.czekoladki where nazwa ilike '%orzech%';
select idczekoladki, nazwa, czekolada, orzechy, nadzienie from cukiernia.czekoladki where nazwa ~~* '%orzech%';
select idczekoladki, nazwa, czekolada, orzechy, nadzienie from cukiernia.czekoladki where nazwa ~* 'orzech';
select idczekoladki, nazwa, czekolada, orzechy, nadzienie from cukiernia.czekoladki where nazwa ~ '(O|o)rzech';

/* rozpoczyna się na literę 'S' i zawiera w środku literę 'm', */
select idczekoladki, nazwa, czekolada, orzechy, nadzienie from cukiernia.czekoladki where nazwa like 'S%m%';
select idczekoladki, nazwa, czekolada, orzechy, nadzienie from cukiernia.czekoladki where nazwa ~~ 'S%m%';
select idczekoladki, nazwa, czekolada, orzechy, nadzienie from cukiernia.czekoladki where nazwa ~ '^S(.*)m';
-- Tutaj działa ^S(.*)m dlatego że ~ przeszukuje całego stringa a nie dopasowuje jedynie pattern. Gdyby tak było, trzeba by użyć ^S(.*)m(.*)

/* zawiera słowo 'maliny' lub 'truskawki', */
select idczekoladki, nazwa, czekolada, orzechy, nadzienie from cukiernia.czekoladki where (nazwa like '%maliny%') or (nazwa like '%truskawki%');
select idczekoladki, nazwa, czekolada, orzechy, nadzienie from cukiernia.czekoladki where (nazwa ~~ '%maliny%') or (nazwa ~~ '%truskawki%');
select idczekoladki, nazwa, czekolada, orzechy, nadzienie from cukiernia.czekoladki where nazwa ~ 'maliny|truskawki';
select idczekoladki, nazwa, czekolada, orzechy, nadzienie from cukiernia.czekoladki where nazwa similar to '%(maliny|truskawki)%';
			/* It is similar to LIKE, except that it interprets the pattern using the SQL standard's definition of a regular expression.
			 * SQL regular expressions are a curious cross between LIKE notation and common regular expression notation.
			 * https://www.postgresql.org/docs/9.0/static/functions-matching.html
			 *
			 * Generalnie: similar to jest wolniejsze od ~ (czyli czyste regex), bo w implemenacji zawsze jest tłumaczone na regex.
			 *
			 * Różnica miedzy regex (~) a LIKE:
			 * ~ przeszukuje CAŁEGO stringa żeby znaleźć pattern, LIKE wykorzystuje patterny pisane po "sql-owemu" - używając "%".
			 */

/* nie rozpoczyna się żadną z liter: 'D'-'K', 'S' i 'T', */
select idczekoladki, nazwa, czekolada, orzechy, nadzienie from cukiernia.czekoladki where nazwa !~ '^[D-K]|S|K';

/* rozpoczyna się od 'Slod' ('Słod'), */
select idczekoladki, nazwa, czekolada, orzechy, nadzienie from cukiernia.czekoladki where nazwa like 'SÅ‚od%';
select idczekoladki, nazwa, czekolada, orzechy, nadzienie from cukiernia.czekoladki where nazwa ~~ 'SÅ‚od%';
select idczekoladki, nazwa, czekolada, orzechy, nadzienie from cukiernia.czekoladki where nazwa ~ '^SÅ‚od';

/* składa się dokładnie z jednego słowa */
select idczekoladki, nazwa, czekolada, orzechy, nadzienie from cukiernia.czekoladki where nazwa not like '% %';
select idczekoladki, nazwa, czekolada, orzechy, nadzienie from cukiernia.czekoladki where nazwa !~~ '% %';
select idczekoladki, nazwa, czekolada, orzechy, nadzienie from cukiernia.czekoladki where nazwa !~ '\s';

/*
	WAŻNE:
	like, ~~    - case-sensitive
	ilike, ~~*  - case-insensitive (charakterystyczne dla postgresql, nie wystpuje w standardzie sql-a)
*/
