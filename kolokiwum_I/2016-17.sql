-- https://wiki.stosowana.pl/_media/przedmioty/v_semestr/bazy_danych/kolokwia/2016-17/kolos_i_grb_2016-17.pdf

/* Zadanie.1 (2p) Wyświetl informacje o składnikach (nazwa, id_skladnika), których masa
jest pomiędzy 10 a 30 gram, oraz id_typ = 100 */
select nazwa, id_skladnika from skladniki where (masa between 10 and 30) and id_typ=100;

/* Zadanie.2 (2p) Wyświetl informacje o zamówieniach z grudnia 2015 */
select * from zamowienia where (extract data from data_realizacji) = 12;

/* Zadanie.3 (2p) Wyświetl informacje o bazowych naleśnikach, które miały w opisie słowo
"pikantny". Uwzględnij, że słowo może pojawić się na początku opisu (czyli może tez być
"Pikantny") */
select * from bazowe_nalesniki where opis ilike '%pikantny%';

/* Zadanie.4 (2p)Używając jednego z tych operatorów: UNION, EXCEPT, INTERSECT wyświetl
informacje o klientach, którzy nie złożyli żadnego zamówienia */
select idklienta from klienci
except 
select idklienta from zamowienia;

/* Zadanie.5 (4p)Wyświetl adresy, na które przynajmniej raz zamówiono naleśnik o nazwie
"Hawajski" */
select distinct on (a.id_adresu) a.ulica, a.numer_domu, a.numer_mieszkania
from adresy a natural join klienci natural join zamowienia natural join kompozycja k join bazowe_nalesniki bn on k.id_bazowego_nalesnika=bn.id_nalesnika
where bn.nazwa="Hawajski";

/* Zadanie.6 (4p)Zlicz wszystkie dodatkowe składniki, jakie zostały zamówione dnia 21 grudnia
2015 */
select sum(*) from zamowienia z natural join kompozycje k natural join dodatkowe_skladniki natural join skladniki s
where extract(year from z.data_realizacji)=2015 and extract(month from z.data_realizacji)=12 and extract(day from z.data_realizacji)=21;

/* Zadanie.7 (5p)Wyświetl informacje o naleśnikach (id, nazwa) w których średni koszt składników
jest większy niż średni koszt składników naleśnika o id=2 */
select id_nalesnika, avg(koszt) from bazowe_nalesniki bn natural join zawartosc_nalesnika zn natural join skladniki group by id_skladnika
having avg(koszt) >
(select avg(koszt) from bazowe_nalesniki bn natural join zawartosc_nalesnika zn natural join skladniki group by id_skladnika having id_bazowego_nalesnika=2);
-- LUB
select id_nalesnika, avg(koszt) from bazowe_nalesniki bn natural join zawartosc_nalesnika zn natural join skladniki group by id_skladnika
having avg(koszt) >
(select avg(koszt) from bazowe_nalesniki bn natural join zawartosc_nalesnika zn natural join skladniki where id_bazowego_nalesnika=2);

/* Zadanie.8 (2p) Powiększ o 20% koszt naleśników, których id_nalesnika < 3 */
update bazowe_nalesniki set koszt=1.2*koszt where id_nalesnika<3;

/* Zadanie.9 (2p) Wstaw rekord do tabeli adresy. Wartości:
(id_adresu=’dw5’, id_klienta=48,ulica=’Imperatora Dudy’, nr_domu=49), nr_mieszkania:
nieznany */
insert into adresy values('dw5', 48, ’Imperatora Dudy’, 49, null);
-- LUB:
insert into adresy(id_adresu,id_klienta,ulica,nr_domu) values('dw5', 48, ’Imperatora Dudy’, 49);


-- https://wiki.stosowana.pl/_media/przedmioty/v_semestr/bazy_danych/kolokwia/2016-17/kolokwium1-20162017.pdf
/* 3. (2p) Napisz zapytanie w języku SQL wyświetlające informacje na temat klientów
(id_klienta, nazwa) którzy posiadają dwuczłonowe nazwisko. Możesz założyć, że
nazwisko dwuczłonowe jest rozdzielone łącznikiem (znak ‘-’). */
select * from klienci where nazwa like '%-%';

/* 4. (2p) Korzystając z operatorów UNION, INTERSECT lub EXCEPT napisz zapytanie w
języku SQL wyświetlające identyfikatory składników które były zamawiane jako
składniki dodatkowe, a nie występują w żadnym z naleśników bazowych. */

-- TODO

/* 5. (4p) Napisz zapytanie w języku SQL wyświetlające informacje na temat bazowych
naleśników (id_nalesnika, nazwa) które zostały zamówione przez klienta o nazwie
“Anna Wolna”. */
select * from bazowe_nalesniki natural join kompozycje k natural join zamowienia join klienci k using(id_klienta) where k.nazwa=“Anna Wolna”;

/* 7. (5p) Napisz zapytanie w języku SQL wyświetlające informacje o klientach (id_klienta,
nazwa), którzy zamówili więcej naleśników niż klient od identyfikatorze 2. */

-- TODO