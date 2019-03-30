/* baza danych: cukiernia

Napisz zapytanie w języku SQL wyświetlające informacje na temat: 

(Uwaga: Upewnij się, że zapytania zwracają sensowne dane, np. liczba zamówień w styczniu niezależnie od roku jest bezsensowna.)*/


/* 1. liczby zamówień na poszczególne kwartały, */
select count(idzamowienia) as "Liczba zamówień", (extract(quarter from datarealizacji) :: int ||'-'|| extract(year from datarealizacji) :: int) as "Kwartał"
from cukiernia.zamowienia
group by (extract(quarter from datarealizacji) :: int ||'-'|| extract(year from datarealizacji) :: int);


/* 2. liczby zamówień na poszczególne miesiące, */
select count(idzamowienia) as "Liczba zamówień", (extract(month from datarealizacji)||'-'||extract(year from datarealizacji)) as "miesiąc-rok"
from cukiernia.zamowienia
group by (extract(month from datarealizacji)||'-'||extract(year from datarealizacji));


/* 3. liczby zamówień do realizacji w poszczególnych tygodniach, */
select count(idzamowienia) as "Liczba zamówień", (extract(week from datarealizacji) :: int ||' week of '|| extract(year from datarealizacji) :: int) as "Tydzień"
from cukiernia.zamowienia
group by (extract(week from datarealizacji) :: int ||' week of '|| extract(year from datarealizacji) :: int);


/* 4. liczby zamówień do realizacji w poszczególnych miejscowościach. */
select count(idzamowienia) as "Liczba zamówień", miejscowosc
from cukiernia.zamowienia join cukiernia.klienci using(idklienta)
group by miejscowosc;