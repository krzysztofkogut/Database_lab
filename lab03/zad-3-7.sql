/* Napisz skrypt składający się z poleceń psql, który wykona zapytanie (użyj dowolnego zapytania z zadania 3.6) oraz zwróci jego wynik jako dokument HTML (nie zapomnij o znacznikach html, body itd.), gdzie odpowiedź serwera będzie tabelą HTML.

UWAGA: Przydatne polecenia: \H \echo \T \pset */

\o wynik.html
\pset format html /* -- ustawia format wyjścia na html (jakby tutaj użyć \H, to po wywołaniu skryptu by było naprzemiennie aligned i unaligned) */

\echo <html>
\echo <header><title>Zad-3-7</title></header>
\echo <body>

\pset border 2
/* BEGIN: zapytanie z poprzedniego zadania */
select
	idmeczu,
	gospodarze[1] + gospodarze[2] + gospodarze[3] + coalesce(gospodarze[4], 0) + coalesce(gospodarze[5], 0) as "Suma punktów gospodarzy",
	goscie[1] + goscie[2] + goscie[3] + coalesce(goscie[4], 0) + coalesce(goscie[5], 0) as "Suma punktów gości"
from siatkowka.statystyki;
/* END: zapytanie z poprzedniego zadania */

\echo </body>
\echo </html>

/* --------------------------------------------
żeby uruchomić skrypt: \i zad-3-7.sql
----------------------------------------------- */
