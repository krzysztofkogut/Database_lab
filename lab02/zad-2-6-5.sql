/* 5. masa mieści się w przedziale od 25 do 35 g, ale koszt produkcji nie mieści się ani w przedziale od 15 do 24 gr, ani w przedziale od 25 do 35 gr */
select nazwa, masa, koszt from cukiernia.czekoladki where
	masa between 25 and 35
	and
	not koszt between 0.15 and 0.24
	and
	not koszt between 0.25 and 0.35;
