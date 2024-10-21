% ===============================================
% Autor: Omar Morales
% Fecha: 20 de octubre de 2024
% Descripción: Programa en Prolog que genera combinaciones
% de K elementos distintos seleccionados de una lista de
% N elementos.
% ===============================================

% ------------ Código en Prolog ------------------------
% Genera todas las combinaciones de K elementos seleccionados de una lista dada.
combination(0, _, []).
combination(K, [H|T], [H|Comb]) :- K > 0, K1 is K - 1, combination(K1, T, Comb).
combination(K, [_|T], Comb) :- K > 0, combination(K, T, Comb).

% Ejemplo de uso:
% ?- combination(2, [a,b,c,d], L).
% L = [a,b] ;
% L = [a,c] ;
% L = [a,d] ;
% L = [b,c] ;
% L = [b,d] ;
% L = [c,d] ;
% false.
