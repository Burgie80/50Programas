% ===============================================
% Autor: Omar Morales
% Fecha: 20 de octubre de 2024
% Descripción: Programa en Prolog que decodifica una lista
% codificada mediante Run-Length. Expande cada par (N, X)
% en una lista con N elementos X.
% Se incluye un código comentado de Python.
% ===============================================

% ---------- Código en Python (Comentado) --------------
% def decode(lst):
%     result = []
%     for n, x in lst:
%         result += expand(x, n)
%     return result
% 
% def expand(x, n):
%     return [x] * n
% 
% if __name__ == '__main__':
%     print(decode([[4, 'a'], [1, 'b'], [2, 'c'], [2, 'a'], [1, 'd'], [4, 'e']]))
% ------------------------------------------------------

% ------------ Código en Prolog ------------------------
% Decodifica una lista codificada mediante Run-Length.
decode([], []).
decode([[N,X]|T], R) :- decode(T, R1), expand(X, N, E), append(E, R1, R).

% Expande un elemento X en una lista de longitud N.
expand(_, 0, []).
expand(X, N, [X|T]) :- N > 0, N1 is N - 1, expand(X, N1, T).

% Ejemplo de uso:
% ?- decode([[4,a],[1,b],[2,c],[2,a],[1,d],[4,e]], R).
% R = [a, a, a, a, b, c, c, a, a, d, e, e, e, e]
