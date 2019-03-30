/* baza danych: cukiernia

Napisz zapytanie w języku SQL oparte na tabeli Klienci, które: */

/* wyświetla nazwy miast, z których pochodzą klienci cukierni i które składają się z więcej niż jednego słowa, */
select * from cukiernia.klienci where miejscowosc like '% %'; -- w bazie takich nie ma dlatego dopisałam nastpne zapytanie:

/* wyświetla nazwy ulic, z których pochodzą klienci cukierni, mieszkający w mieszkaniach (dwuliczbowe adresy oddzielone "/") */
select ulica from cukiernia.klienci where ulica like '%/%';
select ulica from cukiernia.klienci where ulica ~ '/';

/* wyświetla nazwy i telefony klientów, którzy podali numer stacjonarny telefonu, */
select nazwa, telefon from cukiernia.klienci where telefon like '% % % %';
select nazwa, telefon from cukiernia.klienci where telefon ~ '((([\d]{3}\s)){2})(\d{2})\s(\d{2})';

/* wyświetla nazwy klientów, którzy podali numer komórkowy telefonu, */
select nazwa, telefon from cukiernia.klienci where telefon ~ '(\d{3}\s){2}(\d{3})';
