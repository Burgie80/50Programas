% ===============================================
% Autor: Omar Morales
% Fecha: 20 de octubre de 2024
% Descripción: Programa en Prolog que agrupa los elementos
% de un conjunto en subconjuntos disjuntos.
% Se incluye un código comentado de Python.
% ===============================================

% ----------- Código en Python (Comentado) -------------
% def combination(k, lst):
%     if k == 0:
%         return [[]]
%     if not lst:
%         return []
%     with_first = combination(k - 1, lst[1:])
%     with_first = [[lst[0]] + comb for comb in with_first]
%     without_first = combination(k, lst[1:])
%     return with_first + without_first
% 
% def group(size_list, elements):
%     if not size_list:
%         return []
%     
%     first_group_size = size_list[0]
%     rest_group_sizes = size_list[1:]
%     first_group_combinations = combination(first_group_size, elements)
% 
%     grouped_result = []
%     for first_group in first_group_combinations:
%         remaining_elements = [e for e in elements if e not in first_group]
%         rest_groups = group(rest_group_sizes, remaining_elements)
%         if rest_groups or not rest_group_sizes:
%             grouped_result.append([first_group] + rest_groups)
% 
%     return grouped_result
% 
% if __name__ == '__main__':
%     print(group([2, 2, 5], ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i']))
% ------------------------------------------------------

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
