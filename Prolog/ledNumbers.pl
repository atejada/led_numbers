number(0,[[' _  '],['| | '],['|_| ']]).
number(1,[['  '],['| '],['| ']]).
number(2,[[' _  '],[' _| '],['|_  ']]).
number(3,[['_  '],['_| '],['_| ']]).
number(4,[['    '],['|_| '],['  | ']]).
number(5,[[' _  '],['|_  '],[' _| ']]).
number(6,[[' _  '],['|_  '],['|_| ']]).
number(7,[['_   '],[' |  '],[' |  ']]).
number(8,[[' _  '],['|_| '],['|_| ']]).
number(9,[[' _  '],['|_| '],[' _| ']]).

digits(0,[]).
digits(X,[H|T]) :- (X/10 > 0 -> H1 is floor(X/10), H is X mod 10, digits(H1,T)), !.

accRev([],A,A).
accRev([H|T],A,R) :- accRev(T,[H|A],R). 

getDigits(L,R) :- digits(L,Y), accRev(Y, [], R).

show_records([]).
show_records([A|B]) :-
  print_records(A), nl,
  show_records(B).  

print_records([]).
print_records([A|B]) :-
  format('~w',A), 
  print_records(B).

merge([L], L).
merge([H1,H2|T], R) :- maplist(append, H1, H2, H),
    merge([H|T], R), !.

listnum([],[]).
listnum([H1|T1],[R|Y]) :- number(H1,R), listnum(T1,Y).

led(X) :- getDigits(X,Y), listnum(Y,Z), merge(Z,R), show_records(R).
