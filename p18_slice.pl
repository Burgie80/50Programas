% ===============================================
% Autor: Omar Morales
% Fecha: 20 de octubre de 2024
% Descripción: Programa en Prolog que extrae una porción
% de una lista, dado un rango. Los índices I y K deben
% ser mayores que 0.
% ===============================================

% ------------ Código en Prolog ------------------------
% Extrae una porción de una lista, dado un rango.
% Los índices I y K deben ser mayores que 0.
slice([H|_], 1, 1, [H]).
slice([H|T], 1, K, [H|R]) :- K > 1, K1 is K - 1, slice(T, 1, K1, R).
slice([_|T], I, K, R) :- I > 1, I1 is I - 1, K1 is K - 1, slice(T, I1, K1, R).

% Ejemplo de uso:
% ?- slice([a,b,c,d,e,f,g,h,i,k], 3, 7, R).
% R = [c,d,e,f,g]
