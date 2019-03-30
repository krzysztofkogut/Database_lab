/* Zadanie 1.1
1. Połącz się ze swoją bazą danych. Przetestuj działanie poleceń: \l, \dt, \dn */
psql -U postgres
/*
\l - wyświetla listę baz danych
\dt - wyświetla listę tabel w bieżżącej bazie
\dn - wyświetla nazwy schematów
*/

/* 1.Pobierz plik cukiernia.sql, otwórz go w edytorze i przeanalizuj jego zawartość.
2.Wykonaj skrypt: \i cukiernia.sql
3.Ponownie wykonaj polecenie \dt.
4.Wykonaj poniższe zapytania: */
SELECT nazwa, opis FROM czekoladki;
SELECT nazwa, cena, stan FROM pudelka;
SELECT * FROM klienci;
/* Co ciekawego się stało? */
DROP TABLE ziemniaki; -- usuwa tabelę
CREATE TABLE ziemniaki (
  id integer not null,
  nazwa varchar(30) not null
); -- tworzy tabelę

/* Zadanie 1.2
1.Pobierz plik schemat_siatkowka.sql, otwórz go w edytorze i przeanalizuj jego zawartość.
2.Uruchom psql z katalogu, w którym zapisałeś skrypt.
3.Utwórz schemat siatkowka: create schema siatkowka;
4.Wykonaj skrypt: \i schemat_siatkowka.sql
5.Wykonaj polecenia \dn i \dt i przeanalizuj ich wyniki.
Co ciekawego się stało? */
create table siatkowka.druzyny (
  iddruzyny varchar(5) primary key,
  nazwa varchar(40) not null,
  miasto varchar(30) not null
); -- tworzy tabelę w obrębie schematu siatkowka
insert into siatkowka.druzyny values('alubb', 'BKS Aluprof', 'Bielsko-Biała');

/* zatem schemat jest grupą tabel w obrębie jednej bazy

6. Wykonaj zapytanie select imie, nazwisko from siatkarki; Dlaczego serwer generuje błąd? Jak należy zmodyfikować zapytanie? */
select imie, nazwisko from siatkowka.siatkarki; -- czemu? do tabel w schematach można się dostać tylko warstwowo poprzez te schamty

/* Wykonaj poniższe polecenia. Przeanalizuj wyniki ich działania. */
set search_path to siatkowka;
\dt
select imie, nazwisko from siatkarki;
set search_path to public;
select imie, nazwisko from siatkarki;
set search_path to public, siatkowka;
\dt

/* Wykonując zapytanie SQL silnik bazy danych domyślnie szuka obiektów w schematach, których nazwy umieszczone są w zmiennej środowiskowej search_path. Aby wyświetlić zawartość zmiennej środowiskowej należy skorzystać z polecenia show tj. show search_path.

UWAGA: w przypadku mamy schema1.table oraz schema2.table i wywołamy */
SET SEARCH_PATH TO schema2, schema1;
/* to w search_path zapisze się TYLKO table z schema2! */



/* Zadanie 1.3

5. Korzystając z możliwości filtrowania danych, wyszukaj dane o czekoladkach:

które są w mlecznej czekoladzie;*/
SELECT * FROM czekoladki WHERE czekolada='mleczna';

/* które są w mlecznej czekoladzie i zawierają orzechy laskowe; */
SELECT * FROM czekoladki WHERE czekolada='mleczna' AND orzechy='laskowe';

/* które są w mlecznej lub w gorzkiej czekoladzie (użyj in); */
SELECT * FROM czekoladki WHERE czekolada IN ('mleczna', 'gorzka');

/* których masa jest większa niż 25 g */
SELECT * FROM czekoladki WHERE masa>25;

/* 6. Korzystając z możliwości filtrowania danych, wyszukaj dane o klientach:
którzy są z Gdańska, Krakowa lub Warszawy; */
SELECT * FROM klienci WHERE miejscowosc IN ('GdaÅ„sk', 'KrakÃ³w', 'Warszawa');

/* którzy nie są z Gdańska; */
SELECT * FROM klienci WHERE NOT miejscowosc='GdaÅ„sk';

/* którzy mieszkają (mają siedzibę) przy ulicy Akacjowej (UWAGA: możliwe różne numery, patrz uwaga o LIKE poniżej) */
SELECT * FROM klienci WHERE ulica LIKE 'Akacjowa%';
