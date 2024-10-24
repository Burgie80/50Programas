% ===============================================
% Autor: Omar Morales
% Fecha: 20 de octubre de 2024
% Descripción: Programa en Prolog que agrupa duplicados
% consecutivos de los elementos de una lista en sublistas.
% Se incluye una versión comentada en Python para referencia.
% ===============================================

% ------------ Código en Python (comentado) ------------
% def compress(X):
%     A = []
%     i = 0
%    
%     while i < len(X):
%         if i == 0:
%             A.append([X[i]])
%         elif A[-1][0] == X[i]:
%             A[-1].append(X[i])
%         else:
%             A.append([X[i]])
%         i += 1
%        
%     return A
%
% if __name__ == '__main__':
%     print(compress(['a', 'b', 'c', 'c', 'd', 'd', 'd', 'e', 'a']))
% return A

% if __name__ == '__main__':
% print(compress(['a', 'b', 'c', 'c', 'd', 'd', 'd', 'e', 'a']))
% ------------------------------------------------------

% ------------ Código en Prolog ------------------------
% Agrupa duplicados consecutivos de una lista en sublistas.
% Caso base: una lista vacía se agrupa como una lista vacía.
pack([], []).

% Caso recursivo: transfiere todos los elementos consecutivos iguales a una sublista.
pack([X|Xs], [Z|Zs]) :- transfer(X, Xs, Ys, Z), pack(Ys, Zs).

% Transfiere los elementos duplicados consecutivos a una sublista.
transfer(X, [], [], [X]).

% Si el siguiente elemento es diferente, termina la transferencia.
transfer(X, [Y|Ys], [Y|Ys], [X]) :- X \= Y.

% Si el siguiente elemento es igual, agrégalo a la sublista.
transfer(X, [X|Xs], Ys, [X|Zs]) :- transfer(X, Xs, Ys, Zs).

% Función main para ejecutar el programa con ejemplos de uso
main :-
    print("Ejecutando programa 9..."),nl,
    print("Ejecutando: pack([a, b, c, c, d, d, d, e, a], G)."),nl,
    pack([a, b, c, c, d, d, d, e, a], G),
    format("Resultado: ~w~n", [G]).

% Ejemplo de uso:
% ?- pack([a, b, c, c, d, d, d, e, a], G).
% G = [a, b, [c, c], [d, d], e, a].
% ------------------------------------------------------
