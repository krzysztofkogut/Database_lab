/* baza danych: cukiernia

Napisz zapytanie w języku SQL wyświetlające informacje na temat czekoladek (IDCzekoladki, Nazwa, Masa, Koszt), których:

1. masa mieści się w przedziale od 15 do 24 g */
select idczekoladki, nazwa, masa, koszt from cukiernia.czekoladki where masa>=15 and masa<=24;

/* 2. koszt produkcji mieści się w przedziale od 25 do 35 gr */
select idczekoladki, nazwa, masa, koszt from cukiernia.czekoladki where koszt*100>=25 and koszt*100<=35;

/* 3. masa mieści się w przedziale od 25 do 35 g lub koszt produkcji mieści się w przedziale od 15 do 24 gr */
select idczekoladki, nazwa, masa, koszt from cukiernia.czekoladki where (masa between 25 and 34) and (koszt between 0.15 and 0.24);
