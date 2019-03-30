/* baza danych: cukiernia

Napisz zapytanie w języku SQL wyświetlające informacje na temat zamówień (idZamowienia, dataRealizacji), które mają być zrealizowane: */

/* 1. między 12 i 20 listopada 2013, */
select idZamowienia, datarealizacji from cukiernia.zamowienia where datarealizacji between '2013-11-12' and '2013-11-20';

/* 2. między 1 i 6 grudnia lub między 15 i 20 grudnia 2013 */
select idZamowienia, datarealizacji from cukiernia.zamowienia where (datarealizacji between '2013-12-01' and '2013-12-06') or (datarealizacji between '2013-12-15' and '2013-12-20');

/* 3. w grudniu 2013 (nie używaj funkcji date_part ani extract), */
select idZamowienia, datarealizacji from cukiernia.zamowienia where datarealizacji between '2013-12-01' and '2013-12-31';

/* 4. w listopadzie 2013 (w tym i kolejnych zapytaniach użyj funkcji date_part lub extract), */
select idZamowienia, datarealizacji from cukiernia.zamowienia where extract(month from datarealizacji) = 11;

/* 5. w listopadzie lub grudniu 2013, */
select idZamowienia, datarealizacji from cukiernia.zamowienia where extract(month from datarealizacji) in (11,12) and extract(year from datarealizacji) = 2013;
select idZamowienia, datarealizacji from cukiernia.zamowienia where date_part('month', datarealizacji) in (11,12) and date_part('year', datarealizacji) = 2013;

/* 6. 17, 18 lub 19 dnia miesiąca, */
select idZamowienia, datarealizacji from cukiernia.zamowienia where extract(day from datarealizacji) in (17,18,19);
select idZamowienia, datarealizacji from cukiernia.zamowienia where date_part('day', datarealizacji) in (17,18,19);

/* 7. 46 lub 47 tygodniu roku. */
select idZamowienia, datarealizacji from cukiernia.zamowienia where extract(week from datarealizacji) in (46,47);
select idZamowienia, datarealizacji from cukiernia.zamowienia where date_part('week', datarealizacji) in (46,47);
