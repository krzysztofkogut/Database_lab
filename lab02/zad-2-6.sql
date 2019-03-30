/* baza danych: cukiernia

Napisz zapytanie w języku SQL, które wyświetli czekoladki których:

1. masa mieści się w przedziale od 15 do 24 g lub koszt produkcji mieści się w przedziale od 15 do 24 gr */
select nazwa, masa, koszt from cukiernia.czekoladki where masa between 15 and 24 or koszt between 0.15 and 0.24;

/* 2. masa mieści się w przedziale od 15 do 24 g i koszt produkcji mieści się w przedziale od 15 do 24 gr lub masa mieści się w przedziale od 25 do 35 g i koszt produkcji mieści się w przedziale od 25 do 35 gr */
select nazwa, masa, koszt from cukiernia.czekoladki where
		masa between 15 and 24
		and
		koszt between 0.15 and 0.24
	or
		masa between 15 and 24
		and
		koszt between 0.25 and 0.35;

/* 3. masa mieści się w przedziale od 15 do 24 g i koszt produkcji mieści się w przedziale od 15 do 24 gr */
select nazwa, masa, koszt from cukiernia.czekoladki where
	masa between 15 and 24
	and
	koszt between 0.15 and 0.24;

/* 4. masa mieści się w przedziale od 25 do 35 g, ale koszt produkcji nie mieści się w przedziale od 25 do 35 gr */
select nazwa, masa, koszt from cukiernia.czekoladki where
	masa between 25 and 35
	and
	not koszt between 0.25 and 0.35;

/* 5. masa mieści się w przedziale od 25 do 35 g, ale koszt produkcji nie mieści się ani w przedziale od 15 do 24 gr, ani w przedziale od 25 do 35 gr */
select nazwa, masa, koszt from cukiernia.czekoladki where
	masa between 25 and 35
	and
	not koszt between 0.15 and 0.24
	and
	not koszt between 0.25 and 0.35;
