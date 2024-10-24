% ===============================================
% Autor: Omar Morales
% Fecha: 20 de octubre de 2024
% Descripción: Programa en Prolog que crea una lista con
% todos los enteros dentro de un rango dado.
% Se incluye un código comentado de Python.
% ===============================================

% ----------- Código en Python (Comentado) -------------
% def range_list(i, k):
%     if i == k:
%         return [i]
%     return [i] + range_list(i + 1, k)
% 
% if __name__ == '__main__':
%     print(range_list(4, 9))
% ------------------------------------------------------

% ------------ Código en Prolog ------------------------
% Crea una lista con todos los enteros dentro de un rango dado.
% Caso base: cuando el inicio y el final son iguales.
range(I, I, [I]).
% Caso recursivo: agrega el inicio a la lista y continúa con el siguiente número.
range(I, K, [I|R]) :- I < K, I1 is I + 1, range(I1, K, R).

% Función main para ejecutar el programa con ejemplos de uso
main :-
    print("Ejecutando programa 22..."),nl,
    print("Ejecutando: range(4, 9, L)."),nl,
    range(4, 9, L),
    format("Resultado: ~s~n", [L]).

% Ejemplo de uso:
% ?- range(4, 9, L).
% L = [4, 5, 6, 7, 8, 9]
