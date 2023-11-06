loop:-
    repeat,
    write('Mas masukin end biar kelar :'),
    read(X),
    write(X), nl,
    X == end.


for_loop(X,Y) :-
    repeat,
    write(Y),nl,
    X is X-1,
    X == 0.