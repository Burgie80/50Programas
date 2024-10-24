% ===============================================
% Autor: Omar Morales
% Fecha: 20 de octubre de 2024
% Descripción: Programa en Prolog que genera una permutación
% aleatoria de los elementos de una lista.
% Se incluye un código comentado de Python.
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
% def rnd_permu(lst):
%     return rnd_select(lst, len(lst))
% 
% if __name__ == '__main__':
%     print(rnd_permu(['a', 'b', 'c', 'd', 'e', 'f']))
% ------------------------------------------------------

% ------------ Código en Prolog ------------------------
% Extrae un número dado de elementos aleatorios de una lista.
% Utiliza un generador de números aleatorios y elimina los elementos seleccionados.
rnd_select(_, 0, []) :- !.
rnd_select(L, N, [X|Xs]) :-
    length(L, Len),
    Len > 0,
    Max is Len + 1,
    random(1, Max, I),
    nth1(I, L, X, Rest),
    N1 is N - 1,
    rnd_select(Rest, N1, Xs).

% Función auxiliar para obtener el elemento en la posición I
element_at(X, [X|_], 1).
element_at(X, [_|T], I) :- I > 1, I1 is I - 1, element_at(X, T, I1).

% Genera una permutación aleatoria de los elementos de una lista.
% Utiliza la selección aleatoria para construir la permutación.
rnd_permu(L, P) :- length(L, Len), rnd_select(L, Len, P).

% Ejemplo de uso:
% ?- rnd_permu([a,b,c,d,e,f], L).
% L = [b,a,d,c,f,e]  % (el resultado puede variar debido a la aleatoriedad)
