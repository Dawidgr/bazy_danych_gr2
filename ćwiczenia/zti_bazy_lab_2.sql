#zti_bazy lab_2
	#Zadania - część 1
	#1.1
select nazwisko from pracownik order by nazwisko ASC;
+--------------+
| nazwisko     |
+--------------+
| Adamski      |
| Ananas       |
| Cezary       |
| Dziobak      |
| Frankiewicz  |
| Go?dzik      |
| Guziec       |
| K?kol        |
| Kalova       |
| Ka?amaga     |
| Kielich      |
| Klimaszewski |
| Klusek       |
| Kogut        |
| Koniuszko    |
| Kowalska     |
| Koz?owska    |
| Malajkat     |
| Malinowska   |
| Marchewka    |
| Michalak     |
| Miedziak     |
| Paliwoda     |
| Pierzchalska |
| Poczakowska  |
| Trocik       |
| Trocik       |
| Uzna?        |
| W?sek        |
| Wiaterek     |
| Wojna        |
+--------------+
	#1.2
select imie, nazwisko, pensja from pracownik where year(data_urodzenia)>1979;

+------------+--------------+---------+
| imie       | nazwisko     | pensja  |
+------------+--------------+---------+
| Agata      | Malinowska   | 2780.00 |
| Zbigniew   | Malajkat     | 2780.00 |
| Andrzej    | Kogut        | 2780.00 |
| Katarzyna  | Wiaterek     | 3100.00 |
| Helena     | Kowalska     | 3100.00 |
| Oksana     | Kalova       | 2600.00 |
| Micha?     | Ka?amaga     | 2450.00 |
| Stanis?aw  | Koniuszko    | 2450.00 |
| Aleksandra | Poczakowska  | 2600.00 |
| Ma?gorzata | Koz?owska    | 2600.00 |
| Piotr      | Trocik       | 2780.00 |
| Micha?     | W?sek        | 2350.00 |
| Krzysztof  | Ananas       | 3800.00 |
| Andrzej    | Michalak     | 2670.00 |
| Pawe?      | Klimaszewski | 2670.00 |
| Artur      | Trocik       | 3300.00 |
| Wiktor     | Guziec       | 2350.00 |
| Katarzyna  | Klusek       | 3100.00 |
| Wojciech   | Adamski      | 2780.00 |
| Piotr      | Marchewka    | 3200.00 |
| Jakub      | Uzna?        | 2450.00 |
+------------+--------------+---------+
	#1.3
select * from pracownik where pensja>3500 and pensja<5000;

+---------------+-----------+--------------+---------+----------------+-------------------+-------+
| id_pracownika | imie      | nazwisko     | pensja  | data_urodzenia | data_zatrudnienia | dzial |
+---------------+-----------+--------------+---------+----------------+-------------------+-------+
|            16 | Krzysztof | Ananas       | 3800.00 | 1984-12-12     | 2008-07-01        |     2 |
|            18 | Olga      | Miedziak     | 4200.00 | 1975-02-18     | 2008-03-01        |     1 |
|            25 | Agata     | K?kol        | 3800.00 | 1974-02-10     | 2019-03-01        |     5 |
|            28 | Danuta    | Pierzchalska | 4100.00 | 1975-08-31     | 2009-12-01        |     5 |
+---------------+-----------+--------------+---------+----------------+-------------------+-------+
	#1.4
select towar, ilosc from stan_magazynowy where ilosc>10;

+-------+--------+
| towar | ilosc  |
+-------+--------+
|     1 |  37.00 |
|     2 |  98.00 |
|     3 |  52.00 |
|     4 |  41.00 |
|     5 | 118.00 |
|     6 | 100.00 |
|     7 |  72.00 |
|     8 |  21.00 |
|     9 |  51.00 |
|    10 |  25.00 |
|    11 |  96.00 |
|    12 |  90.00 |
|    13 |  52.00 |
|    14 |  67.00 |
|    15 |  27.00 |
|    16 |  22.00 |
|    17 |  63.00 |
|    18 |  17.00 |
|    19 |  18.00 |
|    20 | 105.00 |
|    21 | 113.00 |
|    22 |  50.00 |
|    23 |  36.00 |
|    24 | 112.00 |
|    25 |  55.00 |
|    26 |  61.00 |
|    27 |  29.00 |
|    28 |  71.00 |
|    29 |  87.00 |
|    30 |  78.00 |
|    31 |  24.00 |
|    32 |  19.00 |
|    33 |  36.00 |
|    35 |  42.00 |
|    36 | 115.00 |
|    37 |  71.00 |
|    38 |  31.00 |
|    39 |  16.00 |
|    40 |  95.00 |
|    41 |  80.00 |
|    42 |  27.00 |
|    43 |  74.00 |
|    44 | 100.00 |
|    45 |  18.00 |
|    46 | 109.00 |
|    47 |  13.00 |
|    48 |  90.00 |
|    49 |  76.00 |
|    50 |  87.00 |
|    51 |  80.00 |
|    52 |  73.00 |
|    54 | 111.00 |
|    55 |  14.00 |
|    56 |  82.00 |
|    57 | 110.00 |
|    58 |  27.00 |
|    59 | 105.00 |
|    60 |  50.00 |
|    61 |  88.00 |
|    62 |  48.00 |
|    63 |  71.00 |
|    64 |  88.00 |
|    65 |  97.00 |
|    66 |  19.00 |
|    67 | 106.00 |
|    68 |  33.00 |
|    69 |  60.00 |
|    70 |  77.00 |
|    71 |  64.00 |
|    72 | 117.00 |
|    73 |  66.00 |
|    74 |  83.00 |
|    75 |  75.00 |
|    76 |  57.00 |
|    77 |  66.00 |
|    79 |  76.00 |
+-------+--------+
	#1.5
select * from towar where nazwa_towaru like 'A%' or nazwa_towaru like 'B%' or nazwa_towaru like 'C%';
+-----------+-----------+-----------------------------+-------------+------+
| id_towaru | kategoria | nazwa_towaru                | cena_zakupu | opis |
+-----------+-----------+-----------------------------+-------------+------+
|        15 |         2 | Carcassone                  |       99.00 |      |
|        16 |         2 | Catan                       |       89.00 |      |
|        17 |         2 | Azul                        |      120.00 |      |
|        19 |         2 | Cywilizacja. Poprzez wieki. |      160.00 |      |
|        21 |         2 | Cortex                      |       49.00 |      |
|        25 |         2 | Agricola                    |      128.00 |      |
|        33 |         4 | Baldur''s Gate 2            |       65.00 |      |
|        58 |         6 | Breloczek                   |        3.50 |      |
|        79 |        15 | Aceton                      |        6.66 |      |
+-----------+-----------+-----------------------------+-------------+------+
	#1.6
select * from klient where czy_firma = 0;
+------------+-----------+------+----------------------+--------------+
| id_klienta | czy_firma | nip  | pelna_nazwa          | nazwa_krotka |
+------------+-----------+------+----------------------+--------------+
|          1 |         0 | NULL | Pawe? Rusek          | P.R.         |
|          2 |         0 | NULL | Piotr Goro?          | P.G.         |
|          3 |         0 | NULL | Dariusz Paszek       | D.P.         |
|          4 |         0 | NULL | Rafa? Berus          | R.B.         |
|          5 |         0 | NULL | Mateusz Kubera       | M.K.         |
|          6 |         0 | NULL | Jakub B?aszyk        | J.B.         |
|          7 |         0 | NULL | Janusz Malec         | J.M.         |
|          8 |         0 | NULL | Artur Radzio         | A.R.         |
|          9 |         0 | NULL | Piotr Nowakowski     | P.N.         |
|         10 |         0 | NULL | Piotr Rutkowski      | P.R.         |
|         12 |         0 | NULL | Marcin Soko?owski    | M.S.         |
|         13 |         0 | NULL | Karol Daniec         | K.D.         |
|         14 |         0 | NULL | Marek Krawczyk       | M.K.         |
|         15 |         0 | NULL | Pawe? Sendor         | P.S.         |
|         16 |         0 | NULL | Pawe? ?uczak         | P.?.         |
|         17 |         0 | NULL | Maciej Roma?ski      | M.R.         |
|         18 |         0 | NULL | Marcin Gawin         | M.G.         |
|         19 |         0 | NULL | Robert Walas         | R.W.         |
|         20 |         0 | NULL | Marcin Zawalski      | M.Z.         |
|         21 |         0 | NULL | Ryszard Poskuta      | R.P.         |
|         23 |         0 | NULL | ?ukasz Kijora        | ?.K.         |
|         24 |         0 | NULL | Dariusz Swojak       | D.S.         |
|         25 |         0 | NULL | J?drzej Galas        | J.G.         |
|         27 |         0 | NULL | Wojciech Kami?ski    | W.K.         |
|         28 |         0 | NULL | Jan Rurarz           | J.R.         |
|         29 |         0 | NULL | Dariusz Chmielewski  | D.C.         |
|         30 |         0 | NULL | Krzysztof Zosg▒rnik  | K.Z.         |
|         31 |         0 | NULL | Marcin Odorowicz     | M.O.         |
|         32 |         0 | NULL | Marcin Brydzi?ski    | M.B.         |
|         34 |         0 | NULL | Artur Jurkowski      | A.J.         |
|         35 |         0 | NULL | Jaros?aw Rychert     | J.R.         |
|         36 |         0 | NULL | Rafa? Sawkiewicz     | R.S.         |
|         37 |         0 | NULL | J▒zef ?apczynski     | J.?.         |
|         38 |         0 | NULL | Daniel Szwamber      | D.S.         |
|         39 |         0 | NULL | Miros?aw Regli?ski   | M.R.         |
|         40 |         0 | NULL | Rados?aw Pilarski    | R.P.         |
|         42 |         0 | NULL | Bart?omiej Ma?ecki   | B.M.         |
|         43 |         0 | NULL | Marek Wierzbanowski  | M.W.         |
|         44 |         0 | NULL | Krzysztof Nawrocki   | K.N.         |
|         45 |         0 | NULL | Grzegorz Goj         | G.G.         |
|         46 |         0 | NULL | Henryk Paczynski     | H.P.         |
|         47 |         0 | NULL | Antoni Leszy?ski     | A.L.         |
|         48 |         0 | NULL | Artur Trojan         | A.T.         |
|         49 |         0 | NULL | Artur Sucha?ski      | A.S.         |
|         50 |         0 | NULL | Andrzej Bogdanowski  | A.B.         |
|         51 |         0 | NULL | Damian Zar?ba        | D.Z.         |
|         52 |         0 | NULL | Artur Kowalczyk      | A.K.         |
|         53 |         0 | NULL | Daniel Chudek        | D.C.         |
|         54 |         0 | NULL | Pawe? Pi?a           | P.P.         |
|         55 |         0 | NULL | Krzysztof Figura     | K.F.         |
|         57 |         0 | NULL | Wojciech B?a?kiewicz | W.B.         |
|         58 |         0 | NULL | Jacek Sztucki        | J.S.         |
|         59 |         0 | NULL | Krzysztof Koterla    | K.K.         |
|         60 |         0 | NULL | Dawid Sochacki       | D.S.         |
|         61 |         0 | NULL | Dariusz Kubica       | D.K.         |
|         62 |         0 | NULL | Damian Kral          | D.K.         |
|         63 |         0 | NULL | Rafa? Kasperski      | R.K.         |
|         64 |         0 | NULL | Ireneusz Gajda       | I.G.         |
|         65 |         0 | NULL | Tomasz Szl?zak       | T.S.         |
|         66 |         0 | NULL | Ryszard Mazurek      | R.M.         |
|         67 |         0 | NULL | Miros?aw Machera     | M.M.         |
|         68 |         0 | NULL | Marek Kania          | M.K.         |
|         69 |         0 | NULL | Andrzej Sadowski     | A.S.         |
|         70 |         0 | NULL | Stanis?aw Kot?owski  | S.K.         |
|         71 |         0 | NULL | Jacek Skonieczny     | J.S.         |
|         72 |         0 | NULL | Marek Borowski       | M.B.         |
|         73 |         0 | NULL | Jerzy Jakociuk       | J.J.         |
|         74 |         0 | NULL | Robert Duran         | R.D.         |
|         75 |         0 | NULL | Tomasz S?k           | T.S.         |
+------------+-----------+------+----------------------+--------------+
	#1.7
select * from zamowienie order by data_zamowienia DESC limit 10;

+---------------+-----------------+------------------+-------------------+-------------------------+--------+
| id_zamowienia | data_zamowienia | numer_zamowienia | status_zamowienia | pracownik_id_pracownika | klient |
+---------------+-----------------+------------------+-------------------+-------------------------+--------+
|           391 | 2020-01-21      | 5/1/2020         |                 4 |                      16 |     80 |
|           390 | 2020-01-10      | 4/1/2020         |                 4 |                      16 |     91 |
|           389 | 2020-01-02      | 3/1/2020         |                 4 |                      14 |     85 |
|           388 | 2019-12-23      | 2/12/2019        |                 3 |                      16 |     36 |
|           387 | 2019-12-10      | 1/12/2019        |                 3 |                      16 |      7 |
|           386 | 2019-11-26      | 3/11/2019        |                 3 |                       5 |     64 |
|           385 | 2019-11-17      | 2/11/2019        |                 5 |                       6 |     84 |
|           384 | 2019-11-05      | 1/11/2019        |                 5 |                      22 |     77 |
|           383 | 2019-10-21      | 3/10/2019        |                 5 |                      26 |     96 |
|           382 | 2019-10-13      | 2/10/2019        |                 5 |                       3 |     28 |
+---------------+-----------------+------------------+-------------------+-------------------------+--------+
	#1.8
select * from pracownik order by pensja ASC limit 5;
+---------------+---------+----------+---------+----------------+-------------------+-------+
| id_pracownika | imie    | nazwisko | pensja  | data_urodzenia | data_zatrudnienia | dzial |
+---------------+---------+----------+---------+----------------+-------------------+-------+
|            23 | Wiktor  | Guziec   | 2350.00 | 1992-01-18     | 2010-09-01        |     3 |
|             9 | Artur   | Dziobak  | 2350.00 | 1969-12-20     | 2009-05-01        |     3 |
|             4 | Wies?aw | Go?dzik  | 2350.00 | 1968-09-24     | 2008-03-01        |     3 |
|             8 | Piotr   | Wojna    | 2350.00 | 1971-10-01     | 2008-03-01        |     3 |
|            15 | Micha?  | W?sek    | 2350.00 | 1985-09-02     | 2010-02-08        |     3 |
+---------------+---------+----------+---------+----------------+-------------------+-------+
	#1.9 zrobione
select * from towar where nazwa_towaru not like '%a%' order by cena_zakupu DESC limit 10;
	#1.10 zrobione
select * from towar t
inner join stan_magazynowy sm on t.id_towaru=sm.towar
inner join jednostka_miary jm on sm.jm=jm.id_jednostki
where jm.nazwa='szt' order by nazwa_towaru ASC, cena_zakupu DESC;
	#1.11 Stwórz nową tabelę o nazwie towary_powyzej_100, do której wstaw towary, których cena jest większa równa 100. 
Create table grabowskid.towary_powyzej_100 SELECT * from towar where cena_zakupu>=100;
	#1.12 Stwórz nową tabelę o nazwie pracownik_50_plus na podstawie tabeli pracownik z wykorzystaniem LIKE. Wstaw do tej tabeli wszystkie rekordy z tabeli pracownik gdzie wiek pracownika jest większy równy 50 lat.
create table grabowskid.pracownik_50_plus like pracownik;
insert into grabowskid.pracownik_50_plus select * from pracownik where (year(curdate())-year(data_urodzenia))>=50;
	#te wyzej tez zrobione
	#Zadania - część 2
	#2.1
SELECT p.imie, p.nazwisko, d.nazwa from pracownik p
left join dzial d on p.dzial=d.id_dzialu;
+------------+--------------+------------+
| imie       | nazwisko     | nazwa      |
+------------+--------------+------------+
| Agata      | Malinowska   | sprzeda?   |
| Zbigniew   | Malajkat     | sprzeda?   |
| Andrzej    | Kogut        | sprzeda?   |
| Wies?aw    | Go?dzik      | magazyn    |
| Katarzyna  | Wiaterek     | sprzeda?   |
| Helena     | Kowalska     | sprzeda?   |
| Oksana     | Kalova       | bok        |
| Piotr      | Wojna        | magazyn    |
| Artur      | Dziobak      | magazyn    |
| Micha?     | Ka?amaga     | magazyn    |
| Stanis?aw  | Koniuszko    | magazyn    |
| Aleksandra | Poczakowska  | bok        |
| Ma?gorzata | Koz?owska    | bok        |
| Piotr      | Trocik       | sprzeda?   |
| Micha?     | W?sek        | magazyn    |
| Krzysztof  | Ananas       | sprzeda?   |
| Andrzej    | Michalak     | magazyn    |
| Olga       | Miedziak     | ksi?gowo?? |
| Pawe?      | Klimaszewski | magazyn    |
| Karolina   | Frankiewicz  | ksi?gowo?? |
| Bo?ena     | Kielich      | ksi?gowo?? |
| Artur      | Trocik       | sprzeda?   |
| Wiktor     | Guziec       | magazyn    |
| Katarzyna  | Klusek       | sprzeda?   |
| Agata      | K?kol        | kadry      |
| Wojciech   | Adamski      | sprzeda?   |
| Cezary     | Cezary       | magazyn    |
| Danuta     | Pierzchalska | kadry      |
| Piotr      | Marchewka    | bok        |
| Micha?     | Paliwoda     | magazyn    |
| Jakub      | Uzna?        | magazyn    |
+------------+--------------+------------+
	#2.2 +
select t.nazwa_towaru, k.nazwa_kategori, sm.ilosc from towar t
left join kategoria k on t.kategoria=k.id_kategori
left join stan_magazynowy sm on t.id_towaru=sm.towar;
	#2.3 +
select * from zamowienie z
inner join status_zamowienia sz on z.status_zamowienia=sz.id_statusu_zamowienia
where sz.nazwa_statusu_zamowienia='anulowane';
	#2.4 +
select * from klient k
left join adres_klienta ak on k.id_klienta=ak.klient
where ak.miejscowosc='Olsztyn';
	#2.5 +
select jm.nazwa from jednostka_miary jm
left join stan_magazynowy sm on jm.id_jednostki=sm.jm
where sm.towar is Null;
	#2.6 +
select z.numer_zamowienia, t.nazwa_towaru, sm.ilosc, t.cena_zakupu from zamowienie z
inner join pozycja_zamowienia pz on z.id_zamowienia=pz.zamowienie
inner join towar t on pz.towar=t.id_towaru
inner join stan_magazynowy sm on t.id_towaru=sm.towar;
where year(z.data_zamowienia)=2018;
	#2.7 +
create table grabowskid.towary_full_info select t.nazwa_towaru, t.cena_zakupu, k.nazwa_kategori, sm.ilosc, jm.nazwa from towar t
left join kategoria k on t.kategoria=k.id_kategori
left join stan_magazynowy sm on t.id_towaru=sm.towar
left join jednostka_miary jm on sm.jm=jm.id_jednostki;
	#2.8 +
select * from zamowienie order by data_zamowienia ASC limit 5;
	#2.9 +
select * from zamowienie z
inner join status_zamowienia sz on z.status_zamowienia=sz.id_statusu_zamowienia
where sz.nazwa_statusu_zamowienia!='zrealizowane';
	#2.10 -
select * from adres_klienta where kod not like '__-___';