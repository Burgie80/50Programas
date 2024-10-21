% ===============================================
% Autor: Omar Morales
% Fecha: 20 de octubre de 2024
% Descripción: Programa en Prolog que duplica los elementos
% de una lista.
% ===============================================

% ------------ Código en Prolog ------------------------
% Duplica los elementos de una lista.
% Caso base: la lista vacía se mantiene vacía.
dupli([], []).

% Caso recursivo: duplica el primer elemento y continúa con el resto.
dupli([H|T], [H,H|R]) :- dupli(T, R).

% Ejemplo de uso:
% ?- dupli([a,b,c,c,d], R).
% R = [a,a,b,b,c,c,c,c,d,d]
