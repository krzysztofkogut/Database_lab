/* baza danych: cukiernia

Napisz zapytanie w języku SQL wyświetlające informacje na temat zamówień (data realizacji, idzamowienia), które: */

/* zostały złożone przez klienta, który ma na imię Antoni, */
select nazwa, datarealizacji, idzamowienia from cukiernia.klienci natural join cukiernia.zamowienia where nazwa like '%Antoni';

/* zostały złożone przez klientów z mieszkań (zwróć uwagę na pole ulica), */
select ulica, datarealizacji, idzamowienia from cukiernia.klienci natural join cukiernia.zamowienia where ulica like '%/%';

/* zostały złożone przez klienta z Krakowa do realizacji w listopadzie 2013 roku. */
select miejscowosc, z.datarealizacji from cukiernia.klienci natural join cukiernia.zamowienia z
	where extract(month from z.datarealizacji)=11 and extract(year from z.datarealizacji)=2013;
