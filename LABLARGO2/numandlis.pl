% Some predicates using numeric operations.
% Note the use of "is"

square(N,Result) :-
	Result is N**2. 

average3(X, Y, Z, Result) :-
	Result is (X+Y+Z)/3.

divisible(X,Y) :-
	0 is X mod Y.


is_positive(X):-
	X>=0.

is_negative(X):-
	X<0.

factorial(0,1).

factorial(N,FacN) :-
	N > 0,
	M is N-1,
	factorial(M,FacM),
	FacN is N*FacM.

% Lists in Prolog are similar to those in Haskell
% A list can be written as [a,b,c,d], where a, b, c and d are the elements of
% the list, or as [f|r], where f is the first element of the list 
% and r is the LIST containing the rest of the elements:
% Thus, [a,b,c,d] == [a|[b,c,d]] == [a|[b|[c,d]]] == [a|[b|[c|[d]]]] == 
% ==[a|[b|[c|[d|[]]]]]

listlength([], 0).

listlength([_|X], M) :-
	listlength(X, N),
	M is N+1.

% Note the relevance of distinguishing when a variable is instanciated by an element
% or by a list os sublist


last(X,[X]).

last(X,[_|M]) :- 
	last(X,M).



pAN([],0,0).
pAN([I|X],P,N):-
	pAN(X, P1, N1),
	(I >= 0 -> P is P1 + 1, N1 = N
    ;  I < 0  ->  P = P1, N is N1+1
    ;   P = P1, N1 = N).
	


first_even([], -1).

first_even([First|_], First) :- 0 is First mod 2.

first_even([_|Rest], Whatever) :-
	first_even(Rest, Whatever).

ordered([]).

ordered([_]).

ordered([X|[Y|Z]]) :-
	X =< Y,
	ordered([Y|Z]).


