% Sumar los elementos de una lista
% Caso Base
suma_l([], 0).
% Caso Recursivo
suma_l([Cabeza|Cola], S):-
	suma_l(Cola, S2),
	S is S2 + Cabeza.


% Miembros 
% Caso Base
miembro(X, [X|_]).

% Caso Recursivo
miembro(X, [Y|Cola]):-
	X \== Y,
	miembro(X, Cola).


% Posicion de un elemento
% Caso Base
% Si lo consigue en la la cabeza se le da el valor 1
pos(P, [P|_], 1).

% Caso Recursivo
% Si no conseguimos el elemento en la cabeza y 
% llamamos a la funcion solo con la cola y sumamos 
% uno cada vez que lo hacemos para llevar la cuenta
% de las posiciones
pos(P, [_|Cola], POS1):-
	pos(P, Cola, POS2),
	POS1 is POS2 + 1.

% Ultimo numero de la lista
% Caso Base
ultimo([ULT], ULT).

% Caso Recursivo
ultimo([_|Cola], N):-
	ultimo(Cola, N).


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


% Invierte de posicion los terminos de una lista
% Caso Base
invertir([], []).

% Caso Recursivo
% Para invertir la lista utilizo "cocatena"
% Haciendo que concatena vaya poniendo en la ultima posicion la
% cabeza de la lista
invertir([Cabeza|Cola], Original):-
	invertir(Cola, Invertida),
	concatena(Invertida, [Cabeza], Original).


% Parte la lista en dos, una lista con los numeros mayores
% que el pivote y otra con los menores e igual al pivote
% Caso Base
partir(_,[],[],[]).

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