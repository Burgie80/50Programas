% ===============================================
% Autor: Omar Morales
% Fecha: 20 de octubre de 2024
% Descripción: Programa en Prolog que duplica los elementos
% de una lista un número dado de veces.
% Se incluye un código comentado de Python.
% ===============================================

% ---------- Código en Python (Comentado) --------------
% def dupli(lst, n):
%     return [x for x in lst for _ in range(n)]
% 
% if __name__ == '__main__':
%     print(dupli(['a', 'b', 'c'], 3))
% ------------------------------------------------------

% ------------ Código en Prolog ------------------------
% Duplica los elementos de una lista un número dado de veces.
% Caso base: la lista vacía se mantiene vacía.
dupli([], _, []).

% Caso recursivo: duplica el primer elemento N veces y continúa con el resto.
dupli([H|T], N, R) :- duplicate(H, N, D), dupli(T, N, R1), append(D, R1, R).

% Crea una lista con N repeticiones del elemento X.
duplicate(_, 0, []).
duplicate(X, N, [X|R]) :- N > 0, N1 is N - 1, duplicate(X, N1, R).

% Ejemplo de uso:
% ?- dupli([a,b,c], 3, R).
% R = [a,a,a,b,b,b,c,c,c]
