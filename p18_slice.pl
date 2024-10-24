% ===============================================
% Autor: Omar Morales
% Fecha: 20 de octubre de 2024
% Descripción: Programa en Prolog que extrae una porción
% de una lista, dado un rango. Los índices I y K deben
% ser mayores que 0.
% Se incluye un código comentado de Python.
% ===============================================

% ---------- Código en Python (Comentado) --------------
% def slice(lst, i, k):
%     return lst[i-1:k]
% 
% if __name__ == '__main__':
%     print(slice(['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'k'], 3, 7))
% ------------------------------------------------------

% ------------ Código en Prolog ------------------------
% Extrae una porción de una lista, dado un rango.
% Los índices I y K deben ser mayores que 0.
slice([H|_], 1, 1, [H]).
slice([H|T], 1, K, [H|R]) :- K > 1, K1 is K - 1, slice(T, 1, K1, R).
slice([_|T], I, K, R) :- I > 1, I1 is I - 1, K1 is K - 1, slice(T, I1, K1, R).

% Función main para ejecutar el programa con ejemplos de uso
main :-
    print("Ejecutando programa 18..."),nl,
    print("Ejecutando: slice([a,b,c,d,e,f,g,h,i,k], 3, 7, R)."),nl,
    slice([a,b,c,d,e,f,g,h,i,k], 3, 7, R)
    format("Resultado: ~s~n", [R]).

% Ejemplo de uso:
% ?- slice([a,b,c,d,e,f,g,h,i,k], 3, 7, R).
% R = [c,d,e,f,g]
