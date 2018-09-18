num(0).
num(1).
num(2).

perm([X1, X2, X3]):-
	num(X1),
	num(X2),
	X1 \== X2,
	num(X3),
	% Restricciones que deben cumplir: ser distintas entre si
	X1 \== X3,
	X2 \== X3.


ejer_a(Permutaciones):-
findall(Soluciones, perm(Soluciones), Lista), length(Lista,Permutaciones).

%% Respuesta Ordernador:
%% N = 6.
%% Respuesta a papel:
%% 3! = 6.




%% Ejercicio B

numa(0).
numa(1).
numa(2).
numa(3).
numa(4).
numa(5).
numa(6).
numa(7).
numa(8).
numa(9).
numa(10).


soluciones([X1,X2,X3,X4]):-
	numa(X1),
	numa(X2),
	numa(X3),
	numa(X4),
	Suma is X1 + X2 + X3 + X4,
	Suma =:= 10.

ejer_b(NumSoluciones):-
findall(Resultados, soluciones(Resultados), Lista), length(Lista,NumSoluciones).

%% Respuesta Ordernador:
%% N = 286.
%% Respuesta a papel:
%% 3! = 6.



%% Ejercicio C.

numc(0).
numc(1).

variaciones([X1, X2, X3, X4, X5, X6]):-
	numc(X1),
	numc(X2),
	numc(X3),
	numc(X4),
	numc(X5),
	numc(X6),
	Suma is X1 + X2 + X3 + X4 + X5 + X6,
	Suma < 3.

ejer_c(NumSoluciones):-
findall(Resultados, variaciones(Resultados), Lista), length(Lista,NumSoluciones).
%% Respuesta Ordernador:
%% N = 22.
%% Respuesta a papel:
%% Secuencias de n Bits con Peso k:
%% |𝑊𝑘𝑛|=𝑛!𝑘!/(𝑛−𝑘)!
%% Con k = 0, las Numero de Solucines seria 1
%% Con k = 1, las Numero de Solucines seria 6
%% Con k = 2, las Numero de Solucines seria 15
%% Si sumamos el numero de solucones el resultado final es 22



%% Ejercicio D.

numcarta(1).
numcarta(2).
numcarta(3).
numcarta(4).
numcarta(5).
numcarta(6).
numcarta(7).
numcarta(8).
numcarta(9).
numcarta(10).
numcarta(j).
numcarta(k).
numcarta(q).
palo(p).
palo(c).
palo(r).
palo(t).

%% carta(palo, numcarta).
manospoker([C1, C2, C3, C4, CR]):-
	numcarta(Y),
%% Carta Restante
	numcarta(NumRes),
	Y \== NumRes,
	palo(PaloRes),
%% Asigno valores
	C1 = carta1(Y,p),
	C2 = carta2(Y,c),
	C3 = carta3(Y,r),
	C4 = carta4(Y,t),
	CR = cartarestante(NumRes, PaloRes).
	

ejer_d(NumSoluciones):-
findall(Resultados, manospoker(Resultados), Lista), length(Lista, NumSoluciones).
%% Respuesta Ordernador:
%% N = 624.
%% Respuesta Papel:
%% 13 * 12 * 4 = 624