p(0, positive).
p(N, positive) :- N > 0,!, N1 is N - 1, p(N1, positive).
p(N, negative) :- \+(p(N, positive)).
