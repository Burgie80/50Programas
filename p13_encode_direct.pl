% ===============================================
% Autor: Omar Morales
% Fecha: 20 de octubre de 2024
% Descripción: Programa en Prolog que realiza la codificación
% Run-Length de una lista de forma directa. Cuenta cuántos
% elementos consecutivos son iguales.
% ===============================================

% ------------ Código en Prolog ------------------------
% Codifica directamente una lista usando codificación Run-Length.
encode_direct([], []).
encode_direct([X|Xs], [[N,X]|R]) :- count(X, [X|Xs], N, Rest), encode_direct(Rest, R).

% Cuenta cuántos elementos consecutivos son iguales.
count(_, [], 0, []).
count(X, [X|Xs], N, Rest) :- count(X, Xs, N1, Rest), N is N1 + 1.
count(X, [Y|Ys], 0, [Y|Ys]) :- X \= Y.

% Ejemplo de uso:
% ?- encode_direct([a,a,a,a,b,c,c,a,a,d,e,e,e,e], R).
% R = [[4,a],[1,b],[2,c],[2,a],[1,d],[4,e]]
