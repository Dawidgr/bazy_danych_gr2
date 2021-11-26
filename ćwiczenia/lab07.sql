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
SELECT w.nazwa, s.nazwa, k.nazwa from kreatura k
inner join wyprawa w on k.idKreatury=w.kierownik
inner join etapy_wyprawy ew on w.id_wyprawy=ew.idWyprawy
inner join sektor s on ew.sektor=s.id_sektora
order by w.data_rozpoczecia, ew.kolejnosc ASC;
+-----------------------+--------------------+----------+
| nazwa                 | nazwa              | nazwa    |
+-----------------------+--------------------+----------+
| Poszukiwanie ziecia   | Pieczara tesciowej | Tesciowa |
| Nakarm kanibala       | Chatka dziadka     | Dziadek  |
| Poszukiwanie ziecia   | Wulkan             | Tesciowa |
| Nakarm kanibala       | Pieczara tesciowej | Dziadek  |
| Poszukiwanie ziecia   | Wioska Kanibali    | Tesciowa |
| Nakarm kanibala       | Zatoka rekinow     | Dziadek  |
| Poszukiwanie ziecia   | Pieprzne pole      | Tesciowa |
| Nakarm kanibala       | Wulkan             | Dziadek  |
| Poszukiwanie ziecia   | Chatka dziadka     | Tesciowa |
| Nakarm kanibala       | Wioska Kanibali    | Dziadek  |
| Polowanie na tesciowa | Kokosowa plaza     | Bjorn    |
| Polowanie na tesciowa | Chatka dziadka     | Bjorn    |
| Polowanie na tesciowa | Wulkan             | Bjorn    |
| Polowanie na tesciowa | Zatoka rekinow     | Bjorn    |
| Polowanie na tesciowa | Pieczara tesciowej | Bjorn    |
+-----------------------+--------------------+----------+

	#Zadanie 3.1
SELECT s.nazwa, IFNULL(count(idWyprawy),0) 'ilosc odwiedzin' FROM sektor s
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
SELECT k.nazwa, IFNULL('Bral udzial w wyprawie', 'Nie brał udziału w wyprawie') FROM kreatura k
left join uczestnicy u on k.idKreatury=u.id_uczestnika group by k.nazwa;