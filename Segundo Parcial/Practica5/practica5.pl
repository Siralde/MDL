%         EJERCICIO A



% Devuelve el elemento que 
% está en la posición N-ésima dentro de una lista
% Caso Recursivo
posN(N,[_|Cola], X):-
	N2 is N - 1,
	posN(N2, Cola, X).

% Caso Base
posN(1,[Cab|_], Cab).






%         EJERCICIO B


% Devuelve el mínimo de una lista de números

min([Cabeza|Cola], M):-
  min(Cola, M2),
  M2 < Cabeza,
  M = M2.

min([Cabeza|Cola], M):-
  min(Cola, M2),
  M2 > Cabeza,
  M = Cabeza.

min([M], M).

%min([Cabeza|Cola], M):-
% min2(Cola, Cabeza, M).
% Caso Recursivo
%min2([Cabeza|Cola], Y, M) :-
%  Cabeza =< Y,
%  min2(Cola, Cabeza, M).

%min2([Cabeza|Cola], Y, M):-
%  Cabeza >= Y,
%  min2(Cola, Y, M).
% Caso Base
%min2([], M, M).



%         EJERCICIO C



% Extrae el mínimo de una lista de números.
% Utilizo la recursion anterior y luego elimino ese valor de la lista 
selec_min([Cabeza|Cola], M, L):-
	min([Cabeza|Cola], M),
	elimina(M, [Cabeza|Cola], L).
% Caso Recursivo

%elimina(Y, [Y|Xs], Zs):-
%  elimina(Y, Xs, Zs),
%  !.

%elimina(X, [Y|Xs], [Y|Zs]):-
%  elimina(X, Xs, Zs).

elimina(Y, [Cabeza|Cola], Lista1):-
  elimina(Y, Cola, Lista2),
  Y =:= Cabeza,
  Lista1 = Lista2.


elimina(Y, [Cabeza|Cola], Lista1):-
  elimina(Y, Cola, Lista2),
  Y =\= Cabeza,
  Lista1 = [Cabeza|Lista2].

% Caso Base
elimina(_, [], []).



%         EJERCICIO D


% Sustituye por Y todas las ocurrencias de X en la lista.
%Caso Recursivo 
sustituye(X, Y, [Cabeza|Cola], Lres):-
  sustituye(X, Y, Cola, Lres1),
  X =:= Cabeza,
  Lres = [Y|Lres1].

sustituye(X, Y, [Cabeza|Cola], Lres):-
  sustituye(X, Y, Cola, Lres1),
  X =\= Cabeza,
  Lres = [Cabeza|Lres1].

%Caso Base
sustituye(_,_,[],[]).




%         EJERCICIO E

% Predicado que elimina los elementos repetidos de una lista.
% Caso Recursivo
% Utilizo la recursion anterior "elimina"
elimina_repe([Cabeza|Cola], [Cabeza|L3]):-
  elimina(Cabeza, Cola, L2),
  elimina_repe(L2, L3).

% Caso Base
elimina_repe([],[]).




%         EJERCICIO F


% Predicado que elimina los elementos repetidos de una lista.

% Concatenar dos listas
% Caso Base
% Cuando la lista 1 se queda sin terminos pone en 
% la Concatenacion la lista 2
concatena([], L2, L2).

% Caso Recursivo
% Se va dividiendo la lista dos en caneza y cola
% Luego la cabeza se pone en la nueva lista
concatena([X|L1], L2, [X|C]):-
  concatena(L1, L2, C).


% Parte la lista en dos, una lista con los numeros mayores
% que el pivote y otra con los menores e igual al pivote
% Caso Recursivo
% Si X es mayor o igual que la cabeza de la lista 
% La lista menor seria los elementos de la cabeza
partir(X,[Cabeza|Cola],Lmen, Lmay):-
  X >= Cabeza,
  partir(X, Cola, Men, Lmay),
  Lmen = [Cabeza|Men].

% Si X es menor que la cabeza de la lista 
% La lista mayor seria los elementos de la cabeza
partir(X,[Cabeza|Cola], Lmen, Lmay):-
  X < Cabeza,
  partir(X, Cola, Lmen, May),
  Lmay = [Cabeza|May].

% Caso Base
partir(_,[],[],[]).


% Utilizo la recursion anterior y luego elimino ese valor de la lista 
quicksort([Cabeza|Cola], Lista):-
  partir(Cabeza, Cola, Izquierda, Derecha),
  quicksort(Izquierda,LIz),
  quicksort(Derecha,LDe),
  concatena(LIz, [Cabeza|LDe],Lista).

quicksort([],[]).