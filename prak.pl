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

/*Bagian 2 : Rekursivitas*/
/*Nomor 1 Exponent*/
/*Deklarasi Fakta*/
exponent(X,0,1).
exponent(X,1,X).

/*Deklarasi Rules*/
exponent(X,Y,Z) :- 
    Y1 is Y-1,
    exponent(X,Y1,Z1),
    Z is Z1*X.

/*Nomor 2 Population*/
/*Deklarasi Fakta*/
population(P, R, 0, _, P) :- !.

/*Deklarasi Rules*/
population(P,R,T,C,X):-
    T mod 2 =:= 0,
    T1 is T-1,
    population(P,R,T1,C,X1),
    C1 is C+T,
    X is X1*R - C1.
    
population(P,R,T,C,X):-
    T mod 2 =:= 1,
    T1 is T-1,
    population(P,R,T1,C,X1),
    C1 is C+T,
    X is X1*R + C1.

/*Nomor 3 Perrin*/
/*Deklarasi Fakta*/
perrin(0, 3).
perrin(1, 0).
perrin(2, 2).

/*Deklarasi Rules*/
perrin(X,Y) :-
    X1 is X-2,
    X2 is X-3,
    perrin(X1, M),
    perrin(X2, N),
    Y is M + N.

/*Nomor 4 HCF*/
/*Deklarasi Fakta*/
hcf(A,0,A) :- !.

/*Deklarasi Rules*/
hcf(A,B,X) :-
    B =\= 0,
    X1 is A mod B,
    hcf(B,X1,X).

/*Nomor 5 Make Pattern*/
/*Deklarasi Fakta*/
writeLine(0,C).
writeLine(X,C):-
    write(C),
    X1 is X-1,
    writeLine(X1,C).
    
