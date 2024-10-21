% ===============================================
% Autor: Omar Morales
% Fecha: 20 de octubre de 2024
% Descripción: Programa en Prolog que crea una lista con
% todos los enteros dentro de un rango dado.
% ===============================================

% ------------ Código en Prolog ------------------------
% Crea una lista con todos los enteros dentro de un rango dado.
% Caso base: cuando el inicio y el final son iguales.
range(I, I, [I]).
% Caso recursivo: agrega el inicio a la lista y continúa con el siguiente número.
range(I, K, [I|R]) :- I < K, I1 is I + 1, range(I1, K, R).

% Ejemplo de uso:
% ?- range(4, 9, L).
% L = [4, 5, 6, 7, 8, 9]
