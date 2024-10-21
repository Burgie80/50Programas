% ===============================================
% Autor: Omar Morales
% Fecha: 20 de octubre de 2024
% Descripción: Programa en Prolog que ordena una lista de
% listas de acuerdo con la longitud de las sublistas.
% ===============================================

% ------------ Código en Prolog ------------------------
% Ordena una lista de listas de acuerdo con la longitud de las sublistas.
lsort(L, S) :- map_list_to_pairs(length, L, P), keysort(P, SP), pairs_values(SP, S).

% Funciones auxiliares (asumiendo que están predefinidas en Prolog o importadas)
% map_list_to_pairs/3, keysort/2, pairs_values/2

% Ejemplo de uso:
% ?- lsort([[a,b,c],[d,e],[f,g,h],[d,e],[i,j,k,l],[m,n],[o]], L).
% L = [[o], [d,e], [d,e], [m,n], [a,b,c], [f,g,h], [i,j,k,l]]
