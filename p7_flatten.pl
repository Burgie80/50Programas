% ===============================================
% Autor: Omar Morales
% Fecha: 20 de octubre de 2024
% Descripción: Programa en Prolog que aplana una lista integrando
% los elementos de las sublistas en la lista principal.
% Se incluye una versión comentada en Python para referencia.
% ===============================================

% ------------ Código en Python (comentado) ------------
% def my_flatten(X):
% 	A = []
% 	for element in X:
% 		if isinstance(element, list):
% 			A += my_flatten(element)
% 		else:
% 			A.append(element)
% 	return A
%
% if __name__ == '__main__':
% 	print(my_flatten(['a', 'b', 'c', ['d', 'e', 'f', ['g', 'h']], 'i', ['j', 'k']]))
% ------------------------------------------------------

% ------------ Código en Prolog ------------------------
% Aplana una lista anidada en una lista simple.
% Caso base: la lista vacía se aplana a una lista vacía.
my_flatten([], []).

% Caso recursivo: si la cabeza es una lista, aplana la cabeza y la cola recursivamente.
my_flatten([H|T], Flat) :- my_flatten(H, FH), my_flatten(T, FT), append(FH, FT, Flat).

% Si la cabeza no es una lista, simplemente agrégala al resultado.
my_flatten(X, [X]) :- X \= [], \+ is_list(X).

% Función main para ejecutar el programa con ejemplos de uso
main :-
    print("Ejecutando programa 7..."),nl,
    print("Ejecutando: my_flatten([a, b, c, [d, e, f, [g, h]], i, [j, k]], F)."),nl,
    my_flatten([a, b, c, [d, e, f, [g, h]], i, [j, k]], F),
    format("Resultado: ~s~n", [F]).

% Ejemplo de uso:
% ?- my_flatten([a, b, c, [d, e, f, [g, h]], i, [j, k]], F).
% F = [a, b, c, d, e, f, g, h, i, j, k]
% ------------------------------------------------------