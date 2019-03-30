/* baza danych: cukiernia

Korzystając z operatorów UNION, INTERSECT, EXCEPT napisz zapytanie w języku SQL wyświetlające: */

/* identyfikatory klientów, którzy nigdy nie złożyli żadnego zamówienia, */
select idklienta from cukiernia.klienci
	except
select idklienta from cukiernia.zamowienia;		-- to zapytanie zwraca zero rekordów, dlatego że każdy klient coś kiedyś zamówił - dlatego w sumie jest klientem xD

/* nazwy klientów, czekoladek i pudełek, które zawierają rz (lub Rz), */
select nazwa from cukiernia.klienci where nazwa ilike '%rz%'
	union
select nazwa from cukiernia.czekoladki where nazwa ilike '%rz%'
	union
select nazwa from cukiernia.pudelka where nazwa ilike '%rz%';

/* identyfikatory czekoladek, które nie występują w żadnym pudełku. */
select idczekoladki from cukiernia.czekoladki
	except
select idczekoladki from cukiernia.zawartosc;	-- trzeba uważać żeby pojemniejszy zbiór był wcześniej 
