
length([],0).
length([X,Y], N) :- length(Y,N1),N is N1+1.

member([X|_],X).
member([_|T],X):-member(T,X).

append([],X,X).
append([X|Y],Z,[X|T]):-append(Y,Z,T).

remove(X,[X|T],T).
remove(X,[Y|T],[Y|R]):-remove(X,T,R).

permute([],[]).
permute(X,[Y|T1]):-remove(Y,X,T),permute(T,T1).

sublist(S,R):-append(X,_,S),append(_,R,X).

remove1_3_first([X|Y],Y2):-
Y=[X1,Y1],Y1=[X2,Y2].

for_digit_list([],_).
for_digit_list([X,Y],N):-(N<X)->N=X,for_digit_list(Y,N).

remove2_3_first([],[]).
remove2_3_first([X|Y],[X3|Y3]):-remove(X,[X,Y],[X1,Y1]),remove(X1,[X1,Y1],[X2,Y2]),remove(X2,[X2,Y2],[X3,Y3]).
