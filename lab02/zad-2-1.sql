/* baza danych: cukiernia

Napisz zapytanie w języku SQL, które:

1. wyświetla listę klientów (nazwa, ulica, miejscowość) posortowaną według nazw klientów, */
SELECT nazwa, ulica, miejscowosc FROM cukiernia.klienci ORDER BY nazwa;

/* 2. wyświetla listę klientów posortowaną malejąco według nazw miejscowości, a w ramach tej samej miejscowości rosnąco według nazw klientów */
SELECT nazwa, miejscowosc FROM cukiernia.klienci ORDER BY miejscowosc, nazwa;

/* 3. wyświetla listę klientów z Krakowa lub z Warszawy posortowaną malejąco według nazw miejscowości, a w ramach tej samej miejscowości rosnąco według nazw klientów (zapytanie utwórz na dwa sposoby stosując w kryteriach or lub in). */
SELECT nazwa, miejscowosc FROM cukiernia.klienci WHERE miejscowosc IN ('Warszawa', 'KrakÃ³w') order by miejscowosc desc, nazwa asc;
SELECT nazwa, miejscowosc FROM cukiernia.klienci WHERE miejscowosc= 'Warszawa' or miejscowosc='KrakÃ³w' order by miejscowosc desc, nazwa asc;

/* 4.  wyświetla listę klientów posortowaną malejąco według nazw miejscowości */
select nazwa, miejscowosc from cukiernia.klienci order by miejscowosc desc;

/* 5. wyświetla listę klientów z Krakowa posortowaną według nazw klientów. */
select nazwa, miejscowosc from cukiernia.klienci where miejscowosc='KrakÃ³w' order by nazwa;
