-- Gr. A

/* 1. (5 pkt.) Napisz zapytanie, które zwraca wszystkie ostrzezenia ( ˙ id_ostrzezenia, czas_ostrzezenia,
zmiana_poizomu) niestarsze niz półtora roku, dla których poziom rzeki wzrósł od poprzedniego pomiaru w danym punkcie o co ˙
najmniej 7%. Uwaga: atrybut zmiana_poziomu zawiera liczby, a nie procenty. */

-- I SPOSOB
select id_ostrzezenia, czas_ostrzezenia, zmiana_poizomu from ostrzezenia
where   (extract(year from now())) - (extract(year from czas_ostrzezenia) * 12 +
        (extract(month from now())) - (extract(month from czas_ostrzezenia) <= 18
  and   zmiana_poizomu*100 >= 7;

-- II SPOSOB
select id_ostrzezenia, czas_ostrzezenia, zmiana_poizomu from ostrzezenia
where   now() - czas_ostrzezenia < interval '18 months' and zmiana_poizomu*100 >= 7;

/* 2. (4 pkt.) Napisz zapytanie, które zwróci identyfikatory punktów, dla których wykonano pomiary, ale dla których w ciagu ostatnich
2 miesieecy nie zaistniało ostrzezenie (uzyj operatorów algebry relacji). */
select id_pomiaru from pomiary
except
select id_pomiaru from ostrzezenia where now() - czas_ostrzezenia >= interval '2 months';

/* 3. (5 pkt.) Napisz zapytanie, które wypisze nazwy gmin, dla których kiedykolwiek odnotowano przekroczenie stanu alarmowego.
Uwaga: zwrócone gminy nie powinny sie powtarzac w otrzymanym wyniku. */
select distinct g.nazwa from gminy g
join punkty_pomiarowe p on p.id_gminy = g.identyfikator
natural join ostrzezenia;
-- PROTIP: jakbyśmy wypisywali wiecej atrybutow to wtedy trzeba SELECT DISTINCT ON (g.nazwa) g.nazwa, ...

/* 4. (6 pkt.) Napisz zapytanie zwracające daty rekordowych (maksymalnych) poziomów wody na kazdej z rzek (wraz z ich nazwami). ˙
Rekordowy poziom wody na konkretnej rzece mógł wystąpic więcej niż raz (tzn. został zanotowany w dwa różne dni) - wtedy dana ˙
rzeka powinna pojawic się w wynikach również więcej niż raz. */
with
poziomy as (
  select czas_pomiaru::date as data, poziom_wody as poziom, r.nazwa as nazwa from pomiary natural join punkty_pomiarowe natural join rzeki r
),
najwyzsze as (
  select max(poziom) as maxpoziom, nazwa from poziomy group by nazwa 
)
select * from poziomy where (poziom, nazwa) in (select maxpoziom, nazwa from najwyzsze);

/* 5. (5 pkt.) Napisz dwa polecenia UPDATE:
1. Zmniejszające w tabeli punkty_pomiarowe wartość kolumny stan_alarmowy o 5 cm dla punkty o ID równym 10.
2. Aktualizujące wszystkie ostrzezenia dotyczące tego punktu, tj. ustawiające odpowiednią wartość kolumny ´
przekroczony_stan_alarm */
-- 1
update punkty_pomiarowe set stan_alarmowy = stan_alarmowy-5 where id_punktu=10;
update ostrzezenia set przekroczony_stan_alarm = (select poziom_wody from pomiary where id_punktu=10)

-- 2
(select * from pomiary p natural join punkty_pomiarowe pp natural join ostrzezenia o where id_punktu=10)
/* ostrzezenia.przekroczony_stan_alarm = pomiary.poziom_wody - punkty_pomiarowe.stan_alarmowy */

-- TODO


-- Gr. B
/* 1. (5 pkt.) Napisz zapytanie, które zwróci wszystkie punkty pomiarowe (id_punktu, stan_alarmowy,
stan_ostrzegawczy) z gminy o id=5, dla których poziom stanu alarmowego jest o co najmniej 5 ∗ π % wyzszy od poziomu stanu ˙
ostrzegawczego. */
select id_punktu, stan_alarmowy, stan_ostrzegawczy from punkty_pomiarowe where id_gminy=5 and (stan_alarmowy-stan_ostrzegawczy)/stan_alarmowy > 5*pi();

/* 2. (4 pkt.) Napisz zapytanie, które zwróci identyfikatory gmin z powiatu o id=1, w których nie znajduje się zaden punkt pomiarowy ˙
na rzece o id=1 (uzyj operatorów algebry relacji). */
select id_gminy from gminy where id_powiatu=1
except
select id_gminy from punkty_pomiarowe where id_rzeki=1;

/* 3. (5 pkt.) Napisz zapytanie, które zwróci informacje o wszystkich punktach pomiarowych (id_punktu, stan_alarmowy) zlokalizowanych
na rzece Wisła na terenie gminy Skoczów */
select id_punktu, stan_alarmowy from punkty_pomiarowe pp natural join rzeki r join gminy g on g.identyfikator = pp.id_gminy join powiaty p on p.identyfikator = g.id_powiatu where r.nazwa = "Wisła" and g.nazwa = "Skoczów";

/* 4. (6 pkt.) Napisz zpytanie zwracające daty rekordowych (maksymalnych) poziomów wody w kazdej gminie (wraz z ich nazwami).
Rekordowy poziom wody w konkretnej gminie mógł wystąpic więcej niż raz (wtedy w wynikach dana gmina powinna pojawić się 
równiez więcej niż raz). */

with
poziomy as (
  select czas_pomiaru::date as "data", poziom_wody as "poziom", nazwa as "nazwa" from pomiary natural join punkty_pomiarowe natural join gminy 
),
najwyzsze_poziomy as (
  select max(poziom) as "max_poziom", nazwa from poziomy group by nazwa
)
select data, nazwa from poziomy where (poziom, nazwa) in (select * from najwyzsze_poziomy);

-- PROTIP: select [column] as | max_poziom   |
--                            | "max_poziom" |
--                            | "max poziom" |       NIE: 'max_poziom', 'max poziom' (nie można aportofów)!

/* 5. (5 pkt.) Napisz zapytanie,które doda do bazy nowy punkt pomiarowy z następującymi danymi:
id_punktu=34
nr_porzadkowy=10
id_gminy=246
id_rzeki=3
dlugosc_geogr=50.134
szerokosc_geogr=22.11
stan_ostrzegawczy i stan_alarmowy: takie jak dla punktu pomiarowego o id=25 */
insert into punkty_pomiarowe(id_punktu, nr_porzadkowy, id_gminy, id_rzeki, dlugosc_geogr, szer_geogr, stan_ostrzegawczy, stan_alarmowy) values(
  34,
  10,
  246,
  3,
  50.134,
  20.11,
  (select stan_ostrzegawczy from punkty_pomiarowe where id=25),
  (select stan_alarmowy from punkty_pomiarowe where id=25)
);


/* OPIS: Baza danych zawiera informacje o odczytach poziomu wody w punktach pomiarowych ulokowanych na polskich rzekach.

Relacja punkty_pomiarowe zawiera informacje o punktach pomiarowych zlokalizowanych na rzekach. Atrybut id_punktu jest unikatowym identyfikatorem punktu pomiarowego w skali kraju. Atrybut nr_porządkowy wskazuje, który to jest punkt pomiarowy na danej rzece (licząc od źródła), np punkt pomiarowy o identyfikatorze 107 jest 3 punktem pomiarowym na Sanie. Atrybuty dlugosc_geogr i szer_geogr wskazują położenie punktu pomiarowego, a atrybuty stan_ostrzegawczy i stan_alarmowy zdefiniowane dla tego punktu odpowiednio stany ostrzegawczy i alarmowy. Dane w tej tabeli w zasadzie nie ulegają zmianie (chyba, że zostanie zamontowany nowy punkt pomiarowy).

Tabela pomiary zawiera informacje od odczytach poziomu wody. Poziom wody podajemy w centymetrach. Odczyty mogą być wykonywane nawet kilka razy na dobę, stąd użyty typ timestamp. Każdy pomiar wody w danym punkcie pomiarowym skutkuje dodaniem nowego rekordu do tabeli pomiary.

Jeżeli po wykonaniu pomiaru stwierdzamy, że dla nowo dodanego rekordu pomiary.poziom_wody >= punkty_pomiarowe.stan_ostrzegawczy (oczywiście dla odpowiedniego punktu pomiarowego), to dodawany jest nowy rekord do tabeli ostrzezenia. W tym dodawanym rekordzie:

ostrzezenia.czas_ostrzezenia = pomiary.czas_pomiaru

ostrzezenia.przekroczony_stan_ostrz = pomiary.poziom_wody - punkty_pomiarowe.stan_ostrzegawczy

Jeżeli nie jest przekroczony stan alarmowy, to atrybut przekroczony_stan_alarm ma wartość NULL. Jeżeli stan alarmowy jest przekroczony, to:

ostrzezenia.przekroczony_stan_alarm = pomiary.poziom_wody - punkty_pomiarowe.stan_alarmowy

Atrybut zmiana_poziomu wskazuje o ile setnych (procent) zmienił się poziom wody względem wcześniejszego pomiaru (czyli bierzemy pod uwagę ostatni (ten nowy) i przedostatni pomiar). Nie ma znaczenia, czy ten przedostatni pomiar skutkował wpisaniem rekordu do tabeli ostrzezenia czy nie. */