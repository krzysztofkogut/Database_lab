/* baza danych: cukiernia, oprogramowanie: psql */

/* 1. W pliku zapytanie1.sql umieść zapytanie wyświetlające pola: idczekoladki, nazwa i opis z tabeli czekoladki. Wykonaj skrypt z poziomu psql. */
/* 2. Zmodyfikuj skrypt tak, aby wynik w formacie HTML był umieszczany w pliku zapytanie1.html. */

\pset
\o zapytanie1.html
select idczekoladki, nazwa, opis from  cukiernia.czekoladki;
