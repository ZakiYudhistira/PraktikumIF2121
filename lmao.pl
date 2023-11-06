/*Untuk File .pl*/

/* Bagian 1 */
/* Deklarasi Fakta */

/* pria(X). */
pria(athif).
pria(dillon).
pria(henri).
pria(michael).
pria(hanif).
pria(robert).
pria(bagas).
pria(fio).
pria(daniel).
pria(rupert).

/* wanita(x). */
wanita(joli).
wanita(elysia).
wanita(margot).
wanita(jena).
wanita(jeni).
wanita(ana).
wanita(emma).

/* usia(X, Y). */
usia(athif, 60).
usia(dillon, 63).
usia(henri, 48).
usia(michael, 28).
usia(hanif, 47).
usia(robert, 32).
usia(bagas, 29).
usia(fio, 30).
usia(daniel, 7).
usia(rupert, 6).
usia(joli, 58).
usia(elysia, 500).
usia(margot, 43).
usia(jena, 27).
usia(jeni, 28).
usia(ana, 23).
usia(emma, 6).

/* menikah(X, Y). */
menikah(athif, joli).
menikah(joli, athif).
menikah(dillon, elysia).
menikah(elysia, dillon).
menikah(henri, margot).
menikah(margot, henri).
/* menikah(hanif, hanif). */
menikah(jena, fio).
menikah(fio, jena).
menikah(fio, jeni).
menikah(jeni, fio).

/* anak(X, Y). */
anak(margot, athif).
anak(margot, joli).
anak(michael, athif).
anak(michael, joli).

anak(hanif, dillon).
anak(hanif, elysia).

anak(robert, henri).
anak(robert, margot).
anak(bagas, henri).
anak(bagas, margot).
anak(jena, henri).
anak(jena, margot).

anak(jeni, hanif).
anak(ana, hanif).

anak(daniel, jena).
anak(daniel, fio).
anak(rupert, jena).
anak(rupert, fio).

anak(emma, fio).
anak(emma, jeni).

/* Deklarasi Rules */
saudara(X, Y) :- anak(X, Z), anak(Y, Z), X \== Y.
saudaratiri(X, Y) :- anak(X, Z), anak(Y, Z), anak(X, A), anak(Y, B), menikah(Z, A), menikah(Z, B), A \== B.
kakak(X, Y) :- saudara(X, Y), usia(X, A), usia(Y, B), A > B.
keponakan(X, Y) :- anak(X, Z), saudara(Z, Y).
mertua(X, Y) :- menikah(Z, Y), anak(Z, X), Z \== Y.
nenek(X, Y) :- anak(Y, A), anak(A, X), wanita(X).

keturunan(X, Y) :- anak(X, Y).
keturunan(X, Y) :- anak(X, Z), keturunan(Z, Y).

lajang(X) :-
    pria(X),
    \+ menikah(X, _).
lajang(X) :-
    wanita(X),
    \+ menikah(X, _).

anakbungsu(X) :- anak(X, _), \+kakak(X, _).

yatimpiatu(X) :-
    pria(X),
    \+anak(X, _).
yatimpiatu(X) :-
    wanita(X),
    \+anak(X, _).

/* Bagian 2 */
/* SOAL 1 EKSPONEN */
exponent(_, 0, 1).
exponent(X, Y, Z) :-
    Y > 0,
    Y1 is Y-1,
    exponent(X, Y1, Res),
    Z is X * Res.

/* SOAL 2 POPULATION */
population(P, _, 0, _, X) :- !,
    X is P.

population(P, R, T, C, X) :-
    T > 0,
    T mod 2 =:= 1,
    T1 is T - 1,
    population(P, R, T1, C, A),
    C1 is C + T,
    X is R*A + C1.
population(P, R, T, C, X) :-
    T > 0,
    T mod 2 =:= 0,
    T1 is T - 1,
    population(P, R, T1, C, A),
    C1 is C + T,
    X is R*A - C1.

/* SOAL 3 PERRIN */
perrin(0, X) :- X is 3.
perrin(1, X) :- X is 0.
perrin(2, X) :- X is 2.

perrin(N, X) :-
    N >= 0,
    N1 is N - 2,
    N2 is N - 3,
    perrin(N1, X1),
    perrin(N2, X2),
    X is X1 + X2.

/* SOAL 4 HCF */
hcf(A, 0, X):-
    X is A.
hcf(A, B, X) :-
    B > 0,
    Mod is A mod B,
    hcf(B, Mod, Res),
    X is Res.

/* SOAL 5 MAKE PATTERN */
tulisLoop(0, _C).
tulisLoop(N, _C) :-
    N > 0,
    
    write(_C),

    N1 is N - 1,
    tulisLoop(N1, _C).

isiSampingKiri(0).
isiSampingKiri(Nfill) :-
    Nfill > 0,
    N2 is Nfill - 1,
    isiSampingKiri(N2),
    write(N2).

isiSampingKanan(0).
isiSampingKanan(Nfill) :-
    Nfill > 0,
    N2 is Nfill - 1,
    write(N2),
    isiSampingKanan(N2).

tulisRecurUpp(_N, _C, 0, _Constant).
tulisRecurUpp(_N, _C, I, _Constant) :-
    I > 0,
    Nfill is (_Constant - _N) // 2,

    isiSampingKiri(Nfill),
    tulisLoop(_N, _C),
    isiSampingKanan(Nfill), nl,

    C2 is _C + 1,
    I2 is I - 1,
    N2 is _N - 2,
    tulisRecurUpp(N2, C2, I2, _Constant).

tulisRecurDown(_N, _C, 0, _Constant).
tulisRecurDown(_N, _C, I, _Constant) :-
    I > 0,
    Nfill is (_Constant - _N) // 2,

    C2 is _C + 1,
    I2 is I - 1,
    N2 is _N - 2,
    tulisRecurDown(N2, C2, I2, _Constant),

    isiSampingKiri(Nfill),
    tulisLoop(_N, _C),
    isiSampingKanan(Nfill), nl.

makePattern(N) :-
    Nupp is (N + 1) // 2,
    Ndown is N // 2,
    tulisRecurUpp(N, 0, Nupp, N),
    tulisRecurDown(N, 0, Ndown, N).

/* Bagian 3 */
/* SOAL 1 Statistik List */
min([X|_L],  X) :-
    _L = [], !.

min([X | _L], Min) :-
    min(_L, Min1),
    X > Min1, !,
    Min is Min1.

min([X | _L], Min) :-
    min(_L, Min1),
    X =< Min1, !,
    Min is X.

max([X|_L],  X) :-
    _L = [], !.

max([X | _L], Max) :-
    max(_L, Max1),
    X < Max1, !,
    Max is Max1.

max([X | _L], Max) :-
    max(_L, Max1),
    X >= Max1, !,
    Max is X.

range(L, Range) :-
    min(L, Min),
    max(L, Max),
    Range is Max - Min.

count([], 0).
count([_ | _L], Count) :-
    count(_L, Count1),
    Count is Count1 + 1.

sum([], 0).
sum([X | L], Sum) :-
    sum(L, Sum1),
    Sum is X + Sum1.

/* SOAL 2.A Get Index */
getIndex([X | _L], SearchedElement, Result) :-
    X = SearchedElement, !,
    Result is 1.

getIndex([X | _L], SearchedElement, Result) :-
    X \= SearchedElement,
    getIndex(_L, SearchedElement, Result1),
    Result is Result1 + 1.

/* SOAL 2.B Get Element */
getElement([_X | _L], 1, Result) :-
    Result is _X, !.
getElement([_X | _L], Index, Result) :-
    Index2 is Index - 1,
    getElement(_L, Index2, Result).

/* SOAL 2.C Swap */
setElmt([_X | _L], 1, Value, [Value | _L]) :- !.
setElmt([_X | _L], Index, Value, List2) :-
    Index2 is Index -1,
    setElmt(_L, Index2, Value, List3),
    List2 = [_X | List3].

swap(List, Index1, Index2, Result) :-
    getElement(List, Index1, El1),
    getElement(List, Index2, El2),
    setElmt(List, Index1, El2, List2),
    setElmt(List2, Index2, El1, Result), !.

/* SOAL 2.D Slice */

slice([], _, _, []) :- !.
slice(_, _, 1, []) :- !.
slice([_X | _L], Start, End, Result) :-
    Start == 1,
    End2 is End - 1,
    slice(_L, Start, End2, TempList),
    Result = [_X | TempList].

slice(_, Start, End, Result) :-
    Start >= End,
    Result = [].

slice(_List, Start, End, Result) :-
    Start > 1,
    Start < End,
    _List = [_X | _L],
    Start1 is Start - 1, 
    End1 is End - 1,
    slice(_L, Start1, End1, Temp),
    Result = Temp.

/* SOAL 2.E Sort List */
ed_sort([X], _, [X]).
ed_sort([X | L], Index, Result) :-
    min(L, Min),
    X >= Min,
    getIndex(L, Min, Index2),
    setElmt(L, Index2, X, List2),
    ed_sort(List2, Index+1, List3),
    Result = [Min | List3].

ed_sort([X | L], Index, Result) :-
    min(L, Min),
    X < Min,
    ed_sort(L, Index+1, List2),
    Result = [X | List2].
    
sortList(List, Result) :- ed_sort(List, 1, Result).

/* Bagian 4 BONUS */
:- dynamic(secretNumber/1).
:- dynamic(score/1).
:- dynamic(isRunning/1).
:- dynamic(isCorrect/1).

welcome :-
    write('Welcome to Number Guesser Prolog!'), nl,
    write('Guess a Number between 1 to 100.'), nl.
    
initiateNumber :-
    random(1, 100, RandomNumber),
    asserta(secretNumber(RandomNumber)),
    asserta(score(0)),
    asserta(isRunning(true)),
    asserta(isCorrect(fail)).

showScore:-
    write('Score: '), score(X), write(X), nl.

setScore :-
    isCorrect(X), X ->
    retract(score(CurrentScore)),
    NewScore is CurrentScore + 10,
    asserta(score(NewScore)).
setScore :-
    isCorrect(X), \+X ->
    retract(score(CurrentScore)),
    NewScore is CurrentScore - 1,
    asserta(score(NewScore)).

guess(X) :-
    isRunning(Y), Y,
    secretNumber(Goal),
    X == Goal,
    write('Correct.'), nl,
    asserta(isCorrect(true)),
    setScore,
    showScore.
guess(X) :-
    isRunning(Y), Y,
    secretNumber(Goal),
    X < Goal,
    write('Too Small.'), nl,
    asserta(isCorrect(fail)),
    setScore,
    showScore.
guess(X) :-
    isRunning(Y), Y,
    secretNumber(Goal),
    X > Goal,
    write('Too Large.'), nl,
    asserta(isCorrect(fail)),
    setScore,
    showScore.

start :-
    welcome,
    initiateNumber,
    showScore.

reset :-
    secretNumber(Snum),
    write('Secret Number is '), write(Snum), nl,
    showScore,

    retract(secretNumber(_)),
    retract(score(_)),
    retract(isRunning(_)),
    retract(isCorrect(_)),

    write('resetting the game...'), nl, nl,
    start.

exit :-
    retract(secretNumber(_)),
    retract(score(_)),
    retract(isRunning(_)),
    retract(isCorrect(_)),
    write('Thankyou for playing!'), nl.