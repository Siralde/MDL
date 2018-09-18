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