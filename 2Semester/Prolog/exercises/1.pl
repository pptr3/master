p(X) :- q(X), r.
q(1).
q(2).
r.
 
% Prolog:
chesaniPrint(X, ReturnVariable) :-
    print(X), nl,
    ReturnVariable is 5+3.
chesaniPrint(X, ReturnVariable) :-
    print(X), nl,
    print('Chesanis hari is fluent!), nl,
    ReturnVariable is 5+3.
 
% what if I should write it in JAVA?
int chesaniPrint(String X) {
    System.out.println(X);
    return 3+5;
}
int chesaniPrint(String X) {
    System.out.println("Chesani is wonderful!");
    System.out.println(X);
    return 3+5;
}
 
% In JAVA:
int x = 5;
 
% In prolog, '=' does not mean assignment...
% In Prolog, 'is' stands for mathematical evaluator
% it is used only with mathematical expressions
 
:- T is 5+3.
Yes, T = 8.
 
:- T is 5+X.
 
:- X is 3,    T is 5+X.
:- is(X,3), is(T,+(5,X)).
:- X/3, is(T,+(5,3)).
:- is(T,+(5,3)).
:- is(T,8)
:- T/8.
 
% do a program that receives N as input,
% and prints N time the sentence "Hello world"
% In JAVA:
void chesani(int n) {
    for (i=0; i<n; i++)
        System.out.println("Hello world");
}
% In Prolog:
chesani(0).
chesani(N) :-
    print('Hello world'), nl,
    N1 is N-1,
    chesani(N1).