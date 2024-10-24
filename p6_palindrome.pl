% ===============================================
% Autor: Omar Morales
% Fecha: 20 de octubre de 2024
% Descripción: Programa en Prolog que determina si una lista
% es un palíndromo
% Se incluye una versión comentada en Python para referencia.
% ===============================================

% ------------ Código en Python (comentado) ------------
% def reverse_list(X):
% 	return X[::-1]
%
% def palindrome(L):
% 	return L == reverse_list(L)
%
% if __name__ == '__main__':
% 	print(palindrome([1, 2, 3, 4, 5]))
% ------------------------------------------------------

% ------------ Código en Prolog ------------------------
% Invierte una lista.
% Utiliza un acumulador para ir construyendo la lista invertida.
reverse_list(L, R) :- reverse_list(L, [], R).

% Caso base: cuando la lista original está vacía, el acumulador contiene la lista invertida.
reverse_list([], Acc, Acc).

% Caso recursivo: mueve el elemento de la cabeza al acumulador.
reverse_list([H|T], Acc, R) :- reverse_list(T, [H|Acc], R).

% Verifica si una lista es un palíndromo.
% Una lista es un palíndromo si es igual a su inversa.
palindrome(L) :- reverse_list(L, L).

% Función main para ejecutar el programa con ejemplos de uso
main :-
    print("Ejecutando programa 6..."), nl,
    
    print("Ejecutando: palindrome([a, b, c, d])."), nl,
    (palindrome([a, b, c, d]) -> Resultado1 = "true"; Resultado1 = "false"),
    format("Resultado: ~s~n", [Resultado1]),
    
    print("Ejecutando: palindrome([a, b, b, a])."), nl,
    (palindrome([a, b, b, a]) -> Resultado2 = "true"; Resultado2 = "false"),
    format("Resultado: ~s~n", [Resultado2]).

% Ejemplo de uso:
% ?- palindrome([a, b, c, d]).
% false.
% ?- palindrome([a, b, b,  a]).
% true.
% ------------------------------------------------------
