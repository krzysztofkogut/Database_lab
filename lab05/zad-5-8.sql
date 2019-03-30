/* baza danych: cukiernia

Napisz zapytanie wyświetlające: liczbę porządkową i identyfikator pudełka czekoladek (idpudelka). Identyfikatory pudełek mają być posortowane alfabetycznie, rosnąco.
Liczba porządkowa jest z przedziału 1..N, gdzie N jest ilością pudełek.

Uwaga: Można zastosować samozłączenie. */

select row_number() over (order by idpudelka), idpudelka from cukiernia.pudelka;