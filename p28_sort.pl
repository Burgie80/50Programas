% ===============================================
% Autor: Omar Morales
% Fecha: 20 de octubre de 2024
% Descripción: Programa en Prolog que ordena una lista de
% listas de acuerdo con la longitud de las sublistas.
% Se incluye un código comentado de Python.
% ===============================================

% ----------- Código en Python (Comentado) -------------
% def lsort(lst):
%     return sorted(lst, key=len)
% 
% if __name__ == '__main__':
%     print(lsort([['a', 'b', 'c'], ['d', 'e'], ['f', 'g', 'h'], ['d', 'e'], ['i', 'j', 'k', 'l'], ['m', 'n'], ['o']]))
% ------------------------------------------------------

% ------------ Código en Prolog ------------------------
% Ordena una lista de listas de acuerdo con la longitud de las sublistas.
lsort(L, S) :- map_list_to_pairs(length, L, P), keysort(P, SP), pairs_values(SP, S).

% Función main para ejecutar el programa con ejemplos de uso
main :-
    print("Ejecutando programa 28..."),nl,
    print("Ejecutando: lsort([[a,b,c],[d,e],[f,g,h],[d,e],[i,j,k,l],[m,n],[o]], L)."),nl,
    lsort([[a,b,c],[d,e],[f,g,h],[d,e],[i,j,k,l],[m,n],[o]], L),
    format("Resultado: ~w~n", [L]).

% Ejemplo de uso:
% ?- lsort([[a,b,c],[d,e],[f,g,h],[d,e],[i,j,k,l],[m,n],[o]], L).
% L = [[o], [d,e], [d,e], [m,n], [a,b,c], [f,g,h], [i,j,k,l]]
