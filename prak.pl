/*Untuk PraPrak_13522031.pl*/

/*Bagian 1 : Fakta, Rule, dan Query*/
/*Deklarasi Fakta*/

pria(athif).
pria(henri).
pria(robert).
pria(bagas).
pria(daniel).
pria(rupert).
pria(fio).
pria(dillon).
pria(hanif).
pria(michael).
wanita(joli).
wanita(margot).
wanita(jena).
wanita(emma).
wanita(elysia).
wanita(jeni).
wanita(ana).

usia(athif,60).
usia(henri,48).
usia(robert,32).
usia(bagas,29).
usia(daniel,7).
usia(rupert,6).
usia(fio,30).
usia(dillon,63).
usia(hanif,47).
usia(michael,28).
usia(joli,58).
usia(margot,43).
usia(jena,27).
usia(emma,6).
usia(elysia,500).
usia(jeni,28).
usia(ana,23).

menikah(athif,joli).
menikah(joli,athif).
menikah(henri,margot).
menikah(margot,henri).
menikah(jena,fio).
menikah(fio,jena).
menikah(fio,jeni).
menikah(jeni,dio).
menikah(dillon,elysia).
menikah(elysia,dillon).

anak(margot,athif).
anak(michael,athif).
anak(margot,joli).
anak(michael,joli).

anak(robert,henri).
anak(bagas,henri).
anak(jena,henri).
anak(robert,margot).
anak(bagas,margot).
anak(jena,margot).

anak(daniel,jena).
anak(rupert,jena).
anak(daniel,fio).
anak(rupert,fio).

anak(emma,fio).
anak(emma,jeni).

anak(jeni,hanif).
anak(ana,hanif).

anak(hanif,dillon).
anak(hanif,elysia).

/*Deklarasi rules*/

saudara(X,Y) :-  anak(X,M),anak(Y,M),X\==Y.
saudaratiri(X,Y) :- anak(X,M),anak(Y,M),menikah(M,L),menikah(M,Z),anak(X,L),anak(Y,Z),L \== Z, X\==Y.
kakak(X,Y) :- saudara(X,Y), usia(X,L), usia(Y,P), L > P.
keponakan(X,Y) :- saudara(M,Y), anak(X,M), Y\==M.
mertua(X,Y) :- menikah(X,M), anak(M,Y).
nenek(X,Y) :- anak(X,M), anak(M,Y), wanita(Y).
keturunan(X, Y) :- anak(X, Z), keturunan(Z, Y).
keturunan(X, Y) :- anak(X, Y).
lajang(X) :- pria(X),\+menikah(X,Y).
lajang(X) :- wanita(X),\+menikah(X,Y).
anakbungsu(X) :- pria(X), \+ kakak(X,Y), anak(X,M).
anakbungsu(X) :- wanita(X), \+ kakak(X,Y), anak(X,M).
yatimpiatu(X) :- pria(X),\+anak(X,M).
yatimpiatu(X) :- wanita(X),\+anak(X,M).