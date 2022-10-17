%
% restaurante.pl
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
% Posibles extensiones:
%	1. Emplear una representacion mas compacta.
%
% Comentarios a: Jorge Cabrera (jcabrera@dis.ulpgc.es)

% menu

entrada(paella).
entrada(gazpacho).

carne(filete_de_cerdo).
carne(pollo_asado).

pescado(trucha).
pescado(bacalao).

postre(flan).
postre(naranja).

% plato_principal(P)	P es un plato principal si es carne o pescado

plato_principal(P):-
	carne(P).
	
plato_principal(P):-
	pescado(P).

% comida(Entrada, Principal, Postre)

comida(Entrada, Principal, Postre):-
	entrada(Entrada),
	plato_principal(Principal),
	postre(Postre).
	
% ademas tenemos un menu reducido con cosas que siempre hay en la nevera

comida(alubias, huevos_con_tocino, membrillo).
