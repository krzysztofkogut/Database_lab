/* baza danych: cukiernia */

/* Napisz i wykonaj zapytanie, które doda do tabeli czekoladki następujące pozycje, wykorzystaj wartości NULL w poleceniu INSERT:
IDCzekoladki: X91,
Nazwa: Nieznana Nieznajoma,
Opis: Niewidzialna czekoladka wspomagajaca odchudzanie.,
Koszt: 26 gr,
Masa: 0g, */

insert into cukiernia.czekoladki values('X91','Nieznana Nieznajoma',null, null,null,'Niewidzialna czekoladka wspomagajaca odchudzanie.',0.26, 0);

/* IDCzekoladki: M98,
Nazwa: Mleczny Raj,
Czekolada: Mleczna,
Opis: Aksamitna mleczna czekolada w ksztalcie butelki z mlekiem.,
Koszt: 26 gr,
Masa: 36 g, */

insert into cukiernia.czekoladki values('M98','Mleczny Raj','Mleczna', null,null,'Aksamitna mleczna czekolada w ksztalcie butelki z mlekiem.',0.26,36);