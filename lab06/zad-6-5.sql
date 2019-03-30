/* baza danych: cukiernia

Napisz instrukcje usuwające z bazy danych informacje o: */


/* 1. klientach o nazwisku Matusiak, */
select * from cukiernia.klienci where nazwa like '%Matusiak%';
delete from cukiernia.klienci where nazwa like '%Matusiak%';


/* 2. klientach o identyfikatorze większym niż 91, */
select * from cukiernia.klienci where idklienta>91;
delete from cukiernia.klienci where idklienta>91;


/* 3. czekoladkach, których koszt jest większy lub równy 0.45 lub masa jest większa lub równa 36, lub masa jest równa 0. */
select * from cukiernia.czekoladki where koszt >=0.45 or masa >= 36 or masa=0;
delete from cukiernia.czekoladki where koszt >=0.45 or masa >= 36 or masa=0;