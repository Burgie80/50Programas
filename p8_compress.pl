% ===============================================
% Autor: Omar Morales
% Fecha: 20 de octubre de 2024
% Descripción: Programa en Prolog que elimina duplicados
% consecutivos de los elementos de una lista.
% Se incluye una versión comentada en Python para referencia.
% ===============================================

% ------------ Código en Python (comentado) ------------
% def compress(X):
% 	A = []
% 	i = 0
%
% 	while i < len(X):
% 		if i == 0:
% 			A.append(X[i])
% 		elif A[-1] != X[i]:
% 			A.append(X[i])
% 		i += 1
% 	return A

% if __name__ == '__main__':
% 	print(compress(['a', 'b', 'c', 'c', 'd', 'd', 'd', 'e', 'a']))
% ------------------------------------------------------

% ------------ Código en Prolog ------------------------
% Elimina duplicados consecutivos de una lista.
% Caso base: una lista vacía se mantiene vacía.
compress([], []).

% Si queda un solo elemento, no hay duplicados.
compress([X], [X]).

% Caso recursivo: si el primer y segundo elemento son iguales, ignora el primero.
compress([X,X|T], R) :- compress([X|T], R).

% Si el primer y segundo elemento son distintos, conserva el primero.
compress([X,Y|T], [X|R]) :- X \= Y, compress([Y|T], R).

% Función main para ejecutar el programa con ejemplos de uso
main :-
    print("Ejecutando programa 8..."),nl,
    print("Ejecutando: compress([a, b, c, c, d, d, d, e, a], C)."),nl,
    compress([a, b, c, c, d, d, d, e, a], C),
    format("Resultado: ~s~n", [C]).

% Ejemplo de uso:
% ?- compress([a, b, c, c, d, d, d, e, a], C).
% C = [a, b, c, d, e, a].
% ------------------------------------------------------
