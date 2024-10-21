% ===============================================
% Autor: Omar Morales
% Fecha: 20 de octubre de 2024
% Descripción: Programa en Prolog que encuentra 
%              el k-ésimo elemento de una lista.
%              Se incluye una versión comentada
%              en Python para referencia.
% ===============================================

% ------------ Código en Python (comentado) ------------
% def element_at(X, k):
%     if k < 1 or len(X) < k:
%         return []
%     return X[k - 1]
% 
% if __name__ == '__main__':
%     print(element_at([1, 2, 3, 4, 5], 2))
% ------------------------------------------------------

% ------------ Código en Prolog ------------------------
% Predicado element_at(X, List, k) que determina el k-ésimo
%  X de la lista List. k debe ser mayor que 0
 
% Caso base: el k-ésimo elemento es cuando k es 1, a lo que 
% se retorna el primer elemento
element_at(X, [X|_], 1).

% Caso recursivo: ignora el primer elemento de la lista,
% resta 1 al índice k y sigue evaluando la lista
element_at(X, [_|T], K) :- K > 1, K1 is K - 1, element_at(X, T, K1).

% Ejemplo de uso:
% ?- element_at(X, [a, b, c, d, e], 2).
% X = b.
% ------------------------------------------------------
