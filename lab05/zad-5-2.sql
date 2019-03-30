/* baza danych: cukiernia

Napisz zapytanie w języku SQL wyświetlające informacje na temat: */

/* 1. masy poszczególnych pudełek, */
select z.idpudelka, sum(z.sztuk * c.masa) as "Masa pudełka" from cukiernia.zawartosc z
	join cukiernia.czekoladki c using(idczekoladki)
		group by z.idpudelka;

/* 2. pudełka o największej masie, */
select * from cukiernia.pudelka
	where idpudelka=(select z.idpudelka from cukiernia.zawartosc z
						join cukiernia.czekoladki c using(idczekoladki)
							group by z.idpudelka
								order by sum(z.sztuk * c.masa) desc
									limit 1);

select z.idpudelka, sum(z.sztuk * c.masa) from cukiernia.zawartosc z join cukiernia.czekoladki c using(idczekoladki)
group by z.idpudelka order by sum(z.sztuk * c.masa);

/* 3. średniej masy pudełka w ofercie cukierni, */
select avg(p.masa_pudelka)
from (
	select sum(z.sztuk * c.masa) as masa_pudelka
	from cukiernia.zawartosc z
	natural join cukiernia.czekoladki c
	group by z.idpudelka) p;
	
-- trzeba tak j.w. bo funkcji agregujących nie można zagnieżdżać

/* 4. średniej wagi pojedynczej czekoladki w poszczególnych pudełkach, */
select z.idpudelka, sum(c.masa * z.sztuk)/sum(z.sztuk) as "Średnia masa czekoladki"
from cukiernia.zawartosc z
join cukiernia.czekoladki c using(idczekoladki)
group by z.idpudelka;