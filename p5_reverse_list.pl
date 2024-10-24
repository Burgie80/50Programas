% ===============================================
% Autor: Omar Morales
% Fecha: 20 de octubre de 2024
% Descripción: Programa en Prolog que invierte una lista.
% Se incluye una versión comentada en Python para referencia.
% ===============================================

% ------------ Código en Python (comentado) ------------
% def reverse_list(X):
% 	return X[::-1]
%
% if __name__ == '__main__':
% 	print(reverse_list([1, 2, 3, 4, 5]))
% ------------------------------------------------------

% ------------ Código en Prolog ------------------------
% Invierte una lista.
% Utiliza un acumulador para ir construyendo la lista invertida.
reverse_list(L, R) :- reverse_list(L, [], R).

% Caso base: cuando la lista original está vacía, el acumulador contiene la lista invertida.
reverse_list([], Acc, Acc).

% Caso recursivo: mueve el elemento de la cabeza al acumulador.
reverse_list([H|T], Acc, R) :- reverse_list(T, [H|Acc], R).

main :-
        print("Ejecutando programa 5..."),nl,
        print("Ejecutando: reverse_list([a, b, c, d], R)."),nl,
        reverse_list([a, b, c, d], R),
        format("Resultado: ~s~n\n", [R]).

% Ejemplo de uso:
% ?- reverse_list([a, b, c, d], R).
% R = [d, c, b, a].
% ------------------------------------------------------
