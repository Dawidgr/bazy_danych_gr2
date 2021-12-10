#lab07

	#Zadanie 1.1
Kopiowanie tabel
	#Zadanie 1.2
SELECT k.nazwa FROM kreatura k 
left join uczestnicy u on k.idKreatury=u.id_uczestnika
where u.id_uczestnika is Null;
+----------+
| nazwa    |
+----------+
| Brutal   |
| Defgard  |
| Ara      |
| Babajaga |
+----------+
	#Zadanie 1.3
SELECT w.nazwa, sum(e.ilosc) from wyprawa w 
inner join uczestnicy u on w.id_wyprawy=u.id_wyprawy
inner join kreatura k on u.id_uczestnika=k.idKreatury
inner join ekwipunek e on k.idKreatury=e.idKreatury
group by w.nazwa;
+-----------------------+--------------+
| nazwa                 | sum(e.ilosc) |
+-----------------------+--------------+
| Poszukiwanie ziecia   |            5 |
| Polowanie na tesciowa |           68 |
| Nakarm kanibala       |           84 |
+-----------------------+--------------+

	#Zadanie 2.1 	group_concat(k.nazwa separator ' | ')
SELECT w.nazwa, count(u.id_uczestnika) as 'ilosc uczestnikow',
group_concat(k.nazwa) as 'nazwy uczestnikow' FROM wyprawa w
inner join uczestnicy u on w.id_wyprawy=u.id_wyprawy
inner join kreatura k on u.id_uczestnika=k.idKreatury
group by w.nazwa;
+-----------------------+-------------------+----------------------------------------------------------------+
| nazwa                 | ilosc uczestnikow | nazwy uczestnikow                                              |
+-----------------------+-------------------+----------------------------------------------------------------+
| Nakarm kanibala       |                 6 | Bjorn,Khorad,Astrid,Bjolkolur,Drozd,Dziadek                    |
| Polowanie na tesciowa |                 7 | Bjorn,Birgun,Ibra,Loko,Drozd,Szczeki,Dziadek                   |
| Poszukiwanie ziecia   |                 5 | Nemo,Tesciowa,Tiki,sztuczna szczeka tesciowej,Tesciowa dziadka |
+-----------------------+-------------------+----------------------------------------------------------------+
	#Zadanie 2.2
SELECT w.nazwa, s.nazwa, ew.kolejnosc, k.nazwa from kreatura k
inner join wyprawa w on k.idKreatury=w.kierownik
inner join etapy_wyprawy ew on w.id_wyprawy=ew.idWyprawy
inner join sektor s on ew.sektor=s.id_sektora
order by w.data_rozpoczecia, ew.kolejnosc ASC;
+-----------------------+--------------------+-----------+----------+
| nazwa                 | nazwa              | kolejnosc | nazwa    |
+-----------------------+--------------------+-----------+----------+
| Poszukiwanie ziecia   | Pieczara tesciowej |         1 | Tesciowa |
| Nakarm kanibala       | Chatka dziadka     |         1 | Dziadek  |
| Poszukiwanie ziecia   | Wulkan             |         2 | Tesciowa |
| Nakarm kanibala       | Pieczara tesciowej |         2 | Dziadek  |
| Poszukiwanie ziecia   | Wioska Kanibali    |         3 | Tesciowa |
| Nakarm kanibala       | Zatoka rekinow     |         3 | Dziadek  |
| Poszukiwanie ziecia   | Pieprzne pole      |         4 | Tesciowa |
| Nakarm kanibala       | Wulkan             |         4 | Dziadek  |
| Poszukiwanie ziecia   | Chatka dziadka     |         5 | Tesciowa |
| Nakarm kanibala       | Wioska Kanibali    |         5 | Dziadek  |
| Polowanie na tesciowa | Kokosowa plaza     |         1 | Bjorn    |
| Polowanie na tesciowa | Chatka dziadka     |         2 | Bjorn    |
| Polowanie na tesciowa | Wulkan             |         3 | Bjorn    |
| Polowanie na tesciowa | Zatoka rekinow     |         4 | Bjorn    |
| Polowanie na tesciowa | Pieczara tesciowej |         5 | Bjorn    |
+-----------------------+--------------------+-----------+----------+


	#Zadanie 3.1
SELECT s.nazwa, IFNULL(count(idWyprawy),0) as 'ilosc odwiedzin' FROM sektor s
left join etapy_wyprawy ew on s.id_sektora=ew.sektor group by s.nazwa;
+--------------------+-----------------+
| nazwa              | ilosc odwiedzin |
+--------------------+-----------------+
| Wioska Kanibali    |               2 |
| Zabojcza skala     |               0 |
| Magiczna jaskinia  |               0 |
| Pieprzne pole      |               1 |
| Wulkan             |               3 |
| Pieczara tesciowej |               3 |
| Chatka dziadka     |               3 |
| Kokosowa plaza     |               1 |
| Zatoka rekinow     |               2 |
+--------------------+-----------------+

	#Zadanie 3.2
SELECT distinct(k.nazwa), IF(u.id_wyprawy is null,'Nie bral udzialu w wyprawie', 'Bral udzial w wyprawie') as 'Czy bral udzial w wyprawie' FROM kreatura k
left join uczestnicy u on k.idKreatury=u.id_uczestnika;
		#ALBO
SELECT k.nazwa, IF(count(u.id_wyprawy) >0,'Bral udzial w wyprawie', 'Nie bral udzialu w wyprawie') as 'Czy bral udzial w wyprawie' FROM kreatura k
left join uczestnicy u on k.idKreatury=u.id_uczestnika group by k.nazwa;
+----------------------------+-----------------------------+
| nazwa                      | Czy bral udzial w wyprawie  |
+----------------------------+-----------------------------+
| Bjorn                      | Bral udzial w wyprawie      |
| Brutal                     | Nie bral udzialu w wyprawie |
| Khorad                     | Bral udzial w wyprawie      |
| Birgun                     | Bral udzial w wyprawie      |
| Defgard                    | Nie bral udzialu w wyprawie |
| Astrid                     | Bral udzial w wyprawie      |
| Ibra                       | Bral udzial w wyprawie      |
| Bjolkolur                  | Bral udzial w wyprawie      |
| Nemo                       | Bral udzial w wyprawie      |
| Loko                       | Bral udzial w wyprawie      |
| Drozd                      | Bral udzial w wyprawie      |
| Ara                        | Nie bral udzialu w wyprawie |
| Szczeki                    | Bral udzial w wyprawie      |
| Tesciowa                   | Bral udzial w wyprawie      |
| Tiki                       | Bral udzial w wyprawie      |
| Dziadek                    | Bral udzial w wyprawie      |
| sztuczna szczeka tesciowej | Bral udzial w wyprawie      |
| Tesciowa dziadka           | Bral udzial w wyprawie      |
| Babajaga                   | Nie bral udzialu w wyprawie |
+----------------------------+-----------------------------+

	#Zadanie 4.1
SELECT w.nazwa, sum(length(ew.dziennik)) from wyprawa w
inner join etapy_wyprawy ew on w.id_wyprawy=ew.idWyprawy group by w.nazwa having sum(length(ew.dziennik))<400;
+-----------------------+--------------------------+
| nazwa                 | sum(length(ew.dziennik)) |
+-----------------------+--------------------------+
| Poszukiwanie ziecia   |                      344 |
| Polowanie na tesciowa |                      310 |
+-----------------------+--------------------------+
	#Zadanie 4.2
	#TO JEST ZLE
SELECT w.nazwa, sum(z.waga*z.ilosc), count(u.id_uczestnika),(sum(z.waga*z.ilosc)/count(u.id_uczestnika)) as 'srednia waga zasobow' FROM wyprawa w
left join uczestnicy u on w.id_wyprawy=u.id_wyprawy
left join kreatura k on u.id_uczestnika=k.idKreatury
left join ekwipunek e on k.idKreatury=e.idKreatury
left join zasob z on e.idZasobu=z.idZasobu group by w.nazwa;
	#TO JUZ NIE
SELECT  u.id_Wyprawy, (sum(z.waga*e.ilosc)/count(distinct u.id_uczestnika)) as 'srednia waga zasobow' FROM uczestnicy u
left join ekwipunek e on u.id_uczestnika=e.idKreatury
left join zasob z on z.idZasobu=e.idZasobu group by u.id_wyprawy;
	#mozna dodac round(jakieswierwsze,2)  - do 2 liczb po ','
+------------+----------------------+
| id_Wyprawy | srednia waga zasobow |
+------------+----------------------+
|          1 |             2.800000 |
|          2 |            14.814286 |
|          3 |            12.516667 |
+------------+----------------------+

	#Zadanie 5.1
SELECT k.nazwa, datediff(w.data_rozpoczecia, k.dataUr)as 'ile ma dni' from kreatura k
inner join uczestnicy u on k.idKreatury=u.id_uczestnika
inner join wyprawa w on u.id_wyprawy=w.id_wyprawy
inner join etapy_wyprawy ew on w.id_wyprawy=ew.idWyprawy
inner join sektor s on ew.sektor=s.id_sektora where s.nazwa='chatka dziadka';
+----------------------------+------------+
| nazwa                      | ile ma dni |
+----------------------------+------------+
| Nemo                       |       8339 |
| Tesciowa                   |      16376 |
| Tiki                       |      10220 |
| sztuczna szczeka tesciowej |       7293 |
| Tesciowa dziadka           |      25661 |
| Bjorn                      |      11082 |
| Birgun                     |       9216 |
| Ibra                       |       9678 |
| Loko                       |       8338 |
| Drozd                      |       9159 |
| Szczeki                    |       9616 |
| Dziadek                    |      20281 |
| Bjorn                      |      11080 |
| Khorad                     |      10610 |
| Astrid                     |       8384 |
| Bjolkolur                  |       8890 |
| Drozd                      |       9157 |
| Dziadek                    |      20279 |
+----------------------------+------------+