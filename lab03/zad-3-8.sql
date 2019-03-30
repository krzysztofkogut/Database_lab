/* Napisz skrypt składający się z poleceń psql, który wykona zapytanie (użyj dowolnego zapytania z zadania 3.6, ale innego niż w zadaniu 3.7) oraz zwróci jego wynik jako dokument tekstowy z polami oddzielonymi przecinkami (Comma Separated Values), z jednym rekordem w jednej linii.

UWAGA: Przydatne polecenia: \a \pset fieldsep \t */

\o wynik.txt
\pset fieldsep ','
\pset tuples_only
/* to samo co \t - zwraca same rekordy bez nagłówków i licznika rekordów, niestety działa on/off */ 

/* BEGIN: zapytanie z zadania 3-6 */
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
/* END: zapytanie z zadania 3-6 */
