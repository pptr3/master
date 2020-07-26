print_hw(0).
print_hw(N) :- print("Hello World!"), N2 is N - 1, print_hw(N2).

chesani(0).
chesani(N) :-
    print('Hello world'),
    N1 is N-1,
    chesani(N1).

fatt(0, 1).
fatt(N, Res) :- N>0, N2 is N - 1, fatt(N2, Res2), Res is N * Res2.

%ex1
last([X], X).
last([_|T], Res) :- last(T, Res).
    
%ex2 TODO
sublist2([H], [H | _]).
sublist2([H | T1], [H | T2]) :- sublist2(T1, T2).
sublist22([H | T1], [H | T2]) :- sublist2(T1, T2).
sublist22([H1 | T1], [H2 | T2]) :- H1 =\= H2, sublist2([H1 | T1], T2).


%ex3
rev([], A, A).
rev([H | T], A, Res) :- rev(T, [H | A], Res).

pal(L) :- rev(L, [], A), L == A.

%ex4
repeat2([], []).
repeat2([H | T], [H, H | Res]) :- repeat2(T, Res).

%myex: compute the length of a list
length2([], 0).
length2([_ | T], Res) :- length2(T, Res2), Res is Res2 + 1.

%ex5
count2(_, [], 0).
count2(A, [A | T], Res3) :- count2(A, T, Res2), Res3 is Res2 + 1.
count2(A, [_| T], Res) :- count2(A, T, Res).

%ex6 TODO


%ex7
sort2(L, Res) :- sort(L, Res).

%%%%%%% MY EX %%%%%%%%

%ex1: Write a predicate thet receives a list of integers and returns a new list containing only positive numbers
ff([], []).
ff([H | T], L) :- H > 0,!, ff(T, L2), L = [H | L2]. % note the usage of cut
ff([_ | T], L) :- ff(T, L).

%ex2: Define a Prolog predicate maxlist/2 that takes in
input a list of list of integers, and returns a new list,
containing the max element of each list of integers
provided in input.

# I define a max predicate for make ease the implementation of maxlist/2
max([], X, X).
max([H | T], A, Res) :- H > A,!, max(T, H, Res).
max([_ | T], A, Res) :- max(T, A, Res).
max_call(L, N) :-  max(L,-1.0Inf, N). # not the usage of -1.0Inf which is how -infinity is represented in Prolog

# recursive way
maxlist([], []).
maxlist([L | T2], Res) :- maxlist(T2, Res2), max_call(L, Res3), Res = [Res3 | Res2].

?- maxlist([[3,10,2], [6,9], [1,2]], X).

# tail recursive way
maxli2([], X, X).
maxli2([L | T2], A, Res) :- max_call(L, Res2), A2 = [Res2 | A], maxli2(T2, A2, Res).

?- maxli2([[3,10,2], [6,9], [1,2]],[], X).

%ex3: Given a list L1 and a number N, write a predicate
domanda1(L1, N, L2) that return in L2 the list of
elements of L1 that are lists, and that contain only two
positive integers in the range 1..9, whose sum
amounts to N.

domanda1([], _, []).
domanda1([[F, S | T1] | T2], N, Res) :- domanda1(T2, N, Res2), F > 0, S > 0, F > 0, F < 10, S > 0, S < 10, N is F + S, Res = [[F, S | T1] | Res2].
domanda1([_ | T], N, Res) :- domanda1(T, N, Res).