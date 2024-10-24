% ===============================================
% Autor: Omar Morales
% Fecha: 20 de octubre de 2024
% Descripción: Programa en Prolog que modifica la codificación
% Run-Length de una lista. Si un elemento no tiene duplicados,
% se mantiene sin empaquetar.
% Se incluye un código comentado de Python.
% ===============================================

% ---------- Código en Python (Comentado) --------------
% def pack(lst):
%     if not lst:
%         return []
%     else:
%         first, *rest = lst
%         ys, rest_of_list = transfer(first, rest)
%         return [[first] + ys] + pack(rest_of_list)
%
% def transfer(x, lst):
%     if not lst:
%         return [], []
%     elif x != lst[0]:
%         return [], lst
%     else:
%         ys, rest = transfer(x, lst[1:])
%         return [x] + ys, rest
%
% def encode(lst):
%     packed = pack(lst)
%     return transform(packed)
%
% def transform(packed):
%     return [[len(sublist), sublist[0]] for sublist in packed]
%
% def encode_modified(lst):
%     encoded = encode(lst)
%     return modify(encoded)
%
% def modify(encoded):
%     result = []
%     for n, x in encoded:
%         if n == 1:
%             result.append(x)
%         else:
%             result.append([n, x])
%     return result
%
% if __name__ == '__main__':
%     print(encode_modified(['a', 'a', 'a', 'a', 'b', 'c', 'c', 'a', 'a', 'd', 'e', 'e', 'e', 'e']))
% ------------------------------------------------------

% ------------ Código en Prolog ------------------------
% Agrupa duplicados consecutivos de una lista en sublistas.
% Caso base: una lista vacía se agrupa como una lista vacía.
pack([], []).
% Caso recursivo: transfiere todos los elementos consecutivos iguales a una sublista.
pack([X|Xs], [[X|Ys]|Zs]) :- transfer(X, Xs, Ys, Rest), pack(Rest, Zs).

% Transfiere los elementos duplicados consecutivos a una sublista.
transfer(X, [], [], []).
% Si el siguiente elemento es diferente, termina la transferencia.
transfer(X, [Y|Ys], [], [Y|Ys]) :- X \= Y.
% Si el siguiente elemento es igual, agrégalo a la sublista.
transfer(X, [X|Xs], [X|Ys], Rest) :- transfer(X, Xs, Ys, Rest).

% Codifica una lista usando codificación Run-Length.
% Primero agrupa los duplicados y luego transforma las sublistas en parejas (N, X).
encode(L, R) :- pack(L, P), transform(P, R).

% Transforma sublistas en parejas (N, X), donde N es la cantidad de elementos.
transform([], []).
transform([[X|Xs]|Ys], [[N,X]|Zs]) :- length([X|Xs], N), transform(Ys, Zs).

% Modifica la codificación Run-Length de una lista.
encode_modified(L, R) :- encode(L, Enc), modify(Enc, R).

% Caso base: lista vacía.
modify([], []).

% Si hay solo un elemento, agrégalo directamente.
modify([[1,X]|T], [X|R]) :- modify(T, R).

% Si hay más de un elemento, mantén el formato (N, X).
modify([[N,X]|T], [[N,X]|R]) :- N > 1, modify(T, R).

% Función main para ejecutar el programa con ejemplos de uso
main :-
    print("Ejecutando programa 11..."),nl,
    print("Ejecutando: encode_modified([a,a,a,a,b,c,c,a,a,d,e,e,e,e], R)."),nl,
    encode_modified([a,a,a,a,b,c,c,a,a,d,e,e,e,e], R),
    format("Resultado: ~s~n", [R]).

% Ejemplo de uso:
% ?- encode_modified([a,a,a,a,b,c,c,a,a,d,e,e,e,e], R).
% R = [[4,a],b,[2,c],[2,a],d,[4,e]]
