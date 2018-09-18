arco(a, b, 10).
arco(a, c, 12).
arco(a, d, 6).
arco(b, c, 5).
arco(c, e, 2).
arco(d, e, 7).

% Recorre un grafo dirigido
% Caso Recursivo
camino(Ini, Fin, [Ini|Camino2], Lo):-
	arco(Ini, X, D),
	camino(X, Fin, Camino2, Lo2),
	Lo is D + Lo2.

% Caso base
camino(X,X,[X],0).

arcond(X, Y, Dist):-
	arco(X, Y, Dist);
	arco(Y, X, Dist).

% Recorre un grafo no dirigido
caminond(Ini, Fin, Camino, Lo):-
	caminond(Ini, Fin, Camino, Lo, [Ini]).
	

% Caso Recursivo
caminond(Ini, Fin, [Ini|Camino2], Lo, V):-
	arcond(Ini, X, D),
	not(member(X, V)),
	caminond(X, Fin, Camino2, Lo2, [X|V]),
	Lo is D + Lo2.

% Caso base
caminond(X,X,[X],0,_).


% Calcula el camino minimo y la longitud de un camino 
% no dirigido
% 
minimo(Ini,Fin, Camino, X):-
	caminond(Ini, Fin, Camino, X, [Ini]),
	not((caminond(Ini,Fin, Camino2, Y, [Ini]), Y < X)).
