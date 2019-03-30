/* baza danych: cukiernia

Zakładając, że koszt wytworzenia pudełka czekoladek jest równy kosztowi wytworzenia zawartych w nim czekoladek, napisz zapytanie wyznaczające: */


/* 1. zysk ze sprzedaży jednej sztuki poszczególnych pudełek (różnica między ceną pudełka i kosztem jego wytworzenia), */
select idpudelka, cena,  cena - sum(sztuk * koszt) as zysk
from cukiernia.pudelka join cukiernia.zawartosc using(idpudelka) join cukiernia.czekoladki using(idczekoladki)
group by idpudelka;


/* 2. zysk ze sprzedaży ZAMÓWIONYCH pudełek, */
select sum(zysk) from (
select idzamowienia, idpudelka, a.sztuk*p.cena - sum(z.sztuk*c.koszt) as zysk
from cukiernia.artykuly a join cukiernia.pudelka p using(idpudelka) join cukiernia.zawartosc z using(idpudelka) join cukiernia.czekoladki c using(idczekoladki)
group by idzamowienia, idpudelka, a.sztuk, p.cena
order by idzamowienia) zyski;


/* 3. zysk ze sprzedaży wszystkich pudełek czekoladek w cukierni (znajdujących się na stanie)*/
select sum(p.stan*zyski_z_pudelek.zysk)
from cukiernia.pudelka p
join (select idpudelka, cena,  cena - sum(sztuk * koszt) as zysk
from cukiernia.pudelka join cukiernia.zawartosc using(idpudelka) join cukiernia.czekoladki using(idczekoladki)
group by idpudelka
order by idpudelka) zyski_z_pudelek using(idpudelka);