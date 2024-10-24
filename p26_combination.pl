% ===============================================
% Autor: Omar Morales
% Fecha: 20 de octubre de 2024
% Descripción: Programa en Prolog que genera combinaciones
% de K elementos distintos seleccionados de una lista de
% N elementos.
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
% if __name__ == '__main__':
%     print(combination(2, ['a', 'b', 'c', 'd']))
% ------------------------------------------------------

% ------------ Código en Prolog ------------------------
% Genera todas las combinaciones de K elementos seleccionados de una lista dada.
combination(0, _, []).
combination(K, [H|T], [H|Comb]) :- K > 0, K1 is K - 1, combination(K1, T, Comb).
combination(K, [_|T], Comb) :- K > 0, combination(K, T, Comb).

% Función main para ejecutar el programa con ejemplos de uso
main :-
    print("Ejecutando programa 26..."), nl,
    print("Ejecutando: combination(2, [a,b,c,d], L)."), nl,
    % Encontrar y mostrar todas las combinaciones
    findall(L, combination(2, [a,b,c,d], L), Combinations),
    format("Resultado: ~w~n", [Combinations]).

% Ejemplo de uso:
% ?- combination(2, [a,b,c,d], L).
% L = [a,b] ;
% L = [a,c] ;
% L = [a,d] ;
% L = [b,c] ;
% L = [b,d] ;
% L = [c,d] ;
% false.
