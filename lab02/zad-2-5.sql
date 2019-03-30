/* baza danych: cukiernia

Napisz zapytanie w języku SQL wyświetlające informacje na temat czekoladek (idCzekoladki, nazwa, czekolada, orzechy, nadzienie), które:

1. zawierają jakieś orzechy */
select idczekoladki, nazwa, czekolada, orzechy, nadzienie from cukiernia.czekoladki where orzechy is not null;

/* 2. nie zawierają orzechów */
select idczekoladki, nazwa, czekolada, orzechy, nadzienie from cukiernia.czekoladki where orzechy is null;

/* 3. zawierają jakieś orzechy lub jakieś nadzienie */
select idczekoladki, nazwa, czekolada, orzechy, nadzienie from cukiernia.czekoladki where orzechy is not null or nadzienie is not null;

/* 4. są w mlecznej lub białej czekoladzie (użyj IN) i nie zawierają orzechów */
select idczekoladki, nazwa, czekolada, orzechy, nadzienie from cukiernia.czekoladki where czekolada in ('mleczna', 'biaÅ‚a') and orzechy is null;

/* 5. nie są ani w mlecznej ani w białej czekoladzie i zawierają jakieś orzechy lub jakieś nadzienie */
select idczekoladki, nazwa, czekolada, orzechy, nadzienie from cukiernia.czekoladki where czekolada != 'mleczna' and czekolada != 'biaÅ‚a' and (orzechy is not null or nadzienie is not null);

/* 6. zawierają jakieś nadzienie */
select idczekoladki, nazwa, czekolada, orzechy, nadzienie from cukiernia.czekoladki where nadzienie is not null;

/* 7. nie zawierają nadzienia */
select idczekoladki, nazwa, czekolada, orzechy, nadzienie from cukiernia.czekoladki where nadzienie is null;

/* 8. nie zawierają orzechów ani nadzienia */
select idczekoladki, nazwa, czekolada, orzechy, nadzienie from cukiernia.czekoladki where orzechy is null and nadzienie is null;

/* 9. są w mlecznej lub białej czekoladzie i nie zawierają nadzienia */
select idczekoladki, nazwa, czekolada, orzechy, nadzienie from cukiernia.czekoladki where czekolada in ('mleczna','biaÅ‚a') and nadzienie is null;
