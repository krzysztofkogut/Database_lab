/* baza danych: cukiernia

Napisz skrypt zawierający instrukcje INSERT wstawiające do bazy danych Cukiernia dwa nowe rekordy do tabeli Pudelka
oraz odpowiednie rekordy związane z tymi pudełkami do tabeli Zawartosc. Każde z nowych pudełek ma zawierać łącznie
co najmniej 10 czekoladek, w co najmniej 4 różnych smakach. */

insert into cukiernia.pudelka values('poez','Poezja Mickiewicza',null,18,400), ('nwgb','Niebo w gebie',null,25,500);

insert into cukiernia.zawartosc (select 'poez', idczekoladki, 1 from cukiernia.czekoladki where koszt between 0.25 and 0.27);
insert into cukiernia.zawartosc (select 'nwgb', idczekoladki, 1 from cukiernia.czekoladki where nadzienie in ('krem','marcepan'));