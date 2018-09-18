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