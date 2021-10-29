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
(default, 'Thor', 'wiking', '1971-07-18', '54'),
(default, 'Gil', 'wiking', '2005-02-07', '2'),
(default, '', '', '', '',),
(),
();