% ===============================================
% Autor: Omar Morales
% Fecha: 20 de octubre de 2024
% Descripción: Programa en Prolog que codifica los elementos
% duplicados por la longitud de la sublista en un momento dado
% para cierto elemento de la lista.
% Se incluye una versión comentada en Python para referencia.
% ===============================================

% ------------ Código en Python (comentado) ------------
% def encode(X):
%     A = []
%     i = 0
%    
%     while i < len(X):
%         if i == 0:
%             A.append([X[i], 1])
%         elif A[-1][0] == X[i]:
%             A[-1][1] += 1
%         else:
%             A.append([X[i], 1])
%         i += 1
%        
%     return A
%
% if __name__ == '__main__':
%     print(encode(['a', 'b', 'c', 'c', 'd', 'd', 'd', 'e', 'a']))
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

% Codifica una lista usando codificación Run-Length.
% Primero agrupa los duplicados y luego transforma las sublistas en parejas (N, X).
encode(L, R) :- pack(L, P), transform(P, R).

% Transforma sublistas en parejas (N, X), donde N es la cantidad de elementos.
transform([], []).
transform([[X|Xs]|Ys], [[N,X]|Zs]) :- length([X|Xs], N), transform(Ys, Zs).

% Función main para ejecutar el programa con ejemplos de uso
main :-
    print("Ejecutando programa 10..."),nl,
    print("Ejecutando: encode([a, b, c, c, d, d, d, e, a], E)."),nl,
    encode([a, b, c, c, d, d, d, e, a], E),
    format("Resultado: ~s~n", [E]).

% Ejemplo de uso:
% ?- encode([a, b, c, c, d, d, d, e, a], E).
% E = [[a, 1], [b, 1], [c, 2], [d, 3], [e, 1], [a, 1]].
% ------------------------------------------------------
