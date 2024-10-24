% ===============================================
% Autor: Omar Morales
% Fecha: 17 de octubre de 2024
% Descripción: Programa en Prolog que determina 
%              el último elemento de una lista.
%              Se incluye una versión comentada
%              en Python para referencia.
% ===============================================

% ------------ Código en Python (comentado) ------------
% def last(A):
%    if len(A) == 0:
%        return []
%    return A[-1]
%    
% if __name__ == "__main__":
%    print(last([1, 2, 3, 4, 5]))
% ------------------------------------------------------

% ------------ Código en Prolog ------------------------
% Predicado my_last(X, List) que determina el último
% elemento X de la lista List.

% Caso base: el último elemento es cuando la lista tiene
% un sólo elemento
my_last(X, [X]).

% Caso recursivo: ignora el primer elemento de la lista y
% sigue evaluando
my_last(X, [_|Tail]) :-
	my_last(X, Tail).

% Función main para ejecutar el programa con ejemplos de uso
main :-
	print("Ejecutando programa 1..."),nl,
	print("Ejecutando: my_last(X, [a, b, c, d])."),nl,
	my_last(X, [a, b, c, d]),
	format("Resultado: ~s~n\n", [X]).

% Ejemplo de uso:
% ?- my_last(X, [a, b, c, d]).
% X = d.
% ------------------------------------------------------
