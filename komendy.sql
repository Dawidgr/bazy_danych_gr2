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
insert into zwierz select id_postaci, nazwa, wiek from postac where rodzaj in ('ptak','waz');