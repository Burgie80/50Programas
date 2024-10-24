% ===============================================
% Autor: Omar Morales
% Fecha: 20 de octubre de 2024
% Descripción: Programa en Prolog que ordena una lista de
% listas según la frecuencia de la longitud de las sublistas.
% Se incluye un código comentado de Python.
% ===============================================

% ----------- Código en Python (Comentado) -------------
% from itertools import groupby
% 
% def pack(lst):
%     return [list(group) for key, group in groupby(lst)]
% 
% def transform(packed_lst):
%     return [(len(sublist), sublist[0]) for sublist in packed_lst]
% 
% def encode(lst):
%     packed_lst = pack(lst)
%     return transform(packed_lst)
% 
% def length_frequency(lst):
%     packed_lst = pack(lst)
%     encoded_lst = encode(packed_lst)
%     encoded_lst.sort(key=lambda x: x[0])
%     return encoded_lst
% 
% if __name__ == '__main__':
%     lst = [['a','b','c'],['d','e'],['f','g','h'],['d','e'],['i','j','k','l'],['m','n'],['o']]
%     result = length_frequency(lst)
%     print(result)
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

% Ordena una lista de listas de acuerdo con la frecuencia de la longitud de las sublistas.
length_frequency(L, F) :- map_list_to_pairs(length, L, P), msort(P, SP), encode(SP, F).

% Función main para ejecutar el programa con ejemplos de uso
main :-
    print("Ejecutando programa 29..."),nl,
    print("Ejecutando: length_frequency([[a,b,c],[d,e],[f,g,h],[d,e],[i,j,k,l],[m,n],[o]], L)."),nl,
    length_frequency([[a,b,c],[d,e],[f,g,h],[d,e],[i,j,k,l],[m,n],[o]], L),
    format("Resultado: ~w~n", [L]).

% Ejemplo de uso:
% ?- length_frequency([[a,b,c],[d,e],[f,g,h],[d,e],[i,j,k,l],[m,n],[o]], L).
% L = [[[o]],[[i,j,k,l]],[[a,b,c],[f,g,h]],[[d,e],[d,e],[m,n]]]
