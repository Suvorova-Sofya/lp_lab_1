
findmaxsred(L,N):-
	[H|T]=L,
	H=student(_,_,[grade(_,N1),grade(_,N2),grade(_,N3),grade(_,N4),grade(_,N5),grade(_,N6)]),
	Help is N1+N2+N3+N4+N5+N6,
	Help2 is Help/6,
	(Help2>N)->N=Help2,
	findmaxsred(T,N).

findsredingroup_1(L,N,B):-
	[H|T]=L,
	H=student(_,_,[grade(_,N1),grade(_,N2),grade(_,N3),grade(_,N4),grade(_,N5),grade(_,N6)]),
	Help is (N1+N2+N3+N4+N5+N6)/6,
	(Help=:=N)->
		B=Help
	else
		findsredingroup(T,N,B).


findsredingroup_2(A,B):-
	findall(student(A,_,[grade(_,_),grade(_,_),grade(_,_),grade(_,_),grade(_,_),grade(_,_)]),student(A,_,[grade(_,_),grade(_,_),grade(_,_),grade(_,_),grade(_,_),grade(_,_)]),L),
	findmaxsred(L,N),
	findsredingroup_1(L,N,B).

 findstudent_1(L,L2):-
	[H|T]=L,
	H=student(_,A,[grade(_,N1),grade(_,N2),grade(_,N3),grade(_,N4),grade(_,N5),grade(_,N6)]),
	Help is (N1+N2+N3+N4+N5+N6)/6,
	(N1>2)->
		((N2>2)->
			((N3>2)->
				((N4>2)->
					((N5>2)->
						((N6>2)->
							(B=[A,"Yes",Help]);
						B=[A,"No",Help]);
					B=[A,"No",Help]);
				B=[A,"No",Help]);
			B=[A,"No",Help]);
		B=[A,"No",Help]);
	B=[A,"No",Help],
	append(L2,B,L3),
	findstudent_1(T,L3).

findstudent_2(L2):-
	findall(student(A,_,[grade(_,_),grade(_,_),grade(_,_),grade(_,_),grade(_,_),grade(_,_)]),student(A,_,[grade(_,_),grade(_,_),grade(_,_),grade(_,_),grade(_,_),grade(_,_)]),L),
	findstudent_1(L,L2).

findnopass_1(L,A,N):-
	[H|T]=L,
	H=student(_,_,[grade(A1,N1),grade(A2,N2),grade(A3,N3),grade(A4,N4),grade(A5,N5),grade(A6,N6)]),
	(A1=:=A)->((N1=<2)->(N is N1+1));
		((A2=:=A)->((N2=<2)->(N is N1+1)));
			((A3=:=A)->((N3=<2)->(N is N1+1)));
				((A4=:=A)->((N4=<2)->(N is N1+1)));
					((A5=:=A)->((N5=<2)->(N is N1+1)));
						((A6=:=A)->((N6=<2)->N is N1+1)),
	findnopass_1(T,N1).

findnopass_2(A,N):-
 	findall(student(_,_,[grade(_,_),grade(_,_),grade(_,_),grade(_,_),grade(_,_),grade(_,_)]),student(_,_,[grade(_,_),grade(_,_),grade(_,_),grade(_,_),grade(_,_),grade(_,_)]),L),
	findnopass_1(L,A,N).