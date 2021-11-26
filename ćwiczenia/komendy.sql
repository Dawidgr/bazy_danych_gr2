# lab 03
# Zadanie 1
#show create table `table`;
#describe `table`;
#select * from `table`;
	#1.
create table `postac` (
`id_postaci` int auto_increment primary key,
`nazwa` varchar(40) not null,
`rodzaj` enum('wiking', 'ptak', 'kobieta'), # lub ()set
`data_ur` date,
`wiek` int(3) unsigned # bez znaku = nieujemne
);
	#2.
insert into postac values
	(default, 'Bjorn', 'wiking', '1998-04-12','26'),
	(default, 'Drozd', 'ptak', '2006-07-03','1'),
	(default, 'Tesciowa', 'kobieta', '1967-06-13','48');
	#3.
update postac set wiek=88 where nazwa='Tesciowa';

# Zadanie 2
	#1.
create table `walizka` (
`id_walizki` int auto_increment primary key,
`pojemnosc` int unsigned,
`kolor` enum('rozowy', 'czerwony', 'teczowy', 'zolty'),
`id_wlasciciela` int,
foreign key (id_wlasciciela) references postac(id_postaci) on delete cascade
);
	#2.
alter table walizka alter kolor set default 'rozowy';
	#3.
insert into walizka values
	(default, 5, 'zolty', '1'),
	(default, 8, 'rozowy', '3');
	
# Zadanie 3
	#1.
create table izba (
	adres_budynku int,
	nazwa_izby varchar(40),
	metraz int unsigned,
	wlasciciel int,
	primary key(adres_budynku,nazwa_izby),
	foreign key (wlasciciel) references postac(id_postaci) on delete set null
);
	#2.
alter table izba add column kolor_izby varchar(40) after metraz;
alter table izba alter kolor_izby set default 'czarny';
	#3.
insert into izba values (21, 'spizarnia', 20, 'brazowy', 1);
# Zadanie 4
	#1.
create table przetwory (
	id_przetworu int primary key,
	rok_produkcji int(4) default 1654,
	id_wykonawcy int,
	zawartosc varchar(40),
	dodatek varchar(40) default 'papryczka_chilli',
	id_konsumenta int,
	foreign key (id_wykonawcy) references postac(id_postaci),
	foreign key (id_konsumenta) references postac(id_postaci)
);
	#2.
insert into przetwory values
	(1, 2005, 1, 'bigos', default, 3);
# Zadanie 5
	#1. 
insert into postac values
(default, 'Thor', 'wiking', '1971-07-18', 54),
(default, 'Gil', 'wiking', '2005-02-07', 20),
(default, 'Michal', 'wiking', '2001-01-08', 24),
(default, 'Frode', 'wiking', '1968-12-04', 57),
(default, 'Ziggy', 'wiking', '1995-07-09', 30);
	#2.
create table statek (
	nazwa_statku varchar(40) primary key,
	rodzaj_statku enum('great_ship','Skeid','Busse'),
	data_wodowania date,
	max_ladownosc int unsigned
);
	#3.
insert into statek values
('Boar','great_ship','1984-04-09',25),
('Raven','Skeid','2000-03-24',12);
	#4.
alter table postac add column funkcja varchar(40);
	#5.
update postac set funkcja='kapitan' where nazwa='Bjorn';
	#6.
alter table postac add column postac_statek varchar(40);
alter table postac add foreign key (postac_statek) references statek(nazwa_statku);
	#7.
update postac set postac_statek='Boar' where id_postaci=1;
update postac set postac_statek='Boar' where id_postaci=2;
update postac set postac_statek='Boar' where id_postaci=6;
update postac set postac_statek='Boar' where id_postaci=8;
update postac set postac_statek='Raven' where id_postaci=4;
update postac set postac_statek='Raven' where id_postaci=5;
update postac set postac_statek='Raven' where id_postaci=7;
	#8.
delete from izba where nazwa_izby='spizarnia';
	#9.
drop table izba;


# lab 04
# Zadanie 1
	#a) 
#select nazwa, wiek from postac order by wiek DESC;
delete from postac where nazwa = 'Frode';
delete from postac where nazwa = 'Thor';
	#b)
alter table postac modify id_postaci int not null;
# [alternatywnie] wyłączenie sprawdzania poprawności kluczy obcych w danej bazie
#SET foreign_key_checks = 0;
#usuwanie klucza obcego
#ALTER TABLE walizka/przetwory/itd. DROP FOREIGN KEY ..._ibfk_...;
ALTER TABLE walizka DROP FOREIGN KEY walizka_ibfk_1;
ALTER TABLE walizka DROP id_wlasciciela;
ALTER TABLE przetwory DROP FOREIGN KEY przetwory_ibfk_1;
ALTER TABLE przetwory DROP FOREIGN KEY przetwory_ibfk_2;
ALTER TABLE przetwory DROP id_konsumenta;
ALTER TABLE przetwory DROP id_wykonawcy;
#możemy spróbować usunąć klucz główny
ALTER TABLE postac DROP Primary key;
# Zadanie 2
ALTER TABLE postac ADD COLUMN pesel char(11);
update postac set pesel='46848912612' where id_postaci=1;
update postac set pesel='68468418294' where id_postaci=2;
update postac set pesel='98271968011' where id_postaci=3;
update postac set pesel='92586259498' where id_postaci=5;
update postac set pesel='78551673418' where id_postaci=6;
update postac set pesel='97812371303' where id_postaci=8;
ALTER TABLE postac ADD PRIMARY KEY(pesel);
alter table postac modify rodzaj enum('wiking','ptak','kobieta','syrena');
insert into postac values
	(4,'Gertruda Nieszczera','syrena','1974-04-26',51,default,default,48915679456);
# Zadanie 3
	#a)
update postac set postac_statek='Boar' where nazwa like '%a%';
	#b)
update statek set max_ladownosc=max_ladownosc*0.7 where data_wodowania between '1901-01-01' AND '2000-12-31';
	#c)
alter table postac add check (wiek<1000);
# Zadanie 4
	#a)
alter table postac modify rodzaj enum('wiking','ptak','kobieta','syrena','waz');
insert into postac values
	(7,'Loko','waz','1525-03-04','500',default,default,18915647854);
	#b)
create table marynarz select * from postac where postac_statek is not null;
	#c)
alter table marynarz add primary key(pesel);
alter table marynarz add foreign key(postac_statek) references statek(nazwa_statku);
# Zadanie 5
	#a)
update postac set postac_statek=null;
	#b)
delete from postac where nazwa='Gil';
	#c)
alter table postac drop foreign key postac_ibfk_1;
alter table postac drop column postac_statek;
alter table marynarz drop foreign key marynarz_ibfk_1;
alter table marynarz drop column postac_statek;
delete from statek;
	#d)
drop table statek;
	#e)
create table zwierz (
	id int primary key auto_increment,
	nazwa varchar(40),
	wiek int);
	#f)
<<<<<<< HEAD
insert into zwierz select id_postaci, nazwa, wiek from postac where rodzaj in ('ptak','waz');

#lab 05
# Zadanie 1
	#1. kopowianie tabeli z innej bazy danych. (create as?)
#Przypadek 1. Aktywna baza to baza imienna.
USE grabowskid;
CREATE TABLE kreatura SELECT * FROM wikingowie.kreatura;
#Przypadek 2. Aktywna baza to baza wikingowie.
#CREATE TABLE grabowskid.kreatura SELECT * FROM kreatura;
Use wikingowie;
	#2.
SELECT * FROM zasob;
#+----------+-------------------+--------+-------+----------------+--------------------+
#| idZasobu | nazwa             | waga   | ilosc | dataPozyskania | rodzaj             |
#+----------+-------------------+--------+-------+----------------+--------------------+
#|        1 | kokos             |   2.00 |     3 | 2007-07-23     | jedzenie           |
#|        2 | siekiera          |  13.00 |     1 | 1974-01-04     | narzedzie          |
#|        3 | kokos             |   4.00 |     1 | 2004-09-03     | jedzenie           |
#|        4 | kokos             |   7.00 |     2 | 2010-10-13     | jedzenie           |
#|        5 | banan             |   2.00 |    12 | 2015-11-09     | jedzenie           |
#|        6 | figa              |   1.00 |    30 | 2001-12-14     | jedzenie           |
#|        7 | krokodyl          | 100.00 |     1 | 2005-07-14     | jedzenie           |
#|        8 | bataty            |   1.00 |    30 | 2002-07-01     | jedzenie           |
#|        9 | opos              |  12.00 |     2 | 2006-08-01     | jedzenie           |
#|       10 | stanik            |   0.20 |   120 | 2004-06-01     | NULL               |
#|       11 | stanik            |   0.30 |    20 | 2004-06-15     | NULL               |
#|       12 | stanik            |   0.40 |    30 | 2004-07-15     | NULL               |
#|       13 | stanik            |   0.20 |    40 | 2012-08-15     | NULL               |
#|       14 | buty              |   2.00 |     2 | 2010-08-15     | ubranie            |
#|       15 | lisc palmowy      |   0.10 |  1000 | 2001-03-25     | ubranie            |
#|       16 | skora geparda     |  30.00 |     7 | 2013-07-25     | ubranie            |
#|       17 | kiel slonia       |   1.00 |     9 | 2003-01-25     | ubranie            |
#|       18 | topor             |   3.00 |     1 | 2000-01-25     | narzedzie zbrodni  |
#|       19 | dzida             |   2.00 |    10 | 2001-03-21     | narzedzie zbrodni  |
#|       20 | luk               |   1.00 |     3 | 2003-04-17     | narzedzie zbrodni  |
#|       21 | pnacza            |   0.10 |   300 | 2010-02-17     | material budowlany |
#|       22 | deski             |   0.50 |   120 | 2008-02-17     | material budowlany |
#|       23 | hamak             |   2.00 |     1 | 2001-01-17     | miejsce wypoczynku |
#|       24 | chatka na drzewie |   2.00 |     1 | 2012-08-17     | miejsce wypoczynku |
#|       25 | nie wiadomo co    |   4.00 |     1 | 2001-08-10     | NULL               |
#|       26 | ogien do ziania   |   1.00 |     4 | 2002-08-10     | NULL               |
#|       27 | miotla            |   3.00 |     1 | 2005-10-10     | NULL               |
#|       28 | banan             |   1.00 |     7 | 2008-08-21     | jedzenie           |
#+----------+-------------------+--------+-------+----------------+--------------------+
	#3.
select * from zasob where rodzaj='jedzenie';
#+----------+----------+--------+-------+----------------+----------+
#| idZasobu | nazwa    | waga   | ilosc | dataPozyskania | rodzaj   |
#+----------+----------+--------+-------+----------------+----------+
#|        1 | kokos    |   2.00 |     3 | 2007-07-23     | jedzenie |
#|        3 | kokos    |   4.00 |     1 | 2004-09-03     | jedzenie |
#|        4 | kokos    |   7.00 |     2 | 2010-10-13     | jedzenie |
#|        5 | banan    |   2.00 |    12 | 2015-11-09     | jedzenie |
#|        6 | figa     |   1.00 |    30 | 2001-12-14     | jedzenie |
#|        7 | krokodyl | 100.00 |     1 | 2005-07-14     | jedzenie |
#|        8 | bataty   |   1.00 |    30 | 2002-07-01     | jedzenie |
#|        9 | opos     |  12.00 |     2 | 2006-08-01     | jedzenie |
#|       28 | banan    |   1.00 |     7 | 2008-08-21     | jedzenie |
#+----------+----------+--------+-------+----------------+----------+
	#4.
select idZasobu, ilosc from ekwipunek where idKreatury in (1,3,5);
#+----------+-------+
#| idZasobu | ilosc |
#+----------+-------+
#|        1 |     2 |
#|       10 |     1 |
#|       14 |     3 |
#|       15 |    53 |
#|        2 |     3 |
#|       23 |     1 |
#|       18 |     1 |
#|       17 |     1 |
#|       17 |     2 |
#|        2 |     2 |
#|       21 |    50 |
#|       16 |     1 |
#+----------+-------+
# Zadanie 2.
	#1.
SELECT nazwa FROM kreatura where rodzaj!='wiedzma' AND udzwig>=50;
#+-----------+
#| nazwa     |
#+-----------+
#| Bjorn     |
#| Brutal    |
#| Khorad    |
#| Birgun    |
#| Defgard   |
#| Ibra      |
#| Bjolkolur |
#| Szczeki   |
#| Dziadek   |
#+-----------+
	#2.
SELECT nazwa FROM zasob where waga between 2 and 5;
#+-------------------+
#| nazwa             |
#+-------------------+
#| kokos             |
#| kokos             |
#| banan             |
#| buty              |
#| topor             |
#| dzida             |
#| hamak             |
#| chatka na drzewie |
#| nie wiadomo co    |
#| miotla            |
#+-------------------+
	#3.
select nazwa from kreatura where nazwa like '%or%' AND udzwig between 30 AND 70;
#empty set
# Zadanie 3
	#1.
select nazwa, dataPozyskania from zasob where month(dataPozyskania) in (7,8);
#+-------------------+----------------+
#| nazwa             | dataPozyskania |
#+-------------------+----------------+
#| kokos             | 2007-07-23     |
#| krokodyl          | 2005-07-14     |
#| bataty            | 2002-07-01     |
#| opos              | 2006-08-01     |
#| stanik            | 2004-07-15     |
#| stanik            | 2012-08-15     |
#| buty              | 2010-08-15     |
#| skora geparda     | 2013-07-25     |
#| chatka na drzewie | 2012-08-17     |
#| nie wiadomo co    | 2001-08-10     |
#| ogien do ziania   | 2002-08-10     |
#| banan             | 2008-08-21     |
#+-------------------+----------------+
	#2.
select nazwa, rodzaj, waga from zasob where rodzaj is not null order by waga desc;
#+-------------------+--------------------+--------+
#| nazwa             | rodzaj             | waga   |
#+-------------------+--------------------+--------+
#| krokodyl          | jedzenie           | 100.00 |
#| skora geparda     | ubranie            |  30.00 |
#| siekiera          | narzedzie          |  13.00 |
#| opos              | jedzenie           |  12.00 |
#| kokos             | jedzenie           |   7.00 |
#| kokos             | jedzenie           |   4.00 |
#| topor             | narzedzie zbrodni  |   3.00 |
#| banan             | jedzenie           |   2.00 |
#| kokos             | jedzenie           |   2.00 |
#| chatka na drzewie | miejsce wypoczynku |   2.00 |
#| buty              | ubranie            |   2.00 |
#| hamak             | miejsce wypoczynku |   2.00 |
#| dzida             | narzedzie zbrodni  |   2.00 |
#| banan             | jedzenie           |   1.00 |
#| luk               | narzedzie zbrodni  |   1.00 |
#| kiel slonia       | ubranie            |   1.00 |
#| bataty            | jedzenie           |   1.00 |
#| figa              | jedzenie           |   1.00 |
#| deski             | material budowlany |   0.50 |
#| pnacza            | material budowlany |   0.10 |
#| lisc palmowy      | ubranie            |   0.10 |
#+-------------------+--------------------+--------+
	#3.
#... Limit 5,5; indekst start, ile elementów
select nazwa, dataUr from kreatura order by dataUr ASC Limit 5;
#+------------------+------------+
#| nazwa            | dataUr     |
#+------------------+------------+
#| Babajaga         | 1000-01-01 |
#| Tesciowa dziadka | 1630-04-30 |
#| Dziadek          | 1645-01-23 |
#| Tesciowa         | 1655-10-01 |
#| Bjorn            | 1670-04-01 |
#+------------------+------------+
# Zadanie 4
	#1. unikalne rodzaje zasobu			#select distinct rodzaj, nazwa from zasob; - nie bedzie 2 takich samych wierszy
select distinct rodzaj from zasob;
#+--------------------+
#| rodzaj             |
#+--------------------+
#| jedzenie           |
#| narzedzie          |
#| NULL               |
#| ubranie            |
#| narzedzie zbrodni  |
#| material budowlany |
#| miejsce wypoczynku |
#+--------------------+
	#2. np. select concat('Ala ma kota, o imieniu ', nazwa) as wierszyk from kreatura;
select concat(nazwa,'-',rodzaj) from kreatura where rodzaj like 'Wi%';
#+------------------------------------+
#| concat(nazwa,'-',rodzaj)           |
#+------------------------------------+
#| Bjorn-wiking                       |
#| Brutal-wiking                      |
#| Khorad-wiking                      |
#| Birgun-wiking                      |
#| Defgard-wiking                     |
#| Astrid-wiking                      |
#| Ibra-wiking                        |
#| Bjolkolur-wiking                   |
#| Tesciowa-wiedzma                   |
#| Dziadek-wiking                     |
#| sztuczna szczeka tesciowej-wiedzma |
#| Tesciowa dziadka-wiedzma           |
#| Babajaga-wiedzma                   |
#+------------------------------------+
	#3.
select concat(nazwa,'-',ilosc*waga) as 'calkowita waga zasobu' from zasob where year(dataPozyskania) between 2000 and 2007;
#+-----------------------+
#| calkowita waga zasobu |
#+-----------------------+
#| kokos-6.00            |
#| kokos-4.00            |
#| figa-30.00            |
#| krokodyl-100.00       |
#| bataty-30.00          |
#| opos-24.00            |
#| stanik-24.00          |
#| stanik-6.00           |
#| stanik-12.00          |
#| lisc palmowy-100.00   |
#| kiel slonia-9.00      |
#| topor-3.00            |
#| dzida-20.00           |
#| luk-3.00              |
#| hamak-2.00            |
#| nie wiadomo co-4.00   |
#| ogien do ziania-4.00  |
#| miotla-3.00           |
#+-----------------------+
# Zadanie 5.
	#1.
select concat(waga*0.7) as 'waga netto',concat(waga*0.3) as 'waga odpadkow' from zasob;
#+------------+---------------+
#| waga netto | waga odpadkow |
#+------------+---------------+
#| 1.40       | 0.60          |
#| 9.10       | 3.90          |
#| 2.80       | 1.20          |
#| 4.90       | 2.10          |
#| 1.40       | 0.60          |
#| 0.70       | 0.30          |
#| 70.00      | 30.00         |
#| 0.70       | 0.30          |
#| 8.40       | 3.60          |
#| 0.14       | 0.06          |
#| 0.21       | 0.09          |
#| 0.28       | 0.12          |
#| 0.14       | 0.06          |
#| 1.40       | 0.60          |
#| 0.07       | 0.03          |
#| 21.00      | 9.00          |
#| 0.70       | 0.30          |
#| 2.10       | 0.90          |
#| 1.40       | 0.60          |
#| 0.70       | 0.30          |
#| 0.07       | 0.03          |
#| 0.35       | 0.15          |
#| 1.40       | 0.60          |
#| 1.40       | 0.60          |
#| 2.80       | 1.20          |
#| 0.70       | 0.30          |
#| 2.10       | 0.90          |
#| 0.70       | 0.30          |
#+------------+---------------+
	#2.
select nazwa, rodzaj from zasob where rodzaj is null;
+-----------------+--------+
| nazwa           | rodzaj |
+-----------------+--------+
| stanik          | NULL   |
| stanik          | NULL   |
| stanik          | NULL   |
| stanik          | NULL   |
| nie wiadomo co  | NULL   |
| ogien do ziania | NULL   |
| miotla          | NULL   |
+-----------------+--------+
	#3.
select distinct rodzaj from zasob where nazwa like 'Ba%' or nazwa like '%os' order by rodzaj asc;
#+----------+
#| rodzaj   |
#+----------+
#| jedzenie |
#+----------+
=======
insert into zwierz select id_postaci, nazwa, wiek from postac where rodzaj in ('ptak','waz');
#lab 06
	# avg() - srednia
	# count() - zlicza ilosc elementow
	# sum() - suma wartosci (liczbowych)
	# min() - minimum
	# max() - maksimum
#SELECT round(avg(udzwig), 0) from kreatura;
#SELECT floor(avg(udzwig)) from kreatura;
#SELECT ceil(avg(udzwig)) from kreatura;
#Zadanie 1
	#1.
SELECT AVG(waga) from kreatura where rodzaj='wiking';
#+-----------+
#| AVG(waga) |
#+-----------+
#|   95.1111 |
#+-----------+
	#2.
SELECT rodzaj, AVG(waga), count(nazwa) from kreatura group by rodzaj;
#+---------+-----------+--------------+
#| rodzaj  | AVG(waga) | count(nazwa) |
#+---------+-----------+--------------+
#| wiking  |   95.1111 |            9 |
#| ryba    | 1050.5000 |            2 |
#| waz     |    3.0000 |            1 |
#| ptak    |    2.0000 |            2 |
#| wiedzma |   41.2500 |            4 |
#| malpa   |   32.0000 |            1 |
#+---------+-----------+--------------+
	#3.   now() or curdata()
SELECT AVG(year(curdate())-year(dataUr)) as 'sredni wiek kreatur' FROM kreatura;
#+---------------------+
#| sredni wiek kreatur |
#+---------------------+
#|            386.7895 |
#+---------------------+

#Zadanie 2.
	#1.
SELECT rodzaj, SUM(waga) as 'waga' FROM zasob GROUP BY rodzaj;
+--------------------+--------+
| rodzaj             | waga   |
+--------------------+--------+
| jedzenie           | 130.00 |
| narzedzie          |  13.00 |
| NULL               |   9.10 |
| ubranie            |  33.10 |
| narzedzie zbrodni  |   6.00 |
| material budowlany |   0.60 |
| miejsce wypoczynku |   4.00 |
+--------------------+--------+
	#2. błąd w tresci zadania, ma być avg, nie suma.
SELECT nazwa, AVG(waga) FROM zasob where ilosc >=4 GROUP BY nazwa HAVING avg(waga)>10;
+---------------+-----------+
| nazwa         | AVG(waga) |
+---------------+-----------+
| skora geparda | 30.000000 |
+---------------+-----------+
	#3.
SELECT rodzaj, count(distinct nazwa) from zasob group by rodzaj having sum(ilosc)>1;
	#lub where ilosc > 1
+--------------------+-----------------------+
| rodzaj             | count(distinct nazwa) |
+--------------------+-----------------------+
| NULL               |                     4 |
| jedzenie           |                     6 |
| material budowlany |                     2 |
| miejsce wypoczynku |                     2 |
| narzedzie zbrodni  |                     3 |
| ubranie            |                     4 |
+--------------------+-----------------------+

#Zadanie 3	#mozna uzywac np k.nazwa zamiast kreatura.nazwa jako skrot
	#1.
#select * from kreatura, ekwipunek where kreatura.idKreatury=ekwipunek.idKreatury;
	#lub uzywajac inner join
#select * from kreatura inner join ekwipunek ON kreatura.idKreatury=ekwipunek.idKreatury;
select nazwa, sum(ilosc) from kreatura inner join ekwipunek ON kreatura.idKreatury=ekwipunek.idKreatury group by kreatura.idKreatury;
+-----------+------------+
| nazwa     | sum(ilosc) |
+-----------+------------+
| Bjorn     |         64 |
| Brutal    |          4 |
| Astrid    |          6 |
| Khorad    |          1 |
| Ibra      |          2 |
| Tesciowa  |          5 |
| Defgard   |         55 |
| Bjolkolur |         12 |
| Drozd     |          1 |
| Szczeki   |          1 |
+-----------+------------+
	#2.
select kreatura.nazwa, zasob.nazwa from kreatura inner join ekwipunek ON kreatura.idKreatury=ekwipunek.idKreatury inner join zasob on ekwipunek.idZasobu=zasob.idZasobu;
	#3. 
	#left joinem
select nazwa, ekwipunek.idKreatury from kreatura left join ekwipunek ON kreatura.idKreatury=ekwipunek.idKreatury where ekwipunek.idKreatury is Null;
+----------------------------+------------+
| nazwa                      | idKreatury |
+----------------------------+------------+
| Birgun                     |       NULL |
| Nemo                       |       NULL |
| Loko                       |       NULL |
| Ara                        |       NULL |
| Tiki                       |       NULL |
| Dziadek                    |       NULL |
| sztuczna szczeka tesciowej |       NULL |
| Tesciowa dziadka           |       NULL |
| Babajaga                   |       NULL |
+----------------------------+------------+
	#podzapytaniem
select idkreatury from kreatura where idKreatury not in
(select idKreatury from ekwipunek where idKreatury is not null);

#Zadanie 4
	#1.
#SELECT * from kreatura natural join ekwipunek; - normalnie nie uzywa sie natural joina, lepiej inner ,left itp.
#select kreatura.nazwa from kreatura natural join ekwipunek natural join zasob where year(dataUr) between 1670 and 1679; - nie działa!!!!
select kreatura.nazwa, zasob.nazwa from kreatura inner join ekwipunek ON kreatura.idKreatury=ekwipunek.idKreatury inner join zasob on ekwipunek.idZasobu=zasob.idZasobu where year(dataUr) between 1670 and 1679;
+-----------+---------------+
| nazwa     | nazwa         |
+-----------+---------------+
| Bjorn     | kokos         |
| Bjorn     | stanik        |
| Bjorn     | buty          |
| Bjorn     | lisc palmowy  |
| Bjorn     | siekiera      |
| Brutal    | siekiera      |
| Brutal    | kokos         |
| Bjorn     | hamak         |
| Bjorn     | topor         |
| Astrid    | kokos         |
| Khorad    | kiel slonia   |
| Ibra      | skora geparda |
| Ibra      | dzida         |
| Astrid    | luk           |
| Defgard   | kiel slonia   |
| Bjolkolur | pnacza        |
| Drozd     | stanik        |
| Bjolkolur | deski         |
| Szczeki   | opos          |
| Defgard   | siekiera      |
| Defgard   | pnacza        |
| Defgard   | skora geparda |
| Astrid    | stanik        |
+-----------+---------------+
	#2.
select kreatura.nazwa, zasob.nazwa, zasob.rodzaj from kreatura inner join ekwipunek ON kreatura.idKreatury=ekwipunek.idKreatury inner join zasob on ekwipunek.idZasobu=zasob.idZasobu where zasob.rodzaj='jedzenie' order by kreatura.dataUr DESC Limit 5;
+---------+-------+----------+
| nazwa   | nazwa | rodzaj   |
+---------+-------+----------+
| Astrid  | kokos | jedzenie |
| Szczeki | opos  | jedzenie |
| Brutal  | kokos | jedzenie |
| Bjorn   | kokos | jedzenie |
+---------+-------+----------+
	#3.
SELECT concat(kreatura.nazwa,'-',kreatura1.nazwa) FROM kreatura, kreatura as kreatura1 WHERE kreatura.idKreatury=kreatura1.idKreatury AND kreatura.idKreatury=;


DODATKOWE PUNKTY za 5 ZADANIE

#Zadanie 5
	#1.
SELECT k.rodzaj, avg(e.ilosc * z.waga) FROM kreatura k
inner join ekwipunek e on k.idKreatury=e.idKreatury
inner join zasob z on e.idZasobu=z.idZasobu where k.rodzaj not in ('malpa','waz')
and e.ilosc < 30 group by k.rodzaj;
+---------+-----------------------+
| rodzaj  | avg(e.ilosc * z.waga) |
+---------+-----------------------+
| wiking  |             10.505263 |
| wiedzma |              3.500000 |
| ptak    |              0.200000 |
| ryba    |             12.000000 |
+---------+-----------------------+
SELECT k.rodzaj, avg(e.ilosc * z.waga) FROM kreatura k
inner join ekwipunek e on k.idKreatury=e.idKreatury
inner join zasob z on e.idZasobu=z.idZasobu where k.rodzaj not in ('malpa','waz')
group by k.rodzaj
having sum(e.ilosc)<30;
	#2.		#union
#SELECT nazwa from kreatura
#where rodzaj !="wiking"
#union 
#SELECT nazwa from kreatura
#where rodzaj ="wiking";
#SELECT rodzaj, max(dataUr) from kreatura group by rodzaj;
SELECT nazwa, dataUr, rodzaj 
from kreatura where dataUr in (select max(dataUr) from kreatura group by rodzaj)
union
SELECT nazwa, dataUr, rodzaj 
from kreatura where dataUr in (select min(dataUr) from kreatura group by rodzaj);
+----------------------------+------------+---------+
| nazwa                      | dataUr     | rodzaj  |
+----------------------------+------------+---------+
| Astrid                     | 1677-08-18 | wiking  |
| Nemo                       | 1677-10-02 | ryba    |
| Loko                       | 1677-10-05 | waz     |
| Ara                        | 1676-05-05 | ptak    |
| Tiki                       | 1672-08-08 | malpa   |
| sztuczna szczeka tesciowej | 1680-08-13 | wiedzma |
| Drozd                      | 1675-07-07 | ptak    |
| Szczeki                    | 1674-04-06 | ryba    |
| Dziadek                    | 1645-01-23 | wiking  |
| Babajaga                   | 1000-01-01 | wiedzma |
+----------------------------+------------+---------+
	#albo
#SELECT k.nazwa, k.dataUr, k.rodzaj
#from kreatura k,
#(select min(dataUr) as min, max(dataUr) as max from kreatura group by rodzaj) pod
#where k.dataUr=pod.min or k.dataUr=pod.max;

















