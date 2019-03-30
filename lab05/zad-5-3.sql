/* baza danych: cukiernia

Napisz zapytanie w języku SQL wyświetlające informacje na temat: */

/* 1. liczby zamówień na poszczególne dni, */
select count(idzamowienia), datarealizacji from cukiernia.zamowienia group by datarealizacji;

/* 2. łącznej liczby wszystkich zamówień, */
select count(idzamowienia) from cukiernia.zamowienia;

/* 3. łącznej wartości wszystkich zamówień, */
select sum(a.sztuk*p.cena) from cukiernia.artykuly a join cukiernia.pudelka p using(idpudelka);

/* dodatkowo: koszt wykonania zamówień :) */
select sum(a.sztuk * z.sztuk * c.koszt) as wartosc from cukiernia.artykuly a join cukiernia.zawartosc z using(idpudelka) join cukiernia.czekoladki c using(idczekoladki)

/* 4. klientów, liczby złożonych przez nich zamówień i łącznej wartości złożonych przez nich zamówień. */
select k.nazwa as "Klient", sum(a.sztuk * p.cena) as "Wartość zamowien", count(z.idzamowienia) as "Liczba zamówień"  from cukiernia.klienci k
join cukiernia.zamowienia z using(idklienta) join cukiernia.artykuly a using(idzamowienia) join cukiernia.pudelka p using(idpudelka)
group by k.idklienta
order by k.nazwa;
