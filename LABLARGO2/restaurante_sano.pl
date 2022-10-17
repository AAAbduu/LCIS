% restaurante_sano.pl
%
% Version 1.
%
% Funciones elmentales en Prolog para la composicion de menus.
%
% Adaptado de (Ver cap. 1):
%	Prolog
%	F.Giannesini, H. Kanoui, R. Pasero, M. van Caneghem
%	Addison-Wesley Iberoamericana, 1989.
%
% Comentarios a: Jorge Cabrera (jcabrera@dis.ulpgc.es)

% menu

entrada(paella).  entrada(gazpacho).

carne(filete_de_cerdo).  carne(pollo_asado).

pescado(trucha).  pescado(bacalao).

postre(flan).  postre(naranja).

bebida(agua).	bebida(cerveza).  bebida(vino).

% plato_principal(P) P es un plato principal si es carne o pescado

plato_principal(P):- carne(P).  plato_principal(P):- pescado(P).

% comida(Entrada, Principal, Postre)

comida(Entrada, Principal, Postre):- entrada(Entrada),
	plato_principal(Principal), postre(Postre).


% comida(Entrada, Principal, Postre, Bebida,Calorias)
comida(Entrada, Principal, Postre, Bebida):- entrada(Entrada),
	plato_principal(Principal), postre(Postre), bebida(Bebida).

% ademas tenemos un menu reducido con cosas que siempre hay en la
% nevera

comida(alubias, huevos_con_tocino, membrillo).

% Valor calorico de una racion

calorias(paella, 350).  calorias(gazpacho, 50).
calorias(filete_de_cerdo, 450).  calorias(pollo_asado, 380).
calorias(trucha, 160).  calorias(bacalao, 300).  calorias(flan, 250).
calorias(naranja, 50).

calorias(alubias, 700).  calorias(huevos_con_tocino, 800).
calorias(membrillo, 300).

calorias(agua, 0).  calorias(cerveza, 45).  calorias(vino, 30).

% Valor calorico de una comida

valor(Entrada, Principal, Postre, Valor):- calorias(Entrada, X),
	calorias(Principal, Y), calorias(Postre, Z), Valor is X + Y +
	Z.

% Este nuevo predicado pone un limite a la ingesta de calorias
% admisible para una comida equilibrada.

comida_equilibrada(Entrada, Principal, Postre):- comida(Entrada,
	Principal, Postre), valor(Entrada, Principal, Postre, Valor),
	Valor < 700.

