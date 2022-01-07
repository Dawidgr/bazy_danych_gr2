#zti_bazy lab_2

	#lab_3_zadania_1.md
	#1 +
SELECT imie, nazwisko, data_urodzenia from pracownik;
	#2 +
Select imie, nazwisko, (year(curdate())-year(data_urodzenia)) as 'wiek' from pracownik;
	#3 +
SELECT d.nazwa, count(p.id_pracownika) from dzial d
inner join pracownik p on d.id_dzialu=p.dzial
group by d.nazwa;
	#4 chyba o to chodziło, ten zapytanie działa
Select k.nazwa_kategori, sum(sm.ilosc) from kategoria k 
inner join towar t on k.id_kategori=t.kategoria
inner join stan_magazynowy sm on t.id_towaru=sm.towar
group by k.nazwa_kategori;
	#5 +
Select k.nazwa_kategori, group_concat(distinct t.nazwa_towaru) from kategoria k 
inner join towar t on k.id_kategori=t.kategoria
group by k.nazwa_kategori;
	#6 +
Select round(avg(pensja), 2) from pracownik;
	#7 +
Select avg(pensja) from pracownik where (year(curdate())-year(data_zatrudnienia))>=5;
	#8 +
Select t.nazwa_towaru, count(pz.ilosc) from towar t
inner join pozycja_zamowienia pz on t.id_towaru=pz.towar
group by t.nazwa_towaru order by count(pz.ilosc) DESC;
	#9 +
Select z.numer_zamowienia, (pz.ilosc*pz.cena) as 'wartosc' from zamowienie z
inner join pozycja_zamowienia pz on z.id_zamowienia=pz.zamowienie
where year(z.data_zamowienia)=2017 AND month(z.data_zamowienia) between 1 and 3;
	#10 może być źle, nwm
Select p.imie, p.nazwisko, sum(pz.ilosc*pz.cena) as 'wartosc' from pracownik p
inner join zamowienie z on p.id_pracownika=z.pracownik_id_pracownika
inner join pozycja_zamowienia pz on z.id_zamowienia=pz.zamowienie
group by p.id_pracownika order by sum(pz.ilosc*pz.cena) DESC;

	#lab_3_zadania_2.md
	#1 +
Select d.nazwa, min(p.pensja), max(p.pensja), avg(p.pensja) from dzial d
left join pracownik p on d.id_dzialu=p.dzial
group by d.nazwa;
	#2 -
Select k.pelna_nazwa, pz.ilosc*pz.cena from klient k
left join zamowienie z on k.id_klienta=z.klient
left join pozycja_zamowienia pz on z.id_zamowienia=pz.zamowienie
order by pz.ilosc*pz.cena DESC limit 10;
	#3 +
SELECT sum(pz.cena*pz.ilosc), year(z.data_zamowienia) from zamowienie z
left join pozycja_zamowienia pz on z.id_zamowienia=pz.zamowienie
group by year(z.data_zamowienia) order by sum(pz.cena*pz.ilosc) DESC;
	#4 +
SELECT sum(pz.ilosc*pz.cena) from zamowienie z
left join pozycja_zamowienia pz on z.id_zamowienia=pz.zamowienie
left join status_zamowienia sz on z.status_zamowienia=sz.id_statusu_zamowienia
where sz.nazwa_statusu_zamowienia='anulowane';
	#5 -
select ak.miejscowosc, count(z.id_zamowienia), sum(pz.ilosc*pz.cena) from pozycja_zamowienia pz
left join zamowienie z on pz.zamowienie=z.id_zamowienia
left join klient k on z.klient=k.id_klienta
left join adres_klienta ak on k.id_klienta=ak.klient
group by ak.miejscowosc;
	#6 +
SELECT sum((pz.cena-t.cena_zakupu)*pz.ilosc) from zamowienie z
left join pozycja_zamowienia pz on z.id_zamowienia=pz.zamowienie
left join status_zamowienia sz on z.status_zamowienia=sz.id_statusu_zamowienia
left join towar t on pz.towar=t.id_towaru
where sz.nazwa_statusu_zamowienia='zrealizowane';
	#7 +
SELECT sum((pz.cena-t.cena_zakupu)*pz.ilosc) from zamowienie z
left join pozycja_zamowienia pz on z.id_zamowienia=pz.zamowienie
left join status_zamowienia sz on z.status_zamowienia=sz.id_statusu_zamowienia
left join towar t on pz.towar=t.id_towaru
left join stan_magazynowy sm on t.id_towaru=sm.towar
where sz.nazwa_statusu_zamowienia='zrealizowane'
group by year(z.data_zamowienia);
	#8 +
select sum(t.cena_zakupu*sm.ilosc), k.nazwa_kategori from towar t
left join stan_magazynowy sm on t.id_towaru=sm.towar
left join kategoria k on t.kategoria=k.id_kategori
group by k.nazwa_kategori;
	#9 - SELECT MONTHNAME(CURDATE()); 
select MONTHNAME(data_urodzenia) from pracownik
group by month(data_urodzenia);
