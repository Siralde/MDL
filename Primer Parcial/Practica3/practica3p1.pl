/*
 * 	Problema 1
 */
rufian(bertolo).
rufian(bartolo).
noble(romeo).
noble(bertolo).
plebeyo(bartolo).
dama(gertudris).
dama(julieta).
hermosa(julieta).

desear(X,Y):-
	plebeyo(X),
	dama(Y).

desear(Z,A):-
	noble(Z),
	dama(A),
	hermosa(A).

raptar(X,Y):-
	rufian(X),
	desear(X,Y).

/*
* Que noble es un rufian?
?- rufian(X), noble(X).
X = bertolo 

*Quien es susceptible de ser raptada por Romeo?
?- raptar(romeo, Y).
false.

* Quien rapta a Julieta?
?- raptar(X,julieta).
X = bertolo 
X = bartolo 

* Quien rapta a quien?
?- raptar(X,Y).
X = bertolo,
Y = julieta 
X = bartolo,
Y = gertudris 
X = bartolo,
Y = julieta 

* A quien desea Bartolo?
?- desear(bartolo,Y).
Y = gertudris 
Y = julieta 

* A quien desea Romeo?
?- desear(romeo,Y).
Y = julieta.

*Cual hermosa dama es deseada por Bartolo?
?- hermosa(X), dama(X), desear(bartolo,X).
X = julieta 
*/

/* Traduccion a Logica de Predicado  
1. rufian(bertolo) ^ rufian(bartolo)
2. noble(romeo) ^ noble(bertolo)
3. plebeyo(bartolo)
4. VxVy: plebeyo(x) ^ dama(y) => desear(x,y)
   VzVa: noble(z) ^ (mujer(a) ^ hersoma(a)) => desear(z,a)
5. dama(gertrudis) ^ dama(julieta)
6. hermosa(julieta)
7. VxVy: rufian(x) ^ desear(x,y) => raptar(x,y)
*/

/*
 * 	Problema 2
 */
rubia(maria).
moreno(juan).
bigote(pepe).
gafas(juan).

gustar(X,Y):-
	moreno(X),
	rubia(Y).

gustar(rosa,X):-
	moreno(X).

gustar(maria,X):-
	moreno(X),
	barba(X).

gustar(ana, X):-
	empollon(X),
	moreno(X).

barba(juan):-
	bigote(pepe).

empollon(X):-
	gafas(X).

feliz(X):-
	gustar(X,Y),
	gustar(Y,X).

/*
* Que persona le gustan a Maria?
?- gustar(maria,X).
X = juan. 

*Es juan feliz?
?- feliz(juan).
true.

* Quien es feliz?
?- feliz(X).
X = juan 
X = maria 
false. 
*/



/* Traduccion a Logica de Predicado  
1. VxVy: moreno(x) ^ rubia(y) => gustar(x,y)
2. Vx: moreno(x) => gustar(rosa, x)
3. Vx: moreno(x) ^ barba(x) => gustar(maria, x)
4. rubia(maria)
5. moreno(juan)
6. barba(juan) <=> bigote(juan)
7. bigote(pepe)
8. Vx: empollon(x) => gafas(x)
9. Vx: empollon(x) ^ moreno(x) => gustar(ana, x)
10. gafas(juan)
11. VxVyEz: gustar(x,y) ^ gustar(y,x) => feliz(x) ^ feliz(y)
*/
