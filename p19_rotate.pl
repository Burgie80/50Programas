% ===============================================
% Autor: Omar Morales
% Fecha: 20 de octubre de 2024
% Descripción: Programa en Prolog que rota una lista N
% lugares a la izquierda. Utiliza la longitud de la lista
% para manejar rotaciones mayores que la longitud.
% ===============================================

% ------------ Código en Prolog ------------------------
% Rota una lista N lugares a la izquierda.
% Utiliza la longitud de la lista para manejar rotaciones mayores que la longitud.
rotate(L, N, R) :- length(L, Len), N1 is N mod Len, split(L, N1, L1, L2), append(L2, L1, R).

% Función auxiliar para dividir la lista
split(L, 0, [], L).
split([H|T], N, [H|L1], L2) :- N > 0, N1 is N - 1, split(T, N1, L1, L2).

% Ejemplo de uso:
% ?- rotate([a,b,c,d,e,f,g,h], 3, R).
% R = [d,e,f,g,h,a,b,c]
