% ===============================================
% Autor: Omar Morales
% Fecha: 20 de octubre de 2024
% Descripción: Programa en Prolog que simula una lotería
% extrayendo N números aleatorios de un rango.
% Se incluye un código comentado de Python.
% ===============================================

% ----------- Código en Python (Comentado) -------------
% import random
% 
% def lotto(n, m):
%     rands = [random.randint(1, m) for _ in range(n)]
%     return rands
% 
% if __name__ == '__main__':
%     print(lotto(6, 49))
% ------------------------------------------------------

% ------------ Código en Prolog ------------------------
% Crea una lista con todos los enteros dentro de un rango dado.
% Caso base: cuando el inicio y el final son iguales.
range(I, I, [I]).
% Caso recursivo: agrega el inicio a la lista y continúa con el siguiente número.
range(I, K, [I|R]) :- I < K, I1 is I + 1, range(I1, K, R).

% Extrae un número dado de elementos aleatorios de una lista.
% Utiliza un generador de números aleatorios y elimina los elementos seleccionados.
rnd_select(_, 0, []).
rnd_select(L, N, [X|R]) :- length(L, Len), random(1, Len, I), element_at(X, L, I), delete(L, X, L1), N1 is N - 1, rnd_select(L1, N1, R).

% Función auxiliar para obtener el elemento en la posición I
element_at(X, [X|_], 1).
element_at(X, [_|T], I) :- I > 1, I1 is I - 1, element_at(X, T, I1).

% Extrae N números aleatorios de un rango dado.
% Utiliza la función range para generar la lista de números y luego selecciona aleatoriamente.
lotto(N, M, L) :- range(1, M, R), rnd_select(R, N, L).

% Función main para ejecutar el programa con ejemplos de uso
main :-
    print("Ejecutando programa 24..."),nl,
    print("Ejecutando: lotto(6, 49, L)."),nl,
    lotto(6, 49, L),
    format("Resultado: ~w~n", [L]).

% Ejemplo de uso:
% ?- lotto(6, 49, L).
% L = [23, 1, 17, 33, 21, 37]  % (el resultado puede variar debido a la aleatoriedad)
