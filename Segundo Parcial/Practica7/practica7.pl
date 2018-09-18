arco(a, b, 10).
arco(a, c, 12).
arco(a, d, 6).
arco(b, c, 5).
arco(c, e, 12).
arco(c, f, 4).
arco(d, e, 7).
arco(f, e, 5).


% Ejercicio A


% Predicado Eliminar de la practica 5 del laboratorio
% pero actualizado para expresiones no algebraicas
% Caso recursivo 1
elimina(Y, [Cabeza|Cola], Lista1):-
  elimina(Y, Cola, Lista2),
  Y == Cabeza,
  Lista1 = Lista2.

% Caso recursivo 2
elimina(Y, [Cabeza|Cola], Lista1):-
  elimina(Y, Cola, Lista2),
  Y \== Cabeza,
  Lista1 = [Cabeza|Lista2].

% Caso Base
 elimina(_, [], []).


% Predicado Arbol que calcula un arbol de extesion cualquiera
% a partir de los hechos declarados al principio del documento
% Predicado arbol/1 que oculta la lista Ln al usuario
arbol(L):-
	arbol([b,c,d,e,f], L).

% Caso Recursivo
arbol(Ln, L):-
	arco(X, Y, D), 
	member(Y, Ln),
	not(member(X, Ln)),
	elimina(Y, Ln, Lnn),
	arbol(Lnn, L2),
	L = [arco(X, Y, D)|L2].

% Caso Base
arbol([], []).

% A la hora de comprobar las soluciones se necesitaba que fueran arcos 
% no dirigidos para poder comprobarlos. Este problema se solocionaria 
% con arcos no dirigidos. De todas maneras el profesor de practicas me
% dijo que lo dejara asi



% Ejercicio B


 % Caso Recursivo
 arbol_min(Ln, L):-
% -------Primer Arco------
  	arco(X, Y, D), 
 	member(Y, Ln),
 	not(member(X, Ln)),
% -------Segundo Arco------
 	not((arco(OtroNoLista, OtroLista, D2),
 	member(OtroLista, Ln),
 	not(member(OtroNoLista, Ln)),
 	D2 < D)),
% -------Continuacion del Algoritmo------
 	elimina(Y, Ln, Lnn),
 	arbol_min(Lnn, L2),
	L = [arco(X, Y, D)| L2].

% Caso Base
arbol_min([], []).















