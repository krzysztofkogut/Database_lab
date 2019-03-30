/* baza danych: cukiernia

Korzystając z zapytań z zadania 2.4 oraz operatorów UNION, INTERSECT, EXCEPT napisz zapytanie w języku SQL wyświetlające informacje na temat czekoladek (idCzekoladki, nazwa, masa, koszt), których: */

/* masa mieści się w przedziale od 15 do 24 g lub koszt produkcji mieści się w przedziale od 15 do 24 gr, */
select idczekoladki, nazwa, masa, koszt from cukiernia.czekoladki where masa between 15 and 24
	union
select idczekoladki, nazwa, masa, koszt from cukiernia.czekoladki where koszt between 0.15 and 0.24;

/* masa mieści się w przedziale od 25 do 35 g, ale koszt produkcji nie mieści się w przedziale od 25 do 35 gr, */
select idczekoladki, nazwa, masa, koszt from cukiernia.czekoladki where masa between 25 and 35
	intersect
select idczekoladki, nazwa, masa, koszt from cukiernia.czekoladki where koszt not between 0.25 and 0.35;

/* masa mieści się w przedziale od 15 do 24 g i koszt produkcji mieści się w przedziale od 15 do 24 gr lub masa mieści się w przedziale od 25 do 35 g i koszt produkcji mieści się w przedziale od 25 do 35 gr, */
select idczekoladki, nazwa, masa, koszt from cukiernia.czekoladki where masa between 15 and 24
	intersect
select idczekoladki, nazwa, masa, koszt from cukiernia.czekoladki where koszt between 0.15 and 0.24
	union
select idczekoladki, nazwa, masa, koszt from cukiernia.czekoladki where masa between 25 and 35
	intersect
select idczekoladki, nazwa, masa, koszt from cukiernia.czekoladki where koszt between 0.25 and 0.35;

/* masa mieści się w przedziale od 15 do 24 g i koszt produkcji mieści się w przedziale od 15 do 24 gr, */
select idczekoladki, nazwa, masa, koszt from cukiernia.czekoladki where masa between 15 and 24
	intersect
select idczekoladki, nazwa, masa, koszt from cukiernia.czekoladki where koszt between 0.15 and 0.24;

/* masa mieści się w przedziale od 25 do 35 g, ale koszt produkcji nie mieści się ani w przedziale od 15 do 24 gr, ani w przedziale od 29 do 35 gr. */
select idczekoladki, nazwa, masa, koszt from cukiernia.czekoladki where masa between 25 and 35
	except
(select idczekoladki, nazwa, masa, koszt from cukiernia.czekoladki where koszt between 0.15 and 0.24
	union
select idczekoladki, nazwa, masa, koszt from cukiernia.czekoladki where koszt between 0.29 and 0.35);

/*
	UNION     - działa jak OR
	INTERSECT - działa jak AND
*/
