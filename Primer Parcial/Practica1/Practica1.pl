padreomadre(obdulio, felix).
padreomadre(carmita, felix).
padreomadre(obdulio, mary).
padreomadre(carmita, mary).
padreomadre(mary, alejandro).
padreomadre(antonio, consuelo).
padreomadre(maria, consuelo).
padreomadre(antonio, sergio).
padreomadre(antonio, sergio).
padreomadre(sergio, sergimar).
padreomadre(felix, aldemaro).
padreomadre(consuelo, aldemaro).
padreomadre(felix, vanessa).
padreomadre(consuelo, vanessa).
casado(daniel, vanessa).
casado(vanessa, daniel).
casado(consuelo, felix).
casado(felix, consuelo).
mujer(vanessa).
mujer(consuelo).
mujer(carmita).
mujer(maria).
mujer(mary).
mujer(sergimar).
hombre(aldemaro).
hombre(felix).
hombre(obdulio).
hombre(antonio).
hombre(sergio).
hombre(alejandro).
hombre(daniel).

hijo(X,Y):-
	padreomadre(Y,X),
	hombre(X).

hija(X,Y):-
	padreomadre(Y,X),
	mujer(X).

abuelo(X,Y):-
	padreomadre(X,Z),
	padreomadre(Z,Y),
	hombre(X).

abuela(X,Y):-
	padreomadre(X,Z),
	padreomadre(Z,Y),
	mujer(X).

hermano(X,Y):-
	padreomadre(Z,X),
	padreomadre(Z,Y),
	hombre(X).

hermana(X,Y):-
	padreomadre(Z,X),
	padreomadre(Z,Y),
	mujer(X).

tia(X,Y):-
	padreomadre(Z,Y),
	hermana(X,Z).

tio(X,Y):-
	padreomadre(Z,Y),
	hermano(X,Z).

primo(X,Y):-
	(tia(Z,X);
	tio(Z,X)),
	(hijo(Y,Z);
	hija(Y,Z)),
	hombre(X).

prima(X,Y):-
	(tia(Z,X);
	tio(Z,X)),
	(hija(Y,Z);
	hijo(Y,Z)),
	mujer(X).

suegro(X,Y):-
	casado(Y,Z),
	hija(Z,X),
	hombre(X).

suegra(X,Y):-
	casado(Y,Z),
	hija(Z,X),
	mujer(X).

cunyado(X,Y):-
	casado(Y,Z),
	(hermano(Z,X);
	hermana(Z,X)),
	hombre(X).

cunyado(X,Y):-
	casado(Y,Z),
	(hermano(Z,X);
	hermana(Z,X)),
	mujer(X).
