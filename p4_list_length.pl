% ===============================================
% Autor: Omar Morales
% Fecha: 20 de octubre de 2024
% Descripción: Programa en Prolog que determina
% la longitud de una lista.
% Se incluye una versión comentada
% en Python para referencia.
% ===============================================

% ------------ Código en Python (comentado) ------------
% def list_length(X):
% 	return len(X)
%
% if __name__ == '__main__':
% 	print(list_length([1, 2, 3, 4, 5]))
% ------------------------------------------------------

% ------------ Código en Prolog ------------------------
% Predicado list_length(List, N) que determina la longitud N
% de la lista List.

% Calcula el número de elementos de una lista.
% Caso base: una lista vacía tiene longitud 0.
list_length([], 0).

% Caso recursivo: la longitud es 1 más que la longitud de la cola.
list_length([_|T], N) :- list_length(T, N1), N is N1 + 1.

% Ejemplo de uso:
% ?- list_length([a, b, c, d], N).
% N = 4.
% ------------------------------------------------------
