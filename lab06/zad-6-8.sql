/* baza danych: cukiernia */

/* 1. Napisz instrukcję UDPATE, która dla pudełek dodanych w poprzednich dwóch zadaniach,
      zwiększa o 1 liczbę czekoladek każdego smaku, które w nich występują. */

update cukiernia.zawartosc set sztuk=sztuk+1 where idpudelka in ('poez','nwgb','zztc','zjnb');


/* 2. Napisz skrypt zawierający instrukcje UPDATE, które modyfikują tabelę czekoladki
      zastępując w kolumnach: czekolada, orzechy i nadzienie wartości Null wartością “brak”. */

update cukiernia.czekoladki set czekolada='brak' where czekolada is null;
update cukiernia.czekoladki set orzechy='brak' where orzechy is null;
update cukiernia.czekoladki set nadzienie='brak' where nadzienie is null;


/* 3. Napisz skrypt zawierający instrukcje UPDATE, które anulują zmiany wprowadzone w poprzednim punkcie. */

update cukiernia.czekoladki set czekolada=null where czekolada='brak';
update cukiernia.czekoladki set orzechy=null where orzechy='brak';
update cukiernia.czekoladki set nadzienie=null where nadzienie='brak';