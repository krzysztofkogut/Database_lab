/* baza danych: cukiernia, oprogramowanie: psql

Polecenie COPY pozwala m.in. kopiowanie danych między bazą danych i standardowym systemem plików.
Polecenie COPY FROM kopiuje dane z pliku do wskazanej tabeli. Domyślnie wartości atrybutów są oddzielane
tabulatorem, zaś NULL jest oznaczany symbolem \N. Polecenie COPY TO kopiuje dane z bazy danych (cała tabela,
wybrane kolumny lub wynik instrukcji SELECT) do pliku. Opcje polecenia pozwalają zdefiniować m.in. separator,
oznaczenia wartości null, oznaczenie napisu pustego itp. http://www.postgresql.org/docs/9.1/static/sql-copy.html

Napisz skrypt zawierający instrukcje COPY wstawiające do bazy danych cukiernia dwa nowe rekordy do tabeli pudelka
oraz odpowiednie rekordy związane z tymi pudełkami do tabeli zawartosc. Każde z nowych pudełek ma zawierać łącznie
co najmniej 10 czekoladek, w co najmniej 4 różnych smakach. */

/* W PSQL: */
\copy cukiernia.pudelka from './zad-6-7-resources/pudelka.txt' with (format csv);

\copy cukiernia.zawartosc from './zad-6-7-resources/zawartosc.txt' with (format csv, delimiter('|'));