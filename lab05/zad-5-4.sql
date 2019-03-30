/* baza danych: cukiernia

Napisz zapytanie w języku SQL wyświetlające informacje na temat:  */

/* 1. czekoladki, która występuje w największej liczbie pudełek, */
select idczekoladki, count(idpudelka) 
from cukiernia.zawartosc
group by idczekoladki
having count(idpudelka) = (select count(idpudelka) from cukiernia.zawartosc group by idczekoladki order by count(idpudelka) desc limit 1);


/* 2. pudełka, które zawiera najwięcej czekoladek bez orzechów, */
select idpudelka, count(idczekoladki) from cukiernia.zawartosc z join cukiernia.czekoladki c using(idczekoladki)
where c.orzechy is null
group by idpudelka
having count(idczekoladki) = 
(select count(idczekoladki) from cukiernia.zawartosc z join cukiernia.czekoladki c using(idczekoladki)
where c.orzechy is null
group by idpudelka
order by count(idczekoladki) desc limit 1);


/* 3. czekoladki, która występuje w najmniejszej liczbie pudełek, */
select idczekoladki, count(idpudelka) from cukiernia.zawartosc group by idczekoladki
having count(idczekoladki) =
(select count(idpudelka) from cukiernia.zawartosc group by idczekoladki order by count(idczekoladki) limit 1);


/* 4. pudełka, które jest najczęściej zamawiane przez klientów. */
select idpudelka, count(idzamowienia) from cukiernia.artykuly group by idpudelka
having count(idzamowienia) = (select count(idzamowienia) from cukiernia.artykuly group by idpudelka order by count(idzamowienia) desc limit 1);


/* DODATKOWO: czekoladka która nie wystepuje w żadnym pudelku */
select * from cukiernia.czekoladki where idczekoladki not in(select idczekoladki from cukiernia.zawartosc);