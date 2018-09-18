/*
Parte 1
*/
padreomadre(ana, juan).
padreomadre(fer, pepe).
padreomadre(fer, ana).
mujer(ana).
hombre(fer).
hombre(pepe).
hombre(juan).

hermano(X, Y):-
	hombre(X),
	padreomadre(Z, X),
	padreomadre(Z, Y),
	X \== Y.

/*
								TRAZA

?- trace.
true.

[trace]  ?- hermano(X,Y).
   Call: (8) hermano(_1610, _1612) ? creep
   Call: (9) hombre(_1610) ? creep 					-PTO BT 1
   Exit: (9) hombre(fer) ? creep
   Call: (9) padreomadre(_1864, fer) ? creep		
   Fail: (9) padreomadre(_1864, fer) ? creep
   Redo: (9) hombre(_1610) ? creep					-IR A PTO 1
   Exit: (9) hombre(pepe) ? creep					
   Call: (9) padreomadre(_1864, pepe) ? creep
   Exit: (9) padreomadre(fer, pepe) ? creep
   Call: (9) padreomadre(fer, _1612) ? creep		-PT0 BT 2
   Exit: (9) padreomadre(fer, pepe) ? creep
   Call: (9) pepe\==pepe ? creep
   Fail: (9) pepe\==pepe ? creep
   Redo: (9) padreomadre(fer, _1612) ? creep		-IR A PTO 2
   Exit: (9) padreomadre(fer, ana) ? creep
   Call: (9) pepe\==ana ? creep
   Exit: (9) pepe\==ana ? creep
   Exit: (8) hermano(pepe, ana) ? creep
X = pepe,
Y = ana 
   Redo: (9) hombre(_1610) ? creep					-IR A PTO 1
   Exit: (9) hombre(juan) ? creep
   Call: (9) padreomadre(_1864, juan) ? creep
   Exit: (9) padreomadre(ana, juan) ? creep
   Call: (9) padreomadre(ana, _1612) ? creep
   Exit: (9) padreomadre(ana, juan) ? creep
   Call: (9) juan\==juan ? creep
   Fail: (9) juan\==juan ? creep
   Fail: (8) hermano(_1610, _1612) ? creep
false.
*/

/*
Parte 2
*/

% La potencia de un numero
potencia(X, 1, X).
potencia(X, Y, Z):-
	Y > 1,
	Y2 is Y - 1,
	potencia(X, Y2, Z2),
	Z is X * Z2.

% La Sumatoria de todos los numeros naturales entre 1 y N.
sumatoria(1, 1).
sumatoria(X, Y):-
	X > 1,
	X2 is X-1,
	sumatoria(X2, Y2),
	Y is X + Y2.

% La Sumatoria de todos los numeros pares naturales entre 1 y N.
suma2(0, 0).
% Cuandos los numeros son pares
suma2(X, Y):-
	X > 0,
	X2 is X//2,
	X2 = 0,
	suma2(X2, Y2),
	Y is X + Y2.
% Cuando los numeros no son pares
suma2(X, Y):-
	X > 0,
	X2 is X//2,
	X2 =\= 0,
	X3 = X2 - 1,
	suma2(X3, Y2),
	Y is X + Y2.

% La suma de todas las cifras de un numero natural.
sumacifra(X,Y):-
	X2 is X/10,
	X2 = 0,
	Y = 0.

sumacifra(X,Y):-
	X2 is X mod 10,
	Z is X//10,
	sumacifra(Z,F2),
	Y is X2 + F2.