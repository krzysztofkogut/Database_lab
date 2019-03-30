/* baza danych: cukiernia

Napisz instrukcje aktualizujące dane w bazie cukiernia. Sprawdź za pomocą instrukcji SELECT, czy odpowiednie rekordy zostały zmienione. */

/* 1. Zmiana nazwiska Izy Matusiak na Nowak. */
update cukiernia.klienci set nazwa='Nowak Iza' where nazwa='Matusiak Iza';
select * from cukiernia.klienci where nazwa like '%Iza%';


/* 2. Obniżenie kosztu czekoladek o identyfikatorach (idczekoladki): W98, M98 i X91, o 10%. */
update cukiernia.czekoladki set koszt=0.9*koszt where idczekoladki in ('W98','M98','X91');
select * from cukiernia.czekoladki where idczekoladki in ('W98','M98','X91');


/* 3. Ustalenie kosztu czekoladek o nazwie Nieznana Nieznajoma na taką samą jak cena czekoladki o identyfikatorze W98. */
update cukiernia.czekoladki set koszt=(select koszt from cukiernia.czekoladki where idczekoladki='W98') where nazwa='Nieznana Nieznajoma';
select * from cukiernia.czekoladki where idczekoladki='W98' or nazwa='Nieznana Nieznajoma';


/* 4. Zmiana nazwy z Leningrad na Piotrograd w tabeli klienci. */
update cukiernia.klienci set miejscowosc='Piotrograd' where miejscowosc='Leningrad';
select * from cukiernia.klienci where miejscowosc='Piotrograd';


/* 5. Podniesienie kosztu czekoladek, których dwa ostatnie znaki identyfikatora (idczekoladki) są większe od 90, o 15 groszy. */
update cukiernia.czekoladki set koszt=koszt+0.15 where right(idczekoladki, 2)::int > 90;
select right(idczekoladki, 2), koszt from cukiernia.czekoladki where right(idczekoladki, 2)::int > 90;