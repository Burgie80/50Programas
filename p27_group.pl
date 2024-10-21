% ===============================================
% Autor: Omar Morales
% Fecha: 20 de octubre de 2024
% Descripción: Programa en Prolog que agrupa los elementos
% de un conjunto en subconjuntos disjuntos.
% ===============================================

% ------------ Código en Prolog ------------------------
% Genera todas las combinaciones de K elementos seleccionados de una lista dada.
combination(0, _, []).
combination(K, [H|T], [H|Comb]) :- K > 0, K1 is K - 1, combination(K1, T, Comb).
combination(K, [_|T], Comb) :- K > 0, combination(K, T, Comb).

% Agrupa los elementos de un conjunto en subconjuntos disjuntos dados los tamaños de los subgrupos.
group([], [], []).
group([N|Ns], Es, [G|Gs]) :- combination(N, Es, G), subtract(Es, G, Rest), group(Ns, Rest, Gs).

% Ejemplo de uso:
% ?- group([2,2,5], [a,b,c,d,e,f,g,h,i], G).
% G = [[a,b],[c,d],[e,f,g,h,i]] ;
% G = [[a,b],[c,e],[d,f,g,h,i]] ;
% ...
