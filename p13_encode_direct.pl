% ===============================================
% Autor: Omar Morales
% Fecha: 20 de octubre de 2024
% Descripción: Programa en Prolog que realiza la codificación
% Run-Length de una lista de forma directa. Cuenta cuántos
% elementos consecutivos son iguales.
% Se incluye un código comentado en Python.
% ===============================================

% -------- Código en Python (Comentado) ----------------
% def encode_direct(lst):
%     if not lst:
%         return []
%     first, *rest = lst
%     count_val, rest_of_list = count(first, rest)
%     return [[count_val, first]] + encode_direct(rest_of_list)
% 
% def count(x, lst):
%     count_val = 1
%     while lst and lst[0] == x:
%         lst = lst[1:]
%         count_val += 1
%     return count_val, lst
% 
% if __name__ == '__main__':
%     print(encode_direct(['a', 'a', 'a', 'a', 'b', 'c', 'c', 'a', 'a', 'd', 'e', 'e', 'e', 'e']))
% ------------------------------------------------------

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
