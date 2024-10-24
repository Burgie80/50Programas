% ===============================================
% Autor: Omar Morales
% Fecha: 20 de octubre de 2024
% Descripción: Programa en Prolog que inserta un elemento
% en una lista en una posición dada.
% Se incluye un código comentado de Python.
% ===============================================

% ----------- Código en Python (Comentado) -------------
% def insert_at(x, lst, k):
%     if k == 1:
%         return [x] + lst
%     return [lst[0]] + insert_at(x, lst[1:], k - 1)
% 
% if __name__ == '__main__':
%     print(insert_at('alfa', ['a', 'b', 'c', 'd'], 2))
% ------------------------------------------------------

% ------------ Código en Prolog ------------------------
% Inserta un elemento en una lista en la posición dada.
% El índice K debe ser mayor que 0.
insert_at(X, L, 1, [X|L]).
insert_at(X, [H|T], K, [H|R]) :- K > 1, K1 is K - 1, insert_at(X, T, K1, R).

% Ejemplo de uso:
% ?- insert_at(alfa, [a,b,c,d], 2, L).
% L = [a,alfa,b,c,d]
