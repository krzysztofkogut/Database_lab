/* baza danych: cukiernia

1. Napisz zapytanie, które usunie informacje dodane w Zadaniu 6.2, użyj DELETE.
2. Sprawdź, czy odpowiednie rekordy zostały usunięte. */

delete from cukiernia.czekoladki where idczekoladki in ('X91','M98');
select * from cukiernia.czekoladki;


/* 3. Napisz i wykonaj zapytanie, które doda do tabeli czekoladki następujące pozycje, wykorzystaj nazwy kolumn w poleceniu INSERT:
IDCzekoladki: X91,
Nazwa: Nieznana Nieznajoma,
Opis: Niewidzialna czekoladka wspomagajaca odchudzanie.,
Koszt: 26 gr,
Masa: 0g, */
insert into cukiernia.czekoladki(idczekoladki, nazwa, opis, koszt, masa)
values('X91','Nieznana Nieznajoma','Niewidzialna czekoladka wspomagajaca odchudzanie.',0.26,0);

/* IDCzekoladki: M98,
Nazwa: Mleczny Raj,
Czekolada: Mleczna,
Opis: Aksamitna mleczna czekolada w ksztalcie butelki z mlekiem.,
Koszt: 26 gr,
Masa: 36g, */
insert into cukiernia.czekoladki(idczekoladki, nazwa, czekolada, opis, koszt, masa)
values('M98','Mleczny Raj','Mleczna','Aksamitna mleczna czekolada w ksztalcie butelki z mlekiem.',0.26, 36);