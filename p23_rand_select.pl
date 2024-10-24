% ===============================================
% Autor: Omar Morales
% Fecha: 20 de octubre de 2024
% Descripción: Programa en Prolog que extrae un número dado
% de elementos seleccionados aleatoriamente de una lista.
% ===============================================

% ----------- Código en Python (Comentado) -------------
% import random
% 
% def element_at(lst, i):
%     return lst[i-1]
% 
% def rnd_select(lst, n):
%     if n == 0:
%         return []
%     i = random.randint(1, len(lst))
%     x = element_at(lst, i)
%     lst.remove(x)
%     return [x] + rnd_select(lst, n - 1)
% 
% if __name__ == '__main__':
%     print(rnd_select(['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h'], 3))
% ------------------------------------------------------

% ------------ Código en Prolog ------------------------
% Extrae un número dado de elementos aleatorios de una lista.
% Utiliza un generador de números aleatorios y elimina los elementos seleccionados.
rnd_select(_, 0, []).
rnd_select(L, N, [X|R]) :- 
    length(L, Len), 
    random(1, Len, I), 
    element_at(X, L, I), 
    delete(L, X, L1), 
    N1 is N - 1, 
    rnd_select(L1, N1, R).

% Función auxiliar para obtener el elemento en la posición I
element_at(X, [X|_], 1).
element_at(X, [_|T], I) :- I > 1, I1 is I - 1, element_at(X, T, I1).

main :-
    print("Ejecutando programa 23..."),nl,
    print("Ejecutando: rnd_select([a,b,c,d,e,f,g,h], 3, L)."),nl,
    rnd_select([a,b,c,d,e,f,g,h], 3, L),
    format("Resultado: ~w~n", [L]).

% Ejemplo de uso:
% ?- rnd_select([a,b,c,d,e,f,g,h], 3, L).
% L = [e,b,g]  % (el resultado puede variar debido a la aleatoriedad)
