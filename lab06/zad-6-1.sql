/* baza danych: cukiernia */

/* 1. Napisz i wykonaj zapytanie (użyj INSERT), które dodaje do tabeli czekoladki następujące informacje:

idczekoladki: W98,
nazwa: Biały kieł,
czekolada: biała,
orzechy: laskowe,
nadzienie: marcepan,
opis: Rozpływające się w rękach i kieszeniach,
koszt: 45 gr,
masa: 20 g. */

insert into cukiernia.czekoladki(idczekoladki, nazwa, czekolada, orzechy, nadzienie, opis, koszt, masa)
values('W98','Biały kieł','biała','laskowe','marcepan','Rozpływające się w rękach i kieszeniach',0.45,20);


/* 2. Napisz i wykonaj trzy zapytania (użyj INSERT), które dodadzą do tabeli klienci następujące dane osobowe:

idklienta: 90,
nazwa: Matusiak Edward, 
ulica: Kropiwnickiego 6/3,
miejscowosc: Leningrad,
kod: 31-471,
telefon: 031 423 45 38, */

insert into cukiernia.klienci(idklienta, nazwa, ulica, miejscowosc, kod, telefon)
values(90,'Matusiak Edward','Kropiwnickiego 6/3','Leningrad','31-471','031 423 45 38');


/* 3. Dodaj do tabeli klienci dane Izy Matusiak (idklienta 93). Pozostałe dane osobowe Izy Matusiak muszą być takie
 * same jak dla Pana Edwarda Matusiaka. Użyj podzapytań. */

-- I SPOSÓB:
insert into cukiernia.klienci(idklienta, nazwa, ulica, miejscowosc, kod, telefon)
values(93, 'Matusiak Iza',
(select ulica from cukiernia.klienci where idklienta=90),
(select miejscowosc from cukiernia.klienci where idklienta=90),
(select kod from cukiernia.klienci where idklienta=90),
(select telefon from cukiernia.klienci where idklienta=90)
);

-- II SPOSÓB:
insert into cukiernia.klienci (select 95, 'Matusiak Iza', ulica, miejscowosc, kod, telefon from cukiernia.klienci where idklienta=
(SELECT idklienta from cukiernia.klienci where nazwa='Matusiak Edward')) returning *;

-- III SPOSÓB:
insert into cukiernia.klienci (select 97, 'Matusiak Iza', ulica, miejscowosc, kod, telefon from cukiernia.klienci
where cukiernia.klienci.nazwa='Matusiak Edward') returning *;