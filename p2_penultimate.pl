% ===============================================
% Autor: Omar Morales
% Fecha: 20 de octubre de 2024
% Descripción: Programa en Prolog que determina 
%              el penúltimo elemento de una lista.
%              Se incluye una versión comentada
%              en Python para referencia.
% ===============================================

% ------------ Código en Python (comentado) ------------
% def penultimate(X):
%     if len(X) < 2:
%         return []
%     return X[-2]
%
% if __name__ == '__main__':
%     print(penultimate([1, 2, 3, 4, 5]))
% ------------------------------------------------------

% ------------ Código en Prolog ------------------------
% Predicado penultimate(X, List) que determina el penúltimo
% elemento X de la lista List. Debe tener al menos dos elementos
 
% Caso base: el último elemento es cuando la lista tiene
% dos elementos
penultimate(X, [X, _]).

% Caso recursivo: ignora el primer elemento de la lista y
% sigue evaluando
penultimate(X, [_|T]) :-
	penultimate(X, T).

% Ejemplo de uso:
% ?- penultimate(X, [a, b, c, d]).
% X = c.
% ------------------------------------------------------
