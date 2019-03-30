/* baza danych: siatkówka

Napisz zapytanie w języku SQL wyświetlające: */

/* 1. identyfikator meczu, sumę punktów zdobytych przez gospodarzy i sumę punktów zdobytych przez gości, */
select
	idmeczu,
	gospodarze[1] + gospodarze[2] + gospodarze[3] + coalesce(gospodarze[4], 0) + coalesce(gospodarze[5], 0) as "Suma punktów gospodarzy",
	goscie[1] + goscie[2] + goscie[3] + coalesce(goscie[4], 0) + coalesce(goscie[5], 0) as "Suma punktów gości"
from siatkowka.statystyki;
-- coalesce(x,y,z,...) – funkcja zwraca pierwszą wartość z listy różną od null, wstawiając ją do najwyższego typu danych

select
	idmeczu,
	(select sum(gosp) from unnest(gospodarze) gosp) as "Suma punktów gospodarzy",
	(select sum(gosc) from unnest(goscie) gosc) as "Suma punktów gości"
from siatkowka.statystyki;
-- unnest(x) - rozwija tabele jako kolumne wartosci


/* 2. identyfikator meczu, sumę punktów zdobytych przez gospodarzy i sumę punktów zdobytych przez gości, dla meczów, które skończyły się po 5 setach
 * i zwycięzca ostatniego seta zdobył ponad 15 punktów, */
select
	idmeczu,
	(case
		when gospodarze[5] is not null
		then gospodarze[1] + gospodarze[2] + gospodarze[3] + gospodarze[4] + gospodarze[5]
	end) as "Suma punktów gospodarzy",
	goscie[1] + goscie[2] + goscie[3] + goscie[4] + goscie[5] as "Suma punktów gości"
from siatkowka.statystyki
where
	gospodarze[1] + gospodarze[2] + gospodarze[3] + gospodarze[4] + gospodarze[5] is not null and
	(gospodarze[5] > 15 or goscie[5] > 15);

/* 3. identyfikator i wynik meczu w formacie x:y, np. 3:1 (wynik jest pojedynczą kolumną – napisem), */
select
	idmeczu,
	(case when (gospodarze[1] > goscie[1]) then 1 else 0 end +
	 case when (gospodarze[2] > goscie[2]) then 1 else 0 end +
	 case when (gospodarze[3] > goscie[3]) then 1 else 0 end +
	 case when (gospodarze[4] > goscie[4]) then 1 else 0 end +
	 case when (gospodarze[5] > goscie[5]) then 1 else 0 end
	 )
	|| ':' ||
	(case when gospodarze[1] < goscie[1] then 1 else 0 end +
	 case when gospodarze[2] < goscie[2] then 1 else 0 end +
	 case when gospodarze[3] < goscie[3] then 1 else 0 end +
	 case when gospodarze[4] < goscie[4] then 1 else 0 end +
	 case when gospodarze[5] < goscie[5] then 1 else 0 end
	)
	as "wynik"
from siatkowka.statystyki

/* 4. identyfikator meczu, sumę punktów zdobytych przez gospodarzy i sumę punktów zdobytych przez gości, dla meczów, w których gospodarze zdobyli ponad 100 punktów, */
select
	idmeczu,
	gospodarze[1] + gospodarze[2] + gospodarze[3] + coalesce(gospodarze[4], 0) + coalesce(gospodarze[5], 0) as "Suma punktów gospodarzy",
	goscie[1] + goscie[2] + goscie[3] + coalesce(goscie[4], 0) + coalesce(goscie[5], 0) as "Suma punktów gości"
from siatkowka.statystyki
where gospodarze[1] + gospodarze[2] + gospodarze[3] + coalesce(gospodarze[4], 0) + coalesce(gospodarze[5], 0) > 100;

/* 5. identyfikator meczu, liczbę punktów zdobytych przez gospodarzy w pierwszym secie, sumę punktów zdobytych w meczu przez gospodarzy, dla meczów, w których pierwiastek
 * kwadratowy z liczby punktów zdobytych w pierwszym secie jest mniejszy niż logarytm o podstawie 2 z sumy punktów zdobytych w meczu.  */
select
	idmeczu,
	gospodarze[1] as "Gospodarze w I secie",
	gospodarze[1] + gospodarze[2] + gospodarze[3] + coalesce(gospodarze[4], 0) + coalesce(gospodarze[5], 0) as "Suma punktów gospodarzy"
from siatkowka.statystyki
where
	(sqrt(gospodarze[1] + goscie[1])) < log(2, (gospodarze[1] + gospodarze[2] + gospodarze[3] + coalesce(gospodarze[4], 0) + coalesce(gospodarze[5], 0)
	+ goscie[1] + goscie[2] + goscie[3] + coalesce(goscie[4], 0) + coalesce(goscie[5], 0)));
